module Pages.Exchange.Model exposing (..)

type alias Model = { gbpAmount : Float, usdAmount : Float, exchangeRate : Float }
initialModel : Model
initialModel =
  { gbpAmount = 0, usdAmount = 0, exchangeRate = 1.39 }
