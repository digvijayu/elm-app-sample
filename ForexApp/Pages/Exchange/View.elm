module ForexApp.Pages.Exchange.View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import ForexApp.Pages.Exchange.Model exposing (Model)
import ForexApp.Pages.Exchange.Msg as Msg
import StoreLocator.Model
import StoreLocator

view : Model -> Html Msg.Msg
view model =
  div [ class "container" ]
    [ div [ class "col-md-8 order-md-1" ]
        [ h4 [ class "mb-3" ]
            [ text "How Much Would You Like?" ]
        , Html.form [ class "needs-validation", attribute "novalidate" "" ]
            [ div [ class "column" ]
                [ div [ class "col-md-6 mb-3" ]
                    [ label [ for "GBP" ]
                        [ text "GBP Amount" ]
                    , input [ class "form-control", placeholder "", attribute "required" "", type_ "number", value (toString model.gbpAmount), onInput Msg.OnGbpChange ]
                        []
                    , div
                        [  classList
                          [ ("invalid-feedback", True)
                          , ("d-block", not model.validGbpValue)
                          ]
                        ]
                        [ text "Valid GBP amount is required.                " ]
                    ]
                , div [ class "col-md-6 mb-3" ]
                    [ label [ for "ExchangeRate" ]
                        [ text "Exchange Rate" ]
                    , div [class "input-group"]
                      [ div [class "input-group-prepend"]
                        [ span [class "input-group-text"] [text "@"] ]
                      , input
                        [ class "form-control", readonly True, placeholder "", attribute "required" "", type_ "number", value (toString model.exchangeRate)  ]
                          []
                      ]
                    ]
                , div [ class "col-md-6 mb-3" ]
                    [ label [ for "USD" ]
                        [ text "USD Amount" ]
                    , input [ class "form-control", placeholder "", attribute "required" "", type_ "number", value (toString model.usdAmount), onInput Msg.OnUsdChange  ]
                        []
                    , div
                        [  classList
                          [ ("invalid-feedback", True)
                          , ("d-block", not model.validUsdValue)
                          ]
                        ]
                        [ text "Valid last name is required.                " ]
                    ]
                , selectedStore model.storeLocatorModel.selectedStore
                ]
            , hr [ class "mb-4" ]
                []
            , button [ class "btn btn-lg btn-primary", disabled (disableConfirm model), attribute "role" "button", onClick Msg.OnConfirm]
                [ text "Confirm" ]
            ]
      ]
    , modal (Html.map Msg.SelectStoreMsg (StoreLocator.view model.storeLocatorModel)) model.storeModalIsVisible
    ]


disableConfirm : Model -> Bool
disableConfirm model =
  let
    selectedStore = model.storeLocatorModel.selectedStore
  in
  case selectedStore of
    Nothing ->
      True
    Just selectedStore ->
      not(model.validUsdValue && model.validGbpValue)


selectedStore : Maybe StoreLocator.Model.Store -> Html Msg.Msg
selectedStore store =
  case store of
    Nothing ->
      div [ class "list-group-item d-flex justify-content-between bg-light", onClick (Msg.OnDisplaySelectStores True)]
          [ div []
              [ h6 [ class "my-0" ]
                  [ text "Click here to select store" ]
              , small [ class "text-muted" ]
                  [ text "" ]
              ]
          , span [ class "text-muted" ]
              [ text "" ]
          ]

    Just store ->
      div [ class "list-group-item d-flex justify-content-between bg-light", onClick (Msg.OnDisplaySelectStores True)]
          [ div []
              [ h6 [ class "my-0" ]
                  [ text store.area ]
              , small [ class "text-muted" ]
                  [ text store.address ]
              ]
          , span [ class "text-muted" ]
              [ text ((toString store.distance) ++ "miles") ]
          ]

modal : Html Msg.Msg -> Bool -> Html Msg.Msg
modal html isVisible =
  if isVisible == True then
    div [] [
      div [ attribute "aria-labelledby" "exampleModalLiveLabel"
            , classList
              [ ("modal", True)
              , ("fade", True)
              , ("show", True)
              ]
            , id "exampleModalLive", attribute "role" "dialog", attribute "style" "display: block;", attribute "tabindex" "-1" ]
        [ div [ class "modal-dialog", attribute "role" "document" ]
            [ div [ class "modal-content" ]
                [ div [ class "modal-header" ]
                    [ h5 [ class "modal-title", id "exampleModalLiveLabel" ]
                        [ text "Modal title" ]
                    , button [ attribute "aria-label" "Close", class "close", attribute "data-dismiss" "modal", type_ "button" ]
                        [ span [ attribute "aria-hidden" "true" ]
                            [ text "×" ]
                        ]
                    ]
                , div [ class "modal-body" ]
                    [
                      html
                    ]
                , div [ class "modal-footer"]
                    [ button [ class "btn btn-primary", type_ "button", onClick (Msg.OnDisplaySelectStores False)]
                        [ text "Close" ]
                    ]
                ]
            ]
        ]
      , div [
        classList
        [ ("modal-backdrop", True)
        , ("fade", True)
        , ("show", True)
        ]] []
    ]
  else
    div [] []
