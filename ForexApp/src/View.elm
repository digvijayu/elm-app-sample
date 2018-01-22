module View exposing (..)

import Model exposing (Model)
import Global.Msg exposing (Msg)
import Confirm.View as ConfirmView
import Router.Router
import Html exposing (..)
import Html.Attributes exposing (..)

-- rootView : Model -> Html Msg
rootView model =
    div [ class "container" ]
        [ Router.Router.view model.router ]
