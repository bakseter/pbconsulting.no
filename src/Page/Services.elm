module Page.Services exposing (Model, Msg, Slide(..), generateSlideShow, init, route, title, update, view)

import Html exposing (Html, div, i, text)
import Html.Attributes exposing (class, id)
import Html.Events
import Utils exposing (blob, unorderedList)


route : String
route =
    "services"


title : String
title =
    "Services"


type Msg
    = NextSlide
    | PrevSlide


type alias Model =
    { currentSlide : Slide
    , showPrevArrow : Bool
    , showNextArrow : Bool
    }


type Slide
    = First
    | Second
    | Third
    | Fourth
    | Fifth
    | Sixth
    | Last


init : Model
init =
    { currentSlide = First
    , showPrevArrow = False
    , showNextArrow = True
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        newSlide =
            case msg of
                PrevSlide ->
                    prevSlide model.currentSlide

                NextSlide ->
                    nextSlide model.currentSlide

        showPrevArrow =
            newSlide /= First

        showNextArrow =
            newSlide /= Last
    in
    ( { model
        | currentSlide = newSlide
        , showPrevArrow = showPrevArrow
        , showNextArrow = showNextArrow
      }
    , Cmd.none
    )


view : Model -> Html Msg
view model =
    let
        prevArrow =
            if model.showPrevArrow then
                div [ class "arrow", id "prev-arrow", Html.Events.onClick PrevSlide ]
                    -- [ i [ class "fa fa-angle-left", Html.Events.onClick PrevSlide ] [] ]
                    [ text "<" ]

            else
                div [] []

        nextArrow =
            if model.showNextArrow then
                div [ class "arrow", id "next-arrow", Html.Events.onClick NextSlide ]
                    -- [ i [ class "fa fa-angle-right", Html.Events.onClick NextSlide ] [] ]
                    [ text ">" ]

            else
                div [] []
    in
    div [ class "page-wrapper-right", id "services" ]
        [ div [ class "page-title-left" ]
            [ div [ class "blob-title" ]
                [ div [ class "title" ] [ text "Services" ]
                ]
            ]
        , div [ class "page-content-right" ]
            [ div [ class "subtitle" ] [ text "Key Professional Qualifications and Skills" ]
            , div [ id "slideshow" ]
                [ prevArrow
                , generateSlideShow model.currentSlide
                , nextArrow
                ]
            ]
        ]


generateSlideShow : Slide -> Html msg
generateSlideShow currentSlide =
    let
        genFunc slide =
            div
                [ if currentSlide == slide then
                    id "current-slide"

                  else
                    id "hidden-slide"
                , class "text"
                , class "slide"
                ]
                [ text <| slideToString slide ]
    in
    div [ id "slideshow" ]
        (List.map genFunc [ First, Second, Third, Fourth, Fifth, Sixth, Last ])


slideToString : Slide -> String
slideToString slide =
    case slide of
        First ->
            """
            Board Member: Chairman or board member for start-ups and fast
            growing companies, especially high tech companies. Experience
            from board positions in Norway, Sweden, Denmark, Finland, UK,
            Ireland, Germany, USA, Singapore and Malaysia.
            """

        Second ->
            """
            Management for hire: From department to top management securing
            excellent growth and profit level. Long experience from all
            levels of management and leadership (more than 25 years). 
            """

        Third ->
            """
            Management support related to Business Development and
            Change Management including acquisitions, divestments,
            negotiations and restructuring. Has worked closely with
            small and major international and domestic customers in these areas.     
            """

        Fourth ->
            """
            Sales and marketing of IT based Products and/or Services,
            helps customers to develop and execute domestic and/or
            international sales strategies that work. Several years
            experience as sales/marketing manager for the IT sector.
            """

        Fifth ->
            """
            Strategic use of IT, both from Business and IT point of view.
            Develop and execute strategies for efficient and smart use of IT.
            Experience from both Business and IT point of views. 
            """

        Sixth ->
            """
            Program/Projects Management. Help to define, execute and
            redefine/ restructure of small or large projects. Has developed
            handbook for Project Management in a well known Norwegian IT company.
            Has turned around several projects during the last 10 years.     
            """

        Last ->
            """
            Deep industry knowledge in Banking, Insurance and Energy
            (both Oil & Gas and Utilities). Some experience from
            Manufacturing, Telecom and Government also.     
            """


prevSlide : Slide -> Slide
prevSlide slide =
    case slide of
        Third ->
            Second

        Fourth ->
            Third

        Fifth ->
            Fourth

        Sixth ->
            Fifth

        Last ->
            Sixth

        _ ->
            First


nextSlide : Slide -> Slide
nextSlide slide =
    case slide of
        First ->
            Second

        Second ->
            Third

        Third ->
            Fourth

        Fourth ->
            Fifth

        Fifth ->
            Sixth

        _ ->
            Last
