module App exposing (..)

import Html exposing (..)
import Navigation exposing (Location)

import Model exposing (Model, initialModel)
import Update
import View
import Msg exposing (Msg)
import Router.Router

main : Program Never Model.Model Msg.Msg
main =
    Navigation.program (Msg.InitalRouteMsg)
        { init = init
        , update = Update.update
        , subscriptions = \model -> Sub.none
        , view = View.rootView }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Router.Router.parseLocation location
    in
        ( initialModel currentRoute, Cmd.none )
