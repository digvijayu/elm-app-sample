module HolidaysApp.App.Update exposing (..)
import HolidaysApp.App.Msg as HolidaysAppMsg
import HolidaysApp.App.Model as HolidaysAppModel
import ForexApp.App.Update as ForexAppUpdate

update : HolidaysAppMsg.Msg -> HolidaysAppModel.Model -> ( HolidaysAppModel.Model, Cmd HolidaysAppMsg.Msg )
update msg model =
  case msg of
    HolidaysAppMsg.AppMessage ->
      ( model, Cmd.none )
    HolidaysAppMsg.ForexAppMsg subMsg ->
      let
          ( forexModel, forexcmd ) =
            ForexAppUpdate.update subMsg model.forexAppModel
      in
        ( { model | forexAppModel = forexModel }, Cmd.map HolidaysAppMsg.ForexAppMsg forexcmd )
