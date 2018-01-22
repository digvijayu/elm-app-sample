module Model exposing(..)
import Global.Model
import Confirm.Model
import Router.Router exposing (Route)


type alias Model =
    { global : Global.Model.Model
    , confirm : Confirm.Model.Model
    , router : Router.Router.Model
    }




-- init : ( Model, Cmd msg )
-- init =
--     ( initialModel, Cmd.none )

initialModel : Route -> Model
initialModel route =
    { global = Global.Model.initialModel
    , confirm = Confirm.Model.initialModel
    , router = Router.Router.initialModel route
    }
