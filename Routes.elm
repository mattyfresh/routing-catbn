module Routes exposing (..)

import UrlParser exposing (..)
import Hop.Types exposing (Config)


-- this module is responsible for all of our creating a union type with all of
-- our routes and the matchers for each of these routes


type
    Route
    -- list all of our routes here
    = MainPage
    | AboutPage
    | PhotoPage



-- this will match /about or /photos exactly.. later we'll return bad routes
-- to the main route


routes : Parser (Route -> a) a
routes =
    oneOf
        [ format MainPage (s "")
        , format AboutPage (s "about")
        , format PhotoPage (s "photos")
        ]



-- tell hop to not worry about hashes at all, and that our apps base path is
-- the root


hopConfig : Config
hopConfig =
    { basePath = ""
    , hash = False
    }
