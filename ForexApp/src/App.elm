module App exposing (..)
import Navigation exposing (Location)
import Model exposing (Model)
import Msg exposing (Msg)
import Update exposing (update)
import Model exposing (Model, initAppModel)
import Route exposing (..)
import View exposing (view)


main : Program Never Model Msg
main =
  Navigation.program Msg.OnRouteChange
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }



subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : Location -> (Model, Cmd msg)
init location =
  let
    currentRoute =
      parseLocation location

  in
    ( initAppModel location currentRoute, Cmd.none )
