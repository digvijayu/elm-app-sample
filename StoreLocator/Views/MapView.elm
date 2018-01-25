module StoreLocator.Views.MapView exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import StoreLocator.Model exposing (Model, Store)
import StoreLocator.Msg exposing (..)

view : Model -> Html Msg
view model =
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
          img [ src "/assests/images/map.png", attribute "style" "width: 60%", onClick (OnStoreSelect firstItem) ] []
        ]
      Just selectedStore ->
        div [] [
          img [ src "/assests/images/map-selected.png", attribute "style" "width: 60%", onClick (OnStoreSelect firstItem) ] []
        ]
