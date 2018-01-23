module HolidaysApp exposing (..)
import Html exposing (..)
import HolidaysApp.App.View as View
import HolidaysApp.App.Model as Model
import HolidaysApp.App.Update as Update
import HolidaysApp.App.Msg as Msg

main : Program Never Model.Model Msg.Msg
main =
  Html.program
  { init = init
  , view = View.view
  , update = Update.update
  , subscriptions = subscriptions
  }

subscriptions : Model.Model -> Sub Msg.Msg
subscriptions model =
    Sub.none


init : (Model.Model, Cmd msg)
init =
    ( Model.initialModel, Cmd.none )
