module Page.Customers exposing (Model, Msg, init, route, title, update, view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class, id)


route : String
route =
    "customers"


title : String
title =
    "Customers"


type Msg
    = NoOp


type alias Model =
    {}


init : Model
init =
    {}


view : Model -> Html msg
view _ =
    div [ class "page-wrapper-left", id "customers" ]
        [ div [ class "page-title-right" ]
            [ div [ class "title" ] [ text "Customers" ]
            ]
        , div [ class "page-content-left" ]
            [ div [ class "subtitle" ] [ text "Examples of Board Positions" ]

            {-
               , unorderedList
                   [ "Navita: Energy Trading: 2009 - 2012: Chairman, Statoil Invest and Viking Venture were among the main shareholders"
                   , "Sharecat: Oil & Gas, 2010 - 2012: Board Member, Statoil Invest was among the main shareholders"
                   , "Exprosoft: Oil & Gas, Late 2013 - now: Chairman, Viking Venture and Investinor are the main shareholders"
                   , "Norwegian Smart Grid Centre, Renewable Energy: 2012 - 2013: Chairman"
                   , "NTNU, Department of Computer and Information Science, Board Member and Advisory Board: 2002-2013"
                   ]
            -}
            , div [ class "subtitle" ] [ text "Examples of Management for Hire" ]

            {-
               , unorderedList
                   [ "Head of NCE Smart Energy Markets: Smart Grid, Smart Cities, Renewable energy: 2010 - 2013"
                   , "Miriam: Oil & Gas, 2009 - now: Part time"
                   ]
            -}
            , div [ class "subtitle" ] [ text "Examples of Advisory Services" ]

            {-
               , unorderedList
                   [ "Xvision: Visual Engineering for Subsea/Oil & Gas: 2014 - now"
                   , "Marine Cybernetics: 2010 - 2011: Oil & Gas/Marine Operations"
                   , "FRAM Shale, FRAM Gulf of Mexico and FRAM Mexico: 2014 - now"
                   ]
            -}
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )
