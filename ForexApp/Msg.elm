module ForexApp.Msg exposing (..)
import Navigation exposing (Location)
import ForexApp.Pages.Exchange.Msg

type Msg = OnRouteChange Location
  | ExchangePageMessage ForexApp.Pages.Exchange.Msg.Msg
  | ResetForexData
  | Other
