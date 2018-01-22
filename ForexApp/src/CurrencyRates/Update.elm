module CurrencyRates exposing (..)

import CurrencyRates.Msg exposing (Msg)
import CurrencyRates.Model exposing (Model)

update:  Msg -> Model -> Model
update msg model =
  model
