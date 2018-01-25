module ForexApp.Pages.Exchange.Msg exposing (..)
import StoreLocator.Msg

type Msg =
    OnGbpChange String
  | OnUsdChange String
  | OnDisplaySelectStores Bool
  | SelectStoreMsg StoreLocator.Msg.Msg
  | OnConfirm
