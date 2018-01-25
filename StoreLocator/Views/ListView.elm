module StoreLocator.Views.ListView exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import StoreLocator.Model exposing (Model, Store)
import StoreLocator.Msg exposing (..)

view : Model -> Html Msg
view model =
  ul [ class "list-group mb-3" ]
        (List.map (storeListViewItem model.selectedStore) model.storeList)

storeListViewItem : Maybe Store -> Store -> Html Msg
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
      , onClick (OnStoreSelect store)]
      [ div []
          [ h6 [ class "my-0" ]
              [ text store.area ]
          , small [ ]
              [ text store.address ]
          ]
      , span []
          [ text ((toString store.distance) ++ " miles") ]
      ]
