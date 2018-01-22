module Router.Model exposing (..)

import Navigation exposing (Location)
import Router.Router exposing (Route)

type alias Model = { currentRoute: Route}


initialModel : Route -> Model
initialModel route =
    { currentRoute = route
    }
