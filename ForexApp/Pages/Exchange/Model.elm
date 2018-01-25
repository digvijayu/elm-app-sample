module ForexApp.Pages.Exchange.Model exposing (..)
import StoreLocator.Model

type alias Model =
  { gbpAmount : Float
  , usdAmount : Float
  , exchangeRate : Float
  , validGbpValue : Bool
  , validUsdValue : Bool
  , selectedStore : Maybe StoreLocator.Model.Store
  , storeLocatorModel : StoreLocator.Model.Model
  , storeModalIsVisible : Bool
  }


initialModel : Model
initialModel =
  { gbpAmount = 100
  , usdAmount = 139
  , exchangeRate = 1.39
  , validGbpValue = True
  , validUsdValue = True
  , selectedStore = Nothing
  , storeLocatorModel = StoreLocator.Model.initialModel
  , storeModalIsVisible = False
  }
