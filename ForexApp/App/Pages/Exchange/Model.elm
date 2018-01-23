module ForexApp.App.Pages.Exchange.Model exposing (..)

type alias Model =
  { gbpAmount : Float
  , usdAmount : Float
  , exchangeRate : Float
  , validGbpValue : Bool
  , validUsdValue : Bool
  }


initialModel : Model
initialModel =
  { gbpAmount = 100
  , usdAmount = 139
  , exchangeRate = 1.39
  , validGbpValue = True
  , validUsdValue = True
  }
