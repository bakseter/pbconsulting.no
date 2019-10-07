import Browser
import Browser.Navigation as Nav
import Html exposing (Html, img, text, div, p, h1, h2, a, hr, ul, li, iframe, br, span)
import Html.Attributes exposing (class, width, height, id, src, alt, href, target)
import Html.Events exposing (onClick)
import Url

main =
    Browser.application {
        init = init,
        subscriptions = subscriptions,
        update = update,
        view = view,
        onUrlChange = UrlChanged,
        onUrlRequest = LinkClicked 
    }

type Page
    = Home
    | About
    | Services
    | Customers
    | Contact

type alias Model =
    { key : Nav.Key,
      url : Url.Url,
      page : Page
    }

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg)
init _ url key =
    (Model key url Home, Cmd.none)

type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    (model, Nav.pushUrl model.key (Url.toString url))
                Browser.External href ->
                   (model, Nav.load href)

        UrlChanged url ->
            case url.path of
                "/home" ->
                    ({ model | url = url, page = Home }, Cmd.none)
                "/about" ->
                    ({ model | url = url, page = About }, Cmd.none)
                "/services" ->
                    ({ model | url = url, page = Services }, Cmd.none)
                "/customers" ->
                    ({ model | url = url, page = Customers }, Cmd.none)
                "/contact" ->
                    ({ model | url = url, page = Contact }, Cmd.none)
                _ ->
                    ({ model | url = url, page = Home }, Cmd.none)

view : Model -> Browser.Document Msg
view model =
        { title = title model,
        body =
        [
            a [ href "/home" ] [
                img [ id "logo", src "images/logo.png", alt "Logo", width 269, height 134 ] []
            ],
            span [ class "nav"] [
                a [ class (selected model Home), href "/home" ] [ text "HOME" ], 
                a [ class (selected model About), href "/about" ] [ text "ABOUT" ],
                a [ class (selected model Services), href "/services" ] [ text "SERVICES" ],
                a [ class (selected model Customers), href "customers" ] [ text "CUSTOMERS" ],
                a [ class (selected model Contact), href "/contact" ] [ text "CONTACT" ]
            ],
            div [ class "content" ] [
                hr [] [],
                home model,
                about model,
                services model,
                customers model,
                contact model,
                hr [] []
            ],
            p [ id "footer" ] [ text "PB Consulting AS - Org. nr. 993 765 228 MVA" ],
            br [] []
        ]
        }

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

home : Model -> Html Msg
home model =
    div [ class (selected model Home) ] [
        h1 [] [ text "Executive Management Consulting" ],
        h2 [] [ text "From Innovation, Planning to Execution" ],
        img [ src "images/per1.jpg", width 270, height 362 ] [],
        p [] [ text "'The Times They are a-Changning...', you may add 'faster and faster'. Globalization is a reality, what happens in China and India will have effects in Norway and vice versa. In many industries the competition will be much more challenging, and you have to find your own edge in a global market to be competitive. You must be innovative and create you own market or have a clear edge in established markets." ],
        p [] [ text " Norway is a high cost country, and we are quite good in innovations and creating exiting solutions and products. However, when it comes to proper planning and execution we need to improve to survive in a global market. To have a good idea is not enough, you must have a good strategy how to develop this further. The process of developing the strategy and execution of the strategy are key success factors in strategy work." ],
        p [] [ text "To understand the cultural differences in various countries is important. The Norwegian management style does not always work outside Norway. This is important to understand for companies operating globally with headquarter in Norway." ],
        p [] [ text "What you read in Science fiction books only few years ago is now a reality. By adopting new technology you can create a virtual company with global reach. This requires a total new way of thinking, and a lot of new opportunities." ],
        p [] [ text "PB Consulting can help in the process from Innovation, planning and to execution. We focus on small and medium size fast-growing high tech companies operating globally with headquarters in Norway."] 
    ]

about : Model -> Html Msg
about model =
    div [ class (selected model About) ] [
        h1 [] [ text "About" ],
--      img [ id "oil", src "images/olje.jpg", alt "Oil" ] [],
        p [] [ text "PB Consulting started in 2009, and the main focus was to help small and medium size Norwegian-based companies to suceed internationally. We have deep industry knowledge of oil & gas upstream, renewable energy and IT. The company was started based upon experience with Norwegian companies going international since 1996." ],
        p [] [ text "PB Consulting works close with several Norwegian Venture Companies as an Advisor, Chairman or Board Member." ],
        p [] [ text "PB Consulting has substantial knowledge and experience with the various programmes and offerings from Innovation Norway (IFU, Skattefunn, Bedriftsnettverk, klyngeprogrammer, FRAM)." ],
        p [] [ text "The main Strategy of PB Consulting it to follow a company during the growth phase over several years. Key words are strategy development and Strategy Execution. However, PB Consulting has also helped several companies with more short term projects." ],
        p [] [ text "PB Consulting is investing a lot to follow the latest trends in both IT, Oil & and Renewable Energy." ]
    ]

