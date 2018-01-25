module StoreLocator.Update exposing (..)
import StoreLocator.Msg as Msg
import StoreLocator.Model as Model
import Debug exposing (log)
import Time exposing (Time)
import Process exposing (..)
import Task exposing (..)

update : Msg.Msg -> Model.Model -> (Model.Model, Cmd Msg.Msg)
update msg model =
  case msg of
    Msg.OnStoreSelect store ->
      ({ model | selectedStore = Just store }, Cmd.none)
    Msg.OnViewChange ->
      (model , Cmd.none)
    Msg.ChangeView view ->
      ({ model | activeView = view }, Cmd.none)
    Msg.StoresLoadedFromServer serverResponse ->
      let
        some = log "update" serverResponse
      in
        case serverResponse of
          Ok responseData ->
            ({ model | isLoadingStores = False, errorInLoadingStores = Nothing, storeList = responseData }, Cmd.none)
          Err _ ->
            ({ model | isLoadingStores = False, errorInLoadingStores = Just "Unable to load stores.", storeList = [] }, Cmd.none)

    Msg.DefferedStoresLoadedFromServer serverResponse ->
      model
      ! [ delay (Time.second * 2) <| Msg.StoresLoadedFromServer serverResponse ]



delay : Time -> msg -> Cmd msg
delay time msg =
  Process.sleep time
  |> Task.andThen (always <| Task.succeed msg)
  |> Task.perform identity
