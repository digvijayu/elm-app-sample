module CurrencyRates.Model exposing (..)

type alias Model = { toRate: Float, fromRate: Float }

initialModel =
  { toRate = 0, fromRate = 0 }
