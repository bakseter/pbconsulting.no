module Page.Contact exposing (Model, init, route, title, toKey, view)

import Browser.Navigation
import Html exposing (Html, a, div, text)
import Html.Attributes exposing (class, href, id)


route : String
route =
    "contact"


title : String
title =
    "Contact"


type alias Model =
    { key : Browser.Navigation.Key }


init : Browser.Navigation.Key -> Model
init =
    Model


view : Html msg
view =
    div [ class "page-wrapper", id "contact" ]
        [ div [ class "page-content" ]
            [ div [ class "title" ]
                [ text "Contact info" ]
            , div [ class "subtitle" ]
                [ text "Invoice adress" ]
            , div [ class "text" ]
                [ text "PB Consulting AS" ]
            , div [ class "text" ]
                [ text "Lomviveien 6" ]
            , div [ class "text" ]
                [ text "1364 Fornebu, Norway" ]
            , div [ class "subtitle" ]
                [ text "Email" ]
            , a [ href "mailto:per.bakseter@pbconsulting.no" ]
                [ text "per.bakseter@pbconsulting.no" ]
            , div [ class "subtitle" ]
                [ text "Mobile" ]
            , div [ class "text" ]
                [ text "+47 913 69 043" ]
            ]
        ]


toKey : Model -> Browser.Navigation.Key
toKey model =
    model.key
