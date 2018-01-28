module App exposing (..)

import Navigation exposing (..)
import Models exposing (..)
import Views exposing (renderView)
import Updates exposing (..)


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = renderView
        , update = update
        , subscriptions = (always Sub.none)
        }


init : Location -> ( Model, Cmd msg )
init location =
    ( Model Home "Bad News.", Cmd.none )
