module Confirm.Model exposing (..)

type alias Model =
    { isConfirmed : Bool
    }

init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )

initialModel : Model
initialModel =
    { isConfirmed = False
    }
