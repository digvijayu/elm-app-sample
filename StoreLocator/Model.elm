module StoreLocator.Model exposing (..)

type View = ListView | MapView

type alias Store =
  { address : String
  , area : String
  , lat : Float
  , long : Float
  , distance : Float
  }

type alias Model =
  { activeView : View
  , storeList : List Store
  , selectedStore : Maybe Store
  }

initialModel : Model
initialModel =
  { activeView = ListView
  , storeList = initialStoreList
  , selectedStore = Nothing
  }

initialStoreList : List Store
initialStoreList =
  [
    { address = "Address 1"
    , area = "Brixton"
    , lat = 0
    , long = 0
    , distance = 1.3
    }
  , { address = "Address 2"
    , area = "Hammersmith"
    , lat = 0
    , long = 0
    , distance = 2.4
    }
  , { address = "Address 3"
    , area = "Great Portland"
    , lat = 0
    , long = 0
    , distance = 9.1
    }
  ]
