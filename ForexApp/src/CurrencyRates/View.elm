module CurrencyRates.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

view =
  div [] [text "Currency Rates Page", a [href "#confirm"] [text "Go to confirm page"]]
