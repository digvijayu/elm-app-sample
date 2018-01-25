module StoreLocator.Views.LoadingSpinner exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

view : Html msg
view =
  div [class "loader"] [text "Loading...."]
