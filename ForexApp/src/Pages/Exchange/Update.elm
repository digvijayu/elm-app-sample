module Pages.Exchange.Update exposing (..)
import Pages.Exchange.Model exposing (Model)
import Pages.Exchange.Msg as Msg

update : Msg.Msg -> Model -> (Model, Cmd Msg.Msg)
update msg model =
  case msg of
    Msg.OnGbpChange amount ->
      let
        gbpAmt = Result.withDefault 0 (String.toFloat amount)
      in
        ({ model | gbpAmount = gbpAmt, usdAmount = gbpAmt * model.exchangeRate}, Cmd.none)
    Msg.OnUsdChange amount ->
      let
        usdAmt = Result.withDefault 0 (String.toFloat amount)
      in
        ({ model | usdAmount = usdAmt, gbpAmount = usdAmt / model.exchangeRate}, Cmd.none)
    Msg.OnConfirm ->
      (model, Cmd.none)