services : Model -> Html Msg
services model =
    div [ class (selected model Services) ] [ 
        h1 [] [ text "Services" ],
        h2 [] [ text "Key Professional Qualifications and Skills" ],
--      img [ id "solar", src "images/solcelle.jpg", alt "Solar" ] [],
        ul [] [
            li [] [ p [] [ text "Board Member: Chairman or board member for start-ups and fast growing companies, especially high tech companies. Experience from board positions in Norway, Sweden, Denmark, Finland, UK, Ireland, Germany, USA, Singapore and Malaysia." ] ],
            li [] [ p [] [ text "Management for hire: From department to top management securing excellent growth and profit level. Long experience from all levels of management and leadership (more than 25 years)." ] ],
            li [] [ p [] [ text "Management support related to Business Development and Change Management including acquisitions, divestments, negotiations and restructuring. Has worked close with small and major international and domestic customers in these areas." ] ],
            li [] [ p [] [ text "Sales and marketing of IT based Products and/or Services, helps customers to develop and execute domestic and/or international sales strategies that work. Several years experience as sales/marketing manager for the IT sector." ] ],
            li [] [ p [] [ text "Strategic use of IT, both from Business and IT point of view. Develop and execute strategies for efficient and smart use of IT. Experience from both Business and IT point of views." ] ],
            li [] [ p [] [ text "Program/Projects Management. Help to define, execute and redefine/ restructure of small or large projects. Has developed handbook for Project Management in a well known Norwegian IT company. Has turned around several projects during the last 10 years." ] ],
            li [] [ p [] [ text "Deep industry knowledge in Banking, Insurance and Energy (both Oil & Gas and Utilities). Some experience from Manufacturing, Telecom and Government also." ] ]
        ]
    ]

customers : Model -> Html Msg
customers model =
    div [ class (selected model Customers) ] [ 
        h1 [] [ text "Customers" ],
        h2 [] [ text "Examples of Board Positions" ],
        ul [] [
            li [] [ p [] [ text "Navita: Energy Trading: 2009 - 2012: Chairman, Statoil Invest and Viking Venture were among the main shareholders" ] ],
            li [] [ p [] [ text "Sharecat: Oil & Gas, 2010 - 2012: Board Member, Statoil Invest was among the main shareholders" ] ],
            li [] [ p [] [ text "Exprosoft: Oil & Gas, Late 2013 - now: Chairman, Viking Venture and Investinor are the main shareholders" ] ],
            li [] [ p [] [ text "Norwegian Smart Grid Centre, Renewable Energy: 2012 - 2013: Chairman" ] ],
            li [] [ text "NTNU, ", a [ id "ntnu", href "http://www.ntnu.edu/idi", target "_blank" ] [ text "Department of Computer and Information Science" ], text ", Board Member and Advisory Board: 2002-2013" ]
        ],
        br [] [],
        h2 [] [ text "Examples of Management for Hire" ],
        ul [] [
            li [] [ p [] [ text "Head of NCE Smart Energy Markets: Smart Grid, Smart Cities, Renewable energy: 2010 - 2013" ] ],
            li [] [ p [] [ text "Miriam: Oil & Gas, 2009 - now: Part time" ] ]
        ],
        br [] [],
        h2 [] [ text "Examples of Advisory Services" ],
        ul [] [
            li [] [ p [] [ text "Xvision: Visual Engineering for Subsea/Oil & Gas: 2014 - now" ] ],
            li [] [ p [] [ text "Marine Cybernetics: 2010 - 2011: Oil & Gas/Marine Operations" ] ],
            li [] [ p [] [ text "FRAM Shale, FRAM Gulf of Mexico and FRAM Mexico: 2014 - now" ] ]
        ]
    ]

contact : Model -> Html Msg
contact model =
    div [ class (selected model Contact) ] [ 
        iframe [ src "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2001.2757489543123!2d10.606149015973015!3d59.894372472631005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46416c94275ebac7%3A0xd1ebfdfcc1a50775!2sPB+Consulting+AS!5e0!3m2!1sen!2sno!4v1520598356064", width 600, height 450] [],
        h1 [] [ text "Contact info" ],
        h2 [] [ text "Invoice adress" ],
        p [] [ text "PB Consulting AS" ],
        p [] [ text "Lomviveien 6" ],
        p [] [ text "1364 Fornebu, Norway" ],
        br [] [],
        h2 [] [ text "Email" ],
        p [] [ a [ href "mailto:per.bakseter@pbconsulting.no" ] [ text "per.bakseter@pbconsulting.no" ] ],
        br [] [],
        h2 [] [ text "Mobile" ],
        p [] [ text "+47 913 69 043" ]
    ]

selected : Model -> Page -> String
selected model curPage  =
    if model.page == curPage
    then "selected"
    else "notSelected"

title : Model -> String
title model =
    case model.page of
        Home ->
            "Home"
        About ->
            "About"
        Services ->
            "Services"
        Customers ->
            "Customers"
        Contact ->
            "Contact"
