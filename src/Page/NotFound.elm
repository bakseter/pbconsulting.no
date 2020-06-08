module Page.NotFound exposing (title, view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class, id)


title : String
title =
    "404 Not Found"


view : Html msg
view =
    div [ id "not-found" ]
        [ div [ class "big-title" ] [ text "404" ]
        , div [ class "subtitle" ] [ text "page not found" ]
        ]
