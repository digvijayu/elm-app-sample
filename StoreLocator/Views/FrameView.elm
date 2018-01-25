module StoreLocator.Views.FrameView exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import StoreLocator.Model exposing (..)
import StoreLocator.Msg exposing (..)

view : Model -> Html Msg
view model =
  div [] [
    h4 [ class "d-flex justify-content-between align-items-center mb-3" ]
        [ span [ class "text-muted" ]
            [ text "Select Store" ]
        ]
    , div [class "mb-4"]
      [ button [ classList [("btn", True), ("btn-light", model.activeView /= ListView), ("btn-dark", model.activeView == ListView)], type_ "button", onClick (ChangeView ListView)]
          [ text "List View" ]
      , button [ classList [("btn", True), ("btn-light", model.activeView /= MapView), ("btn-dark", model.activeView == MapView)], type_ "button",onClick (ChangeView MapView) ]
          [ text "Map View" ]
      ]
  ]
