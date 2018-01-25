module StoreLocator exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import StoreLocator.Model as Model
import StoreLocator.Msg as Msg
import Http
import Json.Decode as Decode
import Debug exposing (log)



view : Model.Model -> Html Msg.Msg
view model =
  div [ class "col-md-12 order-md-12 mb-12" ]
    [ h4 [ class "d-flex justify-content-between align-items-center mb-3" ]
        [ span [ class "text-muted" ]
            [ text "Select Store" ]
        ]
    , div [class "mb-4"]
      [ button [ classList [("btn", True), ("btn-light", model.activeView /= Model.ListView), ("btn-dark", model.activeView == Model.ListView)], type_ "button", onClick (Msg.ChangeView Model.ListView)]
          [ text "List View" ]
      , button [ classList [("btn", True), ("btn-light", model.activeView /= Model.MapView), ("btn-dark", model.activeView == Model.MapView)], type_ "button",onClick (Msg.ChangeView Model.MapView) ]
          [ text "Map View" ]
      ]
    , loadView model
    ]


loadView : Model.Model -> Html Msg.Msg
loadView model =
  let
    errorInLoadingStores = model.errorInLoadingStores
  in
    case errorInLoadingStores of
      Nothing ->
        if model.isLoadingStores then
          div [class "loader"] [text "Loading...."]
        else
          case model.activeView of
              Model.ListView ->
                listView model
              Model.MapView ->
                mapView model
      Just errorInLoadingStores ->
        div [class "alert alert-danger"] [text errorInLoadingStores]


listView : Model.Model -> Html Msg.Msg
listView model =
  ul [ class "list-group mb-3" ]
        (List.map (storeListViewItem model.selectedStore) model.storeList)

storeListViewItem : Maybe Model.Store -> Model.Store -> Html Msg.Msg
storeListViewItem selectedStore store =
  li [
        classList
        [ ("list-group-item", True)
        , ("d-flex", True)
        , ("justify-content-between", True)
        , ("active",
            case selectedStore of
              Nothing ->
                False
              Just selectedStore ->
                store == selectedStore
          )
        ]
      , onClick (Msg.OnStoreSelect store)]
      [ div []
          [ h6 [ class "my-0" ]
              [ text store.area ]
          , small [ ]
              [ text store.address ]
          ]
      , span []
          [ text ((toString store.distance) ++ " miles") ]
      ]

mapView : Model.Model -> Html Msg.Msg
mapView model =
  let
    (firstItem, selectedStore) = ({ address = "Address 1"
    , area = "Brixton"
    , lat = 0
    , long = 0
    , distance = 1.3
    }, model.selectedStore)
  in
    case selectedStore of
      Nothing ->
        div [] [
          img [ src "/assests/images/map.png", attribute "style" "width: 60%", onClick (Msg.OnStoreSelect firstItem) ] []
        ]
      Just selectedStore ->
        div [] [
          img [ src "/assests/images/map-selected.png", attribute "style" "width: 60%", onClick (Msg.OnStoreSelect firstItem) ] []
        ]

loadStores : Cmd Msg.Msg
loadStores =
  let
    some = log "I am here" 1
  in
    Http.get "/assests/data/store-list.json" storeListDecoder
    |> Http.send Msg.DefferedStoresLoadedFromServer


decodeMetadata : Decode.Decoder Model.Store
decodeMetadata =
  Decode.map5 Model.Store
    (Decode.field "address" Decode.string)
    (Decode.field "area" Decode.string)
    (Decode.field "lat" Decode.float)
    (Decode.field "long" Decode.float)
    (Decode.field "distance" Decode.float)

storeListDecoder : Decode.Decoder (List Model.Store)
storeListDecoder =
  Decode.list decodeMetadata
