module Confirm.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

view =
  div [] [text "Confirm Page"]

page model =
  div [] [
    getNav
    , div [class "container"] [
      div [] [ div [] [text "Please Check These Details Before Confirming Your Order"]
      , div [] [ span [] [text "Cash"]
        , span [] [text "£20"]
        ]
      , div [] [ span [] [text "Sell Rate"]
        , span [] [text "£1.1040 *"]
        ]
      , div [] [ span [] [text "You Pay"]
        , span [] [text "£200"]
        ]
      , div [] [text "* Rate shown is for pre-order, guaranteed until close of business 16 January, 2018."]
      , div [] [text "CHECKBOX: I agree to the terms and conditions"]
      , button [] [text "Confirm Your Order"]
      ]
    ]
  ]

getNav : Html msg
getNav =
  nav [class "navbar navbar-expand-md navbar-dark fixed-top bg-dark"] [
    a [class "navbar-brand", href "#"] [text "Fixed Navbar"]
    , button [class "navbar-toggler", type_ "button"] [
      span [class "navbar-toggler-icon"] []
    ]
    , div [class "collapse navbar-collapse", id "navbarCollapse"] [
      ul [class "navbar-nav mr-auto"] [
        li [class "nav-item active"] [
          a [class "nav-link", href "#"] [ text "Home"
          , span [class "sr-only"] [text "(current)"] ]
        ]
      , li [class "nav-item"] [ a [class "nav-link", href "#"] [text "Link"]]
      , li [class "nav-item"] [ a [class "nav-link disabled", href "#"] [text "Disabled"]]
      ]
    ]
  ]
