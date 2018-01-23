module View exposing(..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Model)
import Route exposing (Route)
import Msg exposing (Msg)

import Pages.Exchange.View
import Pages.Confirm.View


view : Model -> Html Msg
view model =
  div [] [
  div [] [
    nav [ class "navbar navbar-expand-md navbar-dark fixed-top bg-dark" ]
        [ a [ class "navbar-brand", href "#" ]
            [ text "Fixed navbar" ]
        , button [ attribute "aria-controls" "navbarCollapse", attribute "aria-expanded" "false", attribute "aria-label" "Toggle navigation", class "navbar-toggler", attribute "data-target" "#navbarCollapse", attribute "data-toggle" "collapse", type_ "button" ]
            [ span [ class "navbar-toggler-icon" ]
                []
            ]
        , div [ class "collapse navbar-collapse", id "navbarCollapse" ]
            [ ul [ class "navbar-nav mr-auto" ]
                [ li [ class "nav-item active" ]
                    [ a [ class "nav-link", href "#" ]
                        [ text "Home "
                        , span [ class "sr-only" ]
                            [ text "(current)" ]
                        ]
                    ]
                , li [ class "nav-item" ]
                    [ a [ class "nav-link", href "#" ]
                        [ text "Link" ]
                    ]
                , li [ class "nav-item" ]
                    [ a [ class "nav-link disabled", href "#" ]
                        [ text "Disabled" ]
                    ]
                ]
            , Html.form [ class "form-inline mt-2 mt-md-0" ]
                [ input [ attribute "aria-label" "Search", class "form-control mr-sm-2", placeholder "Search", type_ "text" ]
                    []
                , button [ class "btn btn-outline-success my-2 my-sm-0", type_ "submit" ]
                    [ text "Search" ]
                ]
            ]
        ]
  ]
  , getPage model
  ]

getPage : Model -> Html Msg
getPage model =
  case model.currentRoute of
    Route.Home ->
      home model
    Route.ConfirmPage ->
      confirmPage model
    Route.NotFoundRoute ->
      notFoundPage

home : Model -> Html Msg
home model =
  Html.map Msg.ExchangePageMessage (Pages.Exchange.View.view model.exchangePageModel)

confirmPage : Model -> Html msg
confirmPage model =
  Pages.Confirm.View.view model

notFoundPage : Html msg
notFoundPage =
  div [] [text "404 Page not found", a [href "#"] [text "Home"]]
