module StoreLocator.Views.ErrorMessage exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

view : String -> Html msg
view errorMessage =
  div [class "alert alert-danger"] [text errorMessage]
