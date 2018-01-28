module Updates exposing (..)

import Models exposing (..)
import String exposing (..)
import Navigation


type Msg
    = UrlChange Navigation.Location
    | ChangeBandName String


getPage : String -> Page
getPage hash =
    case hash of
        "#home" ->
            Models.Home

        "#about" ->
            Models.About

        "#photos" ->
            Models.Photos

        _ ->
            Models.Home


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        UrlChange location ->
            ( { model | page = getPage location.hash }, Cmd.none )

        ChangeBandName bandName ->
            let
                updatedName =
                    if String.isEmpty bandName then
                        "Bad News."
                    else
                        bandName
            in
                ( { model | bandName = updatedName }, Cmd.none )
