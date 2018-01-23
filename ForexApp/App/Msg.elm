module ForexApp.App.Msg exposing (..)
import Navigation exposing (Location)
import ForexApp.App.Pages.Exchange.Msg

type Msg = OnRouteChange Location
  | ExchangePageMessage ForexApp.App.Pages.Exchange.Msg.Msg
  | Other
