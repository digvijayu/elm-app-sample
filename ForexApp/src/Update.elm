module Update exposing (..)
import Model exposing (Model)
import Route exposing (..)
import Msg exposing (Msg)
import Pages.Exchange.Update

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Msg.OnRouteChange location ->
      let
        currentRoute =
        parseLocation location

      in
        ({ model | currentLocation = location, currentRoute = currentRoute}, Cmd.none)

    Msg.ExchangePageMessage subMsg ->
      let
        ( updatedWidgetModel, widgetCmd ) =
            Pages.Exchange.Update.update subMsg model.exchangePageModel
      in
        ( { model | exchangePageModel = updatedWidgetModel }, Cmd.map Msg.ExchangePageMessage widgetCmd )

    Msg.Other ->
      (model, Cmd.none)
