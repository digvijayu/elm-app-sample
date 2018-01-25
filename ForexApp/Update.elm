module ForexApp.Update exposing (..)
import ForexApp.Model exposing (Model)
import ForexApp.Route exposing (..)
import ForexApp.Msg as Msg exposing (Msg)
import ForexApp.Pages.Exchange.Update
import ForexApp.Pages.Exchange.Model
import Navigation

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
            ForexApp.Pages.Exchange.Update.update subMsg model.exchangePageModel
      in
        ( { model | exchangePageModel = updatedWidgetModel }, Cmd.map Msg.ExchangePageMessage widgetCmd )

    Msg.Other ->
      (model, Cmd.none)

    Msg.ResetForexData ->
      ( { model | exchangePageModel = ForexApp.Pages.Exchange.Model.initialModel }, Navigation.newUrl("#") )
