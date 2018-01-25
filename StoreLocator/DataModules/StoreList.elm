module StoreLocator.DataModules.StoreList exposing (..)
import Http
import Json.Decode as Decode
import Debug exposing (log)
import StoreLocator.Msg exposing (..)
import StoreLocator.Model exposing (Model, Store)

loadStores : Cmd Msg
loadStores =
  let
    someLogMsg = log "Loading the Store List.. " 1
  in
    Http.get "/assests/data/store-list.json" storeListDecoder
    |> Http.send DefferedStoresLoadedFromServer


decodeMetadata : Decode.Decoder Store
decodeMetadata =
  Decode.map5 Store
    (Decode.field "address" Decode.string)
    (Decode.field "area" Decode.string)
    (Decode.field "lat" Decode.float)
    (Decode.field "long" Decode.float)
    (Decode.field "distance" Decode.float)

storeListDecoder : Decode.Decoder (List Store)
storeListDecoder =
  Decode.list decodeMetadata
