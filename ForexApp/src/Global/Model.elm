module Global.Model exposing (..)

type alias Model =
    { applicationName : String
    }

init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )

initialModel : Model
initialModel =
    { applicationName = "Thomas Cook Money"
    }
