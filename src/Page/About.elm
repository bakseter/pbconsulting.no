module Page.About exposing (Model, init, route, title, toKey, view)

import Browser.Navigation
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, id)


route : String
route =
    "about"


title : String
title =
    "About"


type alias Model =
    { key : Browser.Navigation.Key }


init : Browser.Navigation.Key -> Model
init =
    Model


view : Html msg
view =
    div [ class "page-wrapper", id "about" ]
        [ div [ class "page-content" ]
            [ div [ class "title" ]
                [ text "About" ]
            , div [ class "text" ]
                [ text
                    """
                    PB Consulting started in 2009, and the main focus was to help small and medium size Norwegian-based companies to suceed internationally.
                    We have deep industry knowledge of oil & gas upstream, renewable energy and IT.
                    The company was started based upon experience with Norwegian companies going international since 1996.
                    """
                ]
            , div [ class "text" ]
                [ text
                    """
                    PB Consulting works closely with several Norwegian Venture Companies as an Advisor, Chairman or Board Member.
                    """
                ]
            , div [ class "text" ]
                [ text
                    """
                    PB Consulting has substantial knowledge and experience with the various programmes and offerings from Innovation Norway
                    (IFU, Skattefunn, Bedriftsnettverk, klyngeprogrammer, FRAM).
                    """
                ]
            , div [ class "text" ]
                [ text
                    """
                    The main Strategy of PB Consulting it to follow a company during the growth phase over several years.
                    Key words are strategy development and Strategy Execution.
                    However, PB Consulting has also helped several companies with more short term projects.
                    """
                ]
            , div [ class "text" ]
                [ text
                    """
                    PB Consulting is investing a lot to follow the latest trends in both IT, Oil & and Renewable Energy.
                    """
                ]
            ]
        ]


toKey : Model -> Browser.Navigation.Key
toKey model =
    model.key