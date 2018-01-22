module Router.Router exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Navigation exposing (Location)
import UrlParser exposing (..)

import Confirm.View
import CurrencyRates.View

-- Routes
type Route
    = Home
    | Confirm
    | NotFoundRoute

-- Models
type alias Model = { currentRoute: Route }
initialModel route =
  { currentRoute = route }

-- Msg
type Msg = OnLocationChange Location
  | InitialLocation


-- Updates
update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
          OnLocationChange location ->
              let
                  newRoute =
                      parseLocation location
              in
                  ( { model | currentRoute = newRoute }, Cmd.none )

          InitialLocation ->
                  ( model, Cmd.none )

updateInitial :  Msg -> Location -> Model -> (Model, Cmd msg)
updateInitial msg location model =
  case msg of
          InitialLocation ->
              let
                  newRoute =
                      parseLocation location
              in
                  ( { model | currentRoute = newRoute }, Cmd.none )

          OnLocationChange location ->
              let
                  newRoute =
                      parseLocation location
              in
                  ( { model | currentRoute = newRoute }, Cmd.none )


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ UrlParser.map Home (UrlParser.s "home")
        , UrlParser.map Confirm (UrlParser.s "confirm")
        , UrlParser.map NotFoundRoute (UrlParser.s "pagenotfound")
        ]

routeToString : Route -> String
routeToString page =
    let
        pieces =
            case page of
                Home ->
                    ["home"]

                Confirm ->
                    [ "confirm" ]

                NotFoundRoute ->
                    [ "pagenotfound" ]
    in
    "#/" ++ String.join "/" pieces


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


-- View

view model =
  div [] [
    page model
  ]

page model =
  case model.currentRoute of
    Home ->
      CurrencyRates.View.view
    Confirm ->
      Confirm.View.view
    NotFoundRoute ->
      div [] [text "Couldn't find page"]


-- PUBLIC HELPERS --


href : Route -> Attribute msg
href route =
    Attr.href (routeToString route)


modifyUrl : Route -> Cmd msg
modifyUrl =
    routeToString >> Navigation.modifyUrl


fromLocation : Location -> Maybe Route
fromLocation location =
    if String.isEmpty location.hash then
        Just Home
    else
        parseHash matchers location
