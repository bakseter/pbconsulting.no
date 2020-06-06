module Page.NotFound exposing (Model, init, title, toKey, view)

import Browser.Navigation
import Html exposing (Html, div, text)


title : String
title =
    "404 Not Found"


type alias Model =
    { key : Browser.Navigation.Key }


init : Browser.Navigation.Key -> Model
init key =
    Model key


view : Html msg
view =
    div [] [ text "404 not found" ]


toKey : Model -> Browser.Navigation.Key
toKey model =
    model.key
