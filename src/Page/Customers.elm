module Page.Customers exposing (Model, init, route, title, toKey, view)

import Browser.Navigation
import Html exposing (Html, div, text)


route : String
route =
    "customers"


title : String
title =
    "Customers"


type alias Model =
    { key : Browser.Navigation.Key }


init : Browser.Navigation.Key -> Model
init =
    Model


view : Html msg
view =
    div [] [ text "customers" ]


toKey : Model -> Browser.Navigation.Key
toKey model =
    model.key
