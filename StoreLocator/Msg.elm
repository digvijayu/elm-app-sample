module StoreLocator.Msg exposing (..)
import StoreLocator.Model as Model
import Http

type Msg = OnStoreSelect Model.Store
  | OnViewChange
  | ChangeView Model.View
  | StoresLoadedFromServer ( Result Http.Error (List Model.Store) )
  | DefferedStoresLoadedFromServer ( Result Http.Error (List Model.Store) )
