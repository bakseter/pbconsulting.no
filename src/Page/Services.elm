module Page.Services exposing (route, title, view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class, id)
import Utils exposing (unorderedList)


route : String
route =
    "services"


title : String
title =
    "Services"


view : Html msg
view =
    div [ class "page-wrapper-right", id "services" ]
        [ div [ class "page-title-left" ]
            [ div [ class "title" ] [ text "Services" ]
            , div [ class "subtitle" ] [ text "Key Professional Qualifications and Skills" ]
            ]
        , div [ class "page-content-right" ]
            [ unorderedList
                [ """
                    Board Member: Chairman or board member for start-ups and fast growing companies, especially high tech companies.
                    Experience from board positions in Norway, Sweden, Denmark, Finland, UK, Ireland, Germany, USA, Singapore and Malaysia.
                  """
                , """
                    Management for hire: From department to top management securing excellent growth and profit level.
                    Long experience from all levels of management and leadership (more than 25 years). 
                  """
                , """
                    Management support related to Business Development and Change Management including acquisitions, divestments, negotiations and restructuring.
                    Has worked close with small and major international and domestic customers in these areas.     
                  """
                , """
                    Sales and marketing of IT based Products and/or Services, helps customers to develop and execute domestic and/or international sales strategies that work.
                    Several years experience as sales/marketing manager for the IT sector.
                  """
                , """
                    Strategic use of IT, both from Business and IT point of view.
                    Develop and execute strategies for efficient and smart use of IT.
                    Experience from both Business and IT point of views. 
                  """
                , """
                    Program/Projects Management.
                    Help to define, execute and redefine/ restructure of small or large projects.
                    Has developed handbook for Project Management in a well known Norwegian IT company.
                    Has turned around several projects during the last 10 years.     
                  """
                , """
                    Deep industry knowledge in Banking, Insurance and Energy (both Oil & Gas and Utilities).
                    Some experience from Manufacturing, Telecom and Government also.     
                  """
                ]
            ]
        ]
