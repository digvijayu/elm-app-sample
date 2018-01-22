module Common.CurrencyInput exposing (..)

import Html exposing (input, text)
import Html.Events exposing (onBlur, onFocus)

type CurrencyInputMsg = Blur
    | Focus


view =
  input [onBlur Blur, onFocus Focus ] [text "Input"]
