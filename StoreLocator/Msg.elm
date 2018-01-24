module StoreLocator.Msg exposing (..)
import StoreLocator.Model as Model

type Msg = OnStoreSelect Model.Store
  | OnViewChange
  | ChangeView Model.View
