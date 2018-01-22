module Global.Update exposing (..)

-- import Global.Msg exposing (Msg)
-- import Model exposing (Model)
-- import Confirm.Update
--
-- updateWithCmd : Msg -> Model -> ( Model, Cmd Msg )
-- updateWithCmd msg model =
--     ( update msg model, updateCmd msg )
--
-- update : Msg -> Model -> Model
-- update msg model =
--     { model
--         | global = Global.Update.update msg model
--         , transactionList = Confirm.Update.update msg model
--     }
--
-- updateCmd : Msg -> Cmd Msg
-- updateCmd msg =
--     Cmd.batch
--        [ Confirm.Update.updateCmd msg
--        ]
--
--
-- subscriptions : Model -> Sub Msg
-- subscriptions model =
--     Sub.batch
--         [
--         ]
-- update : Msg -> Model -> Model
update msg model =
    { model
      | applicationName = "new name"
        }
