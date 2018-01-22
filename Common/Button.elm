module Common.Button exposing (..)

import Html exposing (button, text)
import Html.Events exposing (onClick)

type ButtonMsg = ButtonClick


view =
  button [onClick ButtonClick] [text "Button"]
