module Models exposing (..)

import Navigation


type Page
    = Home
    | About
    | Photos


type alias Model =
    { page : Page
    , bandName : String
    }
