module Pages.Exchange.View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Pages.Exchange.Model exposing (Model)
import Pages.Exchange.Msg as Msg

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
                ]
            , hr [ class "mb-4" ]
                []
            , button [ class "btn btn-lg btn-primary", disabled (not (model.validUsdValue && model.validGbpValue)), onClick Msg.OnConfirm, attribute "role" "button" ]
                [ text "Go to Confirm Page" ]
            ]
        ]
    ]
