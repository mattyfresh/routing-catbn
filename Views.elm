module Views exposing (..)

import Html exposing (..)
import Routes exposing (..)


renderView model =
    case model.route of
        MainPage ->
            homePage model

        AboutPage ->
            aboutPage

        PhotoPage ->
            photoPage


homePage model =
    div [] [ text ("This is the homepage!" ++ (toString model)) ]


aboutPage =
    div [] [ text "This is the about page yah lame-o's!" ]


photoPage =
    div [] [ text "This is the photos page suckers!" ]
