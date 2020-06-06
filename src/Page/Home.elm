module Page.Home exposing (Model, init, title, toKey, view)

import Browser.Navigation
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, id)


title : String
title =
    "Home"


type alias Model =
    { key : Browser.Navigation.Key }


init : Browser.Navigation.Key -> Model
init =
    Model


view : Html msg
view =
    div [ class "page-wrapper", id "home" ]
        [ div [ class "page-content" ]
            [ div [ class "title" ] [ text "Executive Management Consulting" ]
            , div [ class "subtitle" ] [ text "From Innovation, Planning to Execution" ]
            , div [ class "text" ]
                [ text
                    """
                'The Times They are a-Changning...', you may add 'faster and faster'.
                Globalization is a reality, what happens in China and India will have effects in Norway and vice versa.
                In many industries the competition will be much more challenging, and you have to find your own edge in a global market to be competitive.
                You must be innovative and create you own market or have a clear edge in established markets.
                """
                ]
            , div [ class "text" ]
                [ text
                    """
                Norway is a high cost country, and we are quite good in innovations and creating exiting solutions and products.
                However, when it comes to proper planning and execution we need to improve to survive in a global market.
                To have a good idea is not enough, you must have a good strategy how to develop this further.
                The process of developing the strategy and execution of the strategy are key success factors in strategy work.
                """
                ]
            , div [ class "text" ]
                [ text
                    """
                It is important to understand the cultural differences in various countries.
                The Norwegian management style does not always work outside Norway.
                This is important to understand for companies operating globally with headquarters in Norway.
                """
                ]
            , div [ class "text" ]
                [ text
                    """
                What you read in Science fiction books only few years ago is now a reality.
                By adopting new technology you can create a virtual company with global reach.
                This requires a total new way of thinking, and a lot of new opportunities.
                """
                ]
            , div [ class "text" ]
                [ text
                    """
                PB Consulting can help in the process from Innovation, planning and to execution.
                We focus on small and medium size fast-growing high tech companies operating globally with headquarters in Norway.
                """
                ]
            ]
        ]


toKey : Model -> Browser.Navigation.Key
toKey model =
    model.key
