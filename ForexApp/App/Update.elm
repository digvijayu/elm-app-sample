module ForexApp.App.Update exposing (..)
import ForexApp.App.Model exposing (Model)
import ForexApp.App.Route exposing (..)
import ForexApp.App.Msg as Msg exposing (Msg)
import ForexApp.App.Pages.Exchange.Update

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
            ForexApp.App.Pages.Exchange.Update.update subMsg model.exchangePageModel
      in
        ( { model | exchangePageModel = updatedWidgetModel }, Cmd.map Msg.ExchangePageMessage widgetCmd )

    Msg.Other ->
      (model, Cmd.none)
