module Utils exposing (blob, unorderedList)

import Html exposing (Html, div, li, text, ul)
import Html.Attributes exposing (class, id)
import Svg
import Svg.Attributes exposing (x, y)


blob : String -> Html msg
blob id_ =
    div [ class "blob", id id_ ]
        [ Svg.svg [ Svg.Attributes.width "200", Svg.Attributes.height "200" ]
            [ Svg.defs []
                [ Svg.pattern [] []
                ]
            , Svg.path
                [ Svg.Attributes.fill "white"
                , Svg.Attributes.d
                    "M37.4,-59.3C47.2,-51.9,53,-39.4,58.8,-26.8C64.6,-14.2,70.5,-1.6,69.1,10.1C67.7,21.8,59,32.7,50.8,46.2C42.6,59.7,34.8,75.9,23.2,79.7C11.5,83.5,-4,74.9,-20.2,69.8C-36.5,64.6,-53.5,62.9,-61.8,53.5C-70.2,44.1,-69.9,27,-72.1,10.5C-74.3,-6.1,-79.1,-22.2,-73.7,-33.4C-68.2,-44.6,-52.4,-50.8,-38.4,-56.3C-24.4,-61.8,-12.2,-66.5,0.8,-67.7C13.8,-68.9,27.6,-66.7,37.4,-59.3Z"
                , Svg.Attributes.transform "translate(100, 100)"
                ]
                []
            ]
        ]


unorderedList : List String -> Html msg
unorderedList strings =
    ul [] (List.map (\x -> li [ class "text" ] [ text x ]) strings)
