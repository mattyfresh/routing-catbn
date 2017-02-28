module Views exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)


-- my own modules

import Routes exposing (..)
import Updates exposing (..)
import Models exposing (..)
import BandInfo exposing (..)


renderView : Model -> Html Msg
renderView model =
    case model.route of
        MainPage ->
            mainPage model

        AboutPage ->
            aboutPage model

        PhotoPage ->
            photoPage model


mainPage : Model -> Html Msg
mainPage model =
    div [ class "main__container" ]
        [ sharedTopNav model
        , div []
            [ h2 [ attribute "style" "text-align: center;font-family: monospace; font-weight: normal; margin-top: 0; padding: 20px;" ] [ text "Tunes coming this week!  Sahhh!" ]
            , img
                [ id "main-image"
                , src "images/run-compressed.gif"
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


sharedTopNav : Model -> Html Msg
sharedTopNav model =
    div [ class "shared__top" ]
        [ nav [ class "main__container-nav" ]
            [ a [ onClick NavigateToHome, attribute "style" "padding: 10px; cursor: pointer; font-family: sans-serif;" ] [ text "Home" ]
            , a [ onClick NavigateToAbout, attribute "style" "padding: 10px; cursor: pointer; margin-left: 20px; font-family: sans-serif;" ] [ text "About" ]
            , a [ onClick NavigateToPhotos, attribute "style" "padding: 10px; cursor: pointer; margin-left: 20px; font-family: sans-serif;" ] [ text "Photos" ]
            ]
        , h1 [ attribute "style" "text-align: center;font-family: monospace; font-size: 40px; font-weight: normal; margin-bottom: 0; padding: 12px;" ]
            [ text ("Carter and the " ++ model.bandName) ]
        ]


renderBios : BandMember -> Html a
renderBios bio =
    ul [ attribute "style" "list-style-type: none; text-align: center; padding: 0; width: 90%; margin: auto;" ]
        [ li [ attribute "style" "display: block;", class "bio__name" ] [ text bio.name ]
        , li [] [ img [ src bio.imageUrl ] [] ]
        , li [ class "bio__quote" ] [ text bio.quote ]
        ]


aboutPage : Model -> Html Msg
aboutPage model =
    div [ class "main__container" ]
        [ sharedTopNav model
        , div []
            [ h2 [ attribute "style" "text-align: center;font-family: monospace; font-weight: normal; margin-top: 0; padding: 20px;" ] [ text "About Us" ]
            , div [] (List.map renderBios bandMembers)
            ]
        ]


photoPage : Model -> Html Msg
photoPage model =
    div [ class "main__container" ]
        [ sharedTopNav model
        , div []
            [ h2 [ attribute "style" "text-align: center;font-family: monospace; font-weight: normal; margin-top: 0; padding: 20px;" ] [ text "Photos" ]
            , div [ class "image-wrapper" ] [ img [ src "images/pirate-flag.jpg", alt "Weird Pirate Days" ] [] ]
            , div [ class "image-wrapper" ] [ img [ src "images/the-gang.jpg", alt "CATBN" ] [] ]
            , div [ class "image-wrapper" ] [ img [ src "images/carter-sah.jpg", alt "Carter, sah dude!" ] [] ]
            , div [ class "image-wrapper" ] [ img [ src "images/matty-recording.jpg", alt "Matty hitting the shred button" ] [] ]
            , div [ class "image-wrapper" ] [ img [ src "images/tony-pointing.jpg", alt "Tony Derby making me smell his finger" ] [] ]
            ]
        ]
