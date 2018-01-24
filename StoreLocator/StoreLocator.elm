module StoreLocator exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import StoreLocator.Model as Model
import StoreLocator.Msg as Msg


view : Model.Model -> Html Msg.Msg
view model =
  div [ class "col-md-12 order-md-12 mb-12" ]
    [ h4 [ class "d-flex justify-content-between align-items-center mb-3" ]
        [ span [ class "text-muted" ]
            [ text "Select Store" ]
        ]
    , ul [ class "list-group mb-3" ]
        (List.map (storeListViewItem model.selectedStore) model.storeList)
    ]

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
