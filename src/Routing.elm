module Routing exposing (..)

import Navigation
import Hop exposing (makeResolver)
import Hop.Types exposing (Address)
import UrlParser exposing (..)


-- my own modules

import Routes exposing (..)
import Models exposing (..)


-- gets us the parts of the URL


urlParser =
    let
        parse path =
            path
                |> UrlParser.parse identity routes
                |> Result.withDefault MainPage

        resolver =
            makeResolver Routes.hopConfig parse
    in
        Navigation.makeParser (.href >> resolver)



-- given a route and an address, update the model accordingly


urlUpdate : ( Route, Address ) -> Model -> ( Model, Cmd a )
urlUpdate ( route, address ) model =
    ( { model | route = route, address = address }, Cmd.none )


navigateTo : String -> Cmd msg
navigateTo path =
    Hop.outputFromPath Routes.hopConfig path
        |> Navigation.newUrl
