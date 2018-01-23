module Msg exposing (..)
import Navigation exposing (Location)
import Pages.Exchange.Msg

type Msg = OnRouteChange Location
  | ExchangePageMessage Pages.Exchange.Msg.Msg
  | Other
