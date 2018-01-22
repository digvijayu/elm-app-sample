module Router.Update exposing (..)

import Router.Msg exposing (Msg)
import Router.Model exposing (Model)

update: Msg -> Model -> Model
update msg model =
  model
