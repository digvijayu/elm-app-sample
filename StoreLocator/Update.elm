module StoreLocator.Update exposing (..)
import StoreLocator.Msg as Msg
import StoreLocator.Model as Model

update : Msg.Msg -> Model.Model -> (Model.Model, Cmd Msg.Msg)
update msg model =
  case msg of
    Msg.OnStoreSelect store ->
      ({ model | selectedStore = Just store }, Cmd.none)
    Msg.OnViewChange ->
      (model , Cmd.none)
    Msg.ChangeView view ->
      ({ model | activeView = view }, Cmd.none)
