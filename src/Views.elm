module Views exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)
import Updates exposing (..)
import Models exposing (..)
import BandInfo exposing (..)


renderView : Model -> Html Msg
renderView model =
    case model.page of
        Home ->
            mainPage model

        About ->
            aboutPage model

        Photos ->
            photoPage model


mainPage : Model -> Html Msg
mainPage model =
    div [ class "main__container" ]
        [ sharedTopNav model
        , div []
            [ div [ class "video__wrapper" ]
                [ iframe
                    [ id "main-image"
                    , src "https://www.youtube.com/embed/MIwxWKRh7I0"
                    ]
                    []
                ]
            , input
                [ placeholder "Change our band name yah dude!"
                , onInput ChangeBandName
                , attribute "style" "cursor: text; display: block; height: 34px; font-size: 16px; width: 50%;max-width: 500px; min-width: 300px; margin: 20px auto 0; font-family: monospace;"
                ]
                []
            , div [ style [ ( "text-align", "center" ) ] ]
                [ a
                    [ href ("mailto:carterandthebadnews@gmail.com?subject=Carter and the " ++ model.bandName)
                    , attribute "style" "cursor: pointer; font-family: monospace; font-size: 16px; color: black; display: inline-block; margin: 60px 0 30px; padding: 10px;"
                    ]
                    [ text "Email Us!" ]
                ]
            ]
        ]


sharedTopNav : Model -> Html Msg
sharedTopNav model =
    div [ class "shared__top" ]
        [ nav [ class "main__container-nav" ]
            [ a [ href "#home", attribute "style" "padding: 10px; cursor: pointer; font-family: sans-serif;" ] [ text "Home" ]
            , a [ href "#about", attribute "style" "padding: 10px; cursor: pointer; margin-left: 20px; font-family: sans-serif;" ] [ text "About" ]
            , a [ href "#photos", attribute "style" "padding: 10px; cursor: pointer; margin-left: 20px; font-family: sans-serif;" ] [ text "Photos" ]
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
            , div [ class "photos-section" ]
                [ div [ class "image-wrapper" ] [ img [ src "images/rooftop/the-gang.jpg", alt "CATBN" ] [] ]
                , div [ class "image-wrapper" ] [ img [ src "images/rooftop/all-carter.jpg", alt "get some" ] [] ]
                , div [ class "image-wrapper" ] [ img [ src "images/hi-carter.jpg", alt "ohh fancy" ] [] ]
                , div [ class "image-wrapper" ] [ img [ src "images/rooftop/psycho.jpg", alt "playin" ] [] ]
                , div [ class "image-wrapper" ] [ img [ src "images/dope.jpg", alt "dope." ] [] ]
                , div [ class "image-wrapper" ] [ img [ src "images/cape.jpg", alt "pirates!" ] [] ]
                ]
            ]
        ]
