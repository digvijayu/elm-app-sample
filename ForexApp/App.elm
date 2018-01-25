module ForexApp exposing (..)
import Navigation exposing (Location)
import ForexApp.Model exposing (Model)
import ForexApp.Msg exposing (Msg)
import ForexApp.Update exposing (update)
import ForexApp.Model exposing (Model, initAppModel)
import ForexApp.Route exposing (..)
import ForexApp.View exposing (view)


main : Program Never Model Msg
main =
  Navigation.program ForexApp.Msg.OnRouteChange
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
