module Views exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)


-- my own modules

import Routes exposing (..)
import Updates exposing (..)
import Models exposing (..)
import BandInfo exposing (..)


renderView model =
    case model.route of
        MainPage ->
            mainPage model

        AboutPage ->
            aboutPage model

        PhotoPage ->
            photoPage



-- @TODO get rid of this sh!t


imageStyles : List ( String, String )
imageStyles =
    [ ( "border", "solid black 4px" )
    , ( "display", "block" )
    , ( "margin", "auto" )
    , ( "max-width", "660px" )
    , ( "width", "100%" )
    ]


mainPage model =
    div [ class "main__container" ]
        [ nav [ class "main__container-nav" ]
            [ a [ onClick NavigateToHome, attribute "style" "padding: 10px; cursor: pointer; font-family: sans-serif;" ] [ text "Home" ]
            , a [ onClick NavigateToAbout, attribute "style" "padding: 10px; cursor: pointer; margin-left: 20px; font-family: sans-serif;" ] [ text "About" ]
            ]
        , h1 [ attribute "style" "text-align: center;font-family: monospace; font-size: 40px; font-weight: normal; margin-bottom: 0; padding: 12px;" ]
            [ text ("Carter and the " ++ model.bandName) ]
        , div []
            [ h2 [ attribute "style" "text-align: center;font-family: monospace; font-weight: normal; margin-top: 0; padding: 20px;" ] [ text "Tunes coming soon!" ]
            , img
                [ id "main-image"
                , src "images/run.gif"
                , style imageStyles
                ]
                []
            , input
                [ placeholder "Change our band name yah dude!"
                , onInput ChangeBandName
                , attribute "style" "display: block; height: 34px; font-size: 16px; width: 50%;max-width: 500px; min-width: 300px; margin: 20px auto 0; font-family: monospace;"
                ]
                []
            , div [ style [ ( "text-align", "center" ) ] ]
                [ a
                    [ href ("mailto:matthew.padich@gmail.com?subject=Carter and the " ++ model.bandName)
                    , attribute "style" "font-family: monospace; font-size: 16px; color: black; display: inline-block; margin: 60px 0 30px; padding: 10px;"
                    ]
                    [ text "Email Us!" ]
                ]
            ]
        ]


renderBios : BandMember -> Html a
renderBios bio =
    ul [ attribute "style" "list-style-type: none; text-align: center; padding: 0; width: 90%; margin: auto;" ]
        [ li [ attribute "style" "display: block;", class "bio__name" ] [ text bio.name ]
        , li [] [ img [ src bio.imageUrl, style imageStyles ] [] ]
        , li [ class "bio__quote" ] [ text bio.quote ]
        ]


aboutPage model =
    div [ class "main__container" ]
        [ nav [ class "main__container-nav" ]
            [ a [ onClick NavigateToHome, attribute "style" "padding: 10px; cursor: pointer; font-family: sans-serif;" ] [ text "Home" ]
            , a [ onClick NavigateToAbout, attribute "style" "padding: 10px; cursor: pointer; margin-left: 20px; font-family: sans-serif;" ] [ text "About" ]
            ]
        , h1 [ attribute "style" "text-align: center;font-family: monospace; font-size: 40px; font-weight: normal; margin-bottom: 0; padding: 12px;" ]
            [ text ("Carter and the " ++ model.bandName) ]
        , div []
            [ h2 [ attribute "style" "text-align: center;font-family: monospace; font-weight: normal; margin-top: 0; padding: 20px;" ] [ text "About Us" ]
            , div [] (List.map renderBios bandMembers)
            ]
        ]


photoPage =
    div [] [ text "This is the photos page suckers!" ]
