module HolidaysApp.App.View exposing (..)
import HolidaysApp.App.Model as Model
import Html exposing (..)
import Html.Attributes exposing (..)
import ForexApp.App.View as ForexAppView
import HolidaysApp.App.Msg as HolidaysAppMsg

view : Model.Model -> Html HolidaysAppMsg.Msg
view model =
  div [ class "container col-md-4 order-md-2 mb-4" ]
    [ h4 [ class "d-flex justify-content-between align-items-center mb-3" ]
        [ span [ class "text-muted" ]
            [ text "3 Holidays Found" ]
        ]
    , ul [ class "list-group mb-3" ]
        [ li [ class "list-group-item d-flex justify-content-between lh-condensed" ]
            [ div []
                [ h6 [ class "my-0" ]
                    [ text "Sandos Papagayo Beach Resort" ]
                , small [ class "text-muted" ]
                    [ text "Spain, Canary Islands, Lanzarote, Playa Blanca" ]
                ]
            , span [ class "text-muted" ]
                [ text "£864 pp" ]
            ]
        , li [ class "list-group-item d-flex justify-content-between lh-condensed" ]
            [ div []
                [ h6 [ class "my-0" ]
                    [ text "Barcelo Teguise Beach" ]
                , small [ class "text-muted" ]
                    [ text "Spain, Canary Islands, Lanzarote, Costa Teguise" ]
                ]
            , span [ class "text-muted" ]
                [ text ("£1,307 pp") ]
            ]
        , li [ class "list-group-item d-flex justify-content-between lh-condensed" ]
            [ div []
                [ h6 [ class "my-0" ]
                    [ text "SENTIDO Aequora Lanzarote" ]
                , small [ class "text-muted" ]
                    [ text "Spain, Canary Islands, Lanzarote, Los Pocillos" ]
                ]
            , span [ class "text-muted" ]
                [ text "£768 pp" ]
            ]
        ]
    , Html.form [ class "card p-2" ]
        [ div [ class "input-group" ]
            [ button [ class "btn btn-lg btn-primary", attribute "role" "button" ]
                [ text "Currency Exchange" ]
            ]
        ]
    , div [] [
        Html.map HolidaysAppMsg.ForexAppMsg ( ForexAppView.view model.forexAppModel )
      ]
    ]
