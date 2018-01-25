module ForexApp.App.Pages.Exchange.Update exposing (..)
import ForexApp.App.Pages.Exchange.Model exposing (Model)
import ForexApp.App.Pages.Exchange.Msg as Msg
import StoreLocator.Update
import StoreLocator
import Navigation

update : Msg.Msg -> Model -> (Model, Cmd Msg.Msg)
update msg model =
  case msg of
    Msg.OnGbpChange amount ->
      let
        gbpAmt = Result.withDefault 0 (String.toFloat amount)
      in
        (
          { model
          | gbpAmount = gbpAmt
          , usdAmount = if gbpAmt > 0 then gbpAmt * model.exchangeRate else 0
          , validGbpValue = gbpAmt > 0
          , validUsdValue = True
          }
          , Cmd.none
        )
    Msg.OnUsdChange amount ->
      let
        usdAmt = Result.withDefault 0 (String.toFloat amount)
      in
        (
          { model
          | usdAmount = usdAmt
          , gbpAmount = if usdAmt > 0 then usdAmt / model.exchangeRate else 0
          , validGbpValue = True
          , validUsdValue = usdAmt > 0
          }
          , Cmd.none
        )
    Msg.OnConfirm ->
      (model, Navigation.newUrl "#confirm")

    Msg.OnDisplaySelectStores isModalVisible ->
      ( { model | storeModalIsVisible = isModalVisible }, Cmd.map Msg.SelectStoreMsg StoreLocator.loadStores)

    Msg.SelectStoreMsg subMsg->
      let
        (widgetModel, widgetCmd) =
          StoreLocator.Update.update subMsg model.storeLocatorModel
      in
        ( { model | storeLocatorModel = widgetModel }, Cmd.map Msg.SelectStoreMsg widgetCmd )
