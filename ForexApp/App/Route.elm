module ForexApp.App.Route exposing (..)
import Navigation exposing (..)
import UrlParser exposing (..)

type Route = Home
  | ConfirmPage
  | NotFoundRoute

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ UrlParser.map Home top
        , UrlParser.map ConfirmPage (UrlParser.s "confirm")
        ]

parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
