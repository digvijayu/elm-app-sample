module Update exposing (..)

import Msg exposing (Msg)
import Model exposing (Model)
import Global.Update
import Confirm.Update
import Router.Router


(=>) : a -> b -> ( a, b )
(=>) =
    (,)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Msg.RouterMessage location ->
      -- { model | router = Router.Router.update msg model.router }
      let
        ( pageModel, cmd ) =
            Router.Router.update location model.router
      in
      ({ model | router = pageModel } ,cmd)

    Msg.MsgForGlobal submsg ->
      (model, Cmd.none)

    Msg.InitalRouteMsg location ->

      ( model, Cmd.none)


    -- { model
    --     | global = Global.Update.update msg model
    --     , confirm = Confirm.Update.updateCmd msg model
    -- }

updateCmd : Msg -> Cmd Msg
updateCmd msg =
    Cmd.batch
       [
       ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [
        ]
