module Updates exposing (..)

import Models exposing (..)
import Routing exposing (..)
import String exposing (..)


type Msg
    = NavigateToHome
    | NavigateToPhotos
    | NavigateToAbout
    | ChangeBandName String


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        NavigateToHome ->
            ( model, Routing.navigateTo "" )

        NavigateToPhotos ->
            ( model, Routing.navigateTo "/photos" )

        NavigateToAbout ->
            ( model, Routing.navigateTo "/about" )

        ChangeBandName bandName ->
            let
                updatedName =
                    if String.isEmpty bandName then
                        "Bad News."
                    else
                        bandName
            in
                ( { model | bandName = updatedName }, Cmd.none )
