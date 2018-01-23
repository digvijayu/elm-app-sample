module ForexApp.App.Model exposing (..)
import Navigation exposing (Location)
import ForexApp.App.Route exposing (Route)
import ForexApp.App.Pages.Exchange.Model

type alias Model =
  { currentLocation : Location
  , currentRoute : Route
  , exchangePageModel : ForexApp.App.Pages.Exchange.Model.Model
  }


initAppModel : Location -> Route -> Model
initAppModel location route =
  { currentLocation = location
  , currentRoute = route
  , exchangePageModel = ForexApp.App.Pages.Exchange.Model.initialModel
  }
