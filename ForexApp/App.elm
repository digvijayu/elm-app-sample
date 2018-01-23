module ForexApp.App exposing (..)
import Navigation exposing (Location)
import ForexApp.App.Model exposing (Model)
import ForexApp.App.Msg exposing (Msg)
import ForexApp.App.Update exposing (update)
import ForexApp.App.Model exposing (Model, initAppModel)
import ForexApp.App.Route exposing (..)
import ForexApp.App.View exposing (view)


main : Program Never Model Msg
main =
  Navigation.program ForexApp.App.Msg.OnRouteChange
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
