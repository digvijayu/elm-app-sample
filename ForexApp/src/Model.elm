module Model exposing (..)
import Navigation exposing (Location)
import Route exposing (Route)
import Pages.Exchange.Model

type alias Model =
  { currentLocation : Location
  , currentRoute : Route
  , exchangePageModel : Pages.Exchange.Model.Model
  }


initAppModel : Location -> Route -> Model
initAppModel location route =
  { currentLocation = location
  , currentRoute = route
  , exchangePageModel = Pages.Exchange.Model.initialModel
  }
