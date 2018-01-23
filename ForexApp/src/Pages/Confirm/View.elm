module Pages.Confirm.View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

view : Html msg
view =
  div []
    [ main_ [ class "container", attribute "role" "main" ]
        [ div [ class "jumbotron" ]
            [ h1 []
                [ text "Navbar example" ]
            , p [ class "lead" ]
                [ text "This example is a quick exercise to illustrate how fixed to top navbar works. As you scroll, it will remain fixed to the top of your browser's viewport." ]
            , a [ class "btn btn-lg btn-primary", href "#", attribute "role" "button" ]
                [ text "Go to Home Page" ]
            ]
        ]
    ]
