module ForexApp.Model exposing (..)
import Navigation exposing (Location)
import ForexApp.Route exposing (Route)
import ForexApp.Pages.Exchange.Model

type alias Model =
  { currentLocation : Location
  , currentRoute : Route
  , exchangePageModel : ForexApp.Pages.Exchange.Model.Model
  }


initAppModel : Location -> Route -> Model
initAppModel location route =
  { currentLocation = location
  , currentRoute = route
  , exchangePageModel = ForexApp.Pages.Exchange.Model.initialModel
  }
