module Page.Contact exposing (Model, Msg, init, route, title, update, view)

import Html exposing (Html, a, div, iframe, text)
import Html.Attributes exposing (class, height, href, id, src, tabindex, width)


route : String
route =
    "contact"


title : String
title =
    "Contact"


type Msg
    = NoOp


type alias Model =
    {}


init : Model
init =
    {}


view : Model -> Html msg
view _ =
    div [ id "contact" ]
        [ iframe
            [ id "map"
            , src "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2001.2759110511674!2d10.606149016372136!3d59.89436978186017!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46416c94275ebac7%3A0x6727d9cfa231f558!2sLomviveien%206%2C%201364%20Fornebu!5e0!3m2!1sno!2sno!4v1591564321555!5m2!1sno!2sno"
            , width 600
            , height 450
            , tabindex 0
            ]
            []
        , div [ id "contact-info" ]
            [ div [ class "title", id "contact-header" ] [ text "Contact info" ]
            , div [ id "addresss" ]
                [ div [ class "subtitle" ] [ text "Invoice address" ]
                , div [ class "text" ] [ text "PB Consulting AS" ]
                , div [ class "text" ] [ text "Lomviveien 6" ]
                , div [ class "text" ] [ text "1364 Fornebu, Norway" ]
                ]
            , div [ id "email" ]
                [ div [ class "subtitle" ] [ text "Email" ]
                , a [ class "text", href "mailto:per.bakseter@pbconsulting.no" ] [ text "per.bakseter@pbconsulting.no" ]
                ]
            , div [ id "mobile" ]
                [ div [ class "subtitle" ] [ text "Mobile" ]
                , div [ class "text" ] [ text "+47 913 69 043" ]
                ]
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )
