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
      (model, Cmd.none)
