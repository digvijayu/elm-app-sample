module HolidaysApp.App.Model exposing (..)
import ForexApp.App.Model as ForexAppModel
import ForexApp.App.Route as ForexAppRoutes

type alias Model =
  { someString : String
  , forexAppModel : ForexAppModel.Model
  }

initialModel : Model
initialModel =
  let
    location = { href = "String"
    , host = "String"
    , hostname = "String"
    , protocol = "String"
    , origin = "String"
    , port_ = "String"
    , pathname = "String"
    , search = "String"
    , hash = "String"
    , username = "String"
    , password = "String"
    }
  in
    { someString = "Welcom to Thomas Cook"
    , forexAppModel = ForexAppModel.initAppModel location ForexAppRoutes.Home
    }
