module StoreLocator exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import StoreLocator.Model as Model
import StoreLocator.Msg as Msg
import StoreLocator.Views.ListView
import StoreLocator.Views.MapView
import StoreLocator.Views.LoadingSpinner
import StoreLocator.Views.FrameView
import StoreLocator.Views.ErrorMessage


view : Model.Model -> Html Msg.Msg
view model =
  div [ class "col-md-12 order-md-12 mb-12" ]
    [ StoreLocator.Views.FrameView.view model
    , loadView model
    ]


loadView : Model.Model -> Html Msg.Msg
loadView model =
  let
    errorInLoadingStores = model.errorInLoadingStores
  in
    case errorInLoadingStores of
      Nothing ->
        if model.isLoadingStores then
          StoreLocator.Views.LoadingSpinner.view
        else
          case model.activeView of
              Model.ListView ->
                StoreLocator.Views.ListView.view model
              Model.MapView ->
                StoreLocator.Views.MapView.view model
      Just errorInLoadingStores ->
        StoreLocator.Views.ErrorMessage.view errorInLoadingStores
