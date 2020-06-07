module Page.Customers exposing (Model, init, route, title, toKey, view)

import Browser.Navigation
import Html exposing (Html, div, li, text, ul)
import Html.Attributes exposing (class, id)


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
    div [ class "page-wrapper", id "customers" ]
        [ div [ class "page-content" ]
            [ div [ class "title" ]
                [ text "Customers" ]
            , div [ class "subtitle" ]
                [ text "Examples of Board Positions" ]
            , unorderedList
                [ "Navita: Energy Trading: 2009 - 2012: Chairman, Statoil Invest and Viking Venture were among the main shareholders"
                , "Sharecat: Oil & Gas, 2010 - 2012: Board Member, Statoil Invest was among the main shareholders"
                , "Exprosoft: Oil & Gas, Late 2013 - now: Chairman, Viking Venture and Investinor are the main shareholders"
                , "Norwegian Smart Grid Centre, Renewable Energy: 2012 - 2013: Chairman"
                , "NTNU, Department of Computer and Information Science, Board Member and Advisory Board: 2002-2013"
                ]
            , div [ class "subtitle" ]
                [ text "Examples of Management for Hire" ]
            , unorderedList
                [ "Head of NCE Smart Energy Markets: Smart Grid, Smart Cities, Renewable energy: 2010 - 2013"
                , "Miriam: Oil & Gas, 2009 - now: Part time"
                ]
            , div [ class "subtitle" ]
                [ text "Examples of Advisory Services" ]
            , unorderedList
                [ "Xvision: Visual Engineering for Subsea/Oil & Gas: 2014 - now"
                , "Marine Cybernetics: 2010 - 2011: Oil & Gas/Marine Operations"
                , "FRAM Shale, FRAM Gulf of Mexico and FRAM Mexico: 2014 - now"
                ]
            ]
        ]


unorderedList : List String -> Html msg
unorderedList strings =
    ul [] (List.map (\x -> li [] [ text x ]) strings)


toKey : Model -> Browser.Navigation.Key
toKey model =
    model.key
