module Main exposing (main)

import Browser
import Browser.Dom
import Browser.Navigation
import Html exposing (Html, a, div, hr, img, text)
import Html.Attributes exposing (alt, class, href, id, src)
import Html.Events
import Page exposing (Page(..))
import Page.About as About
import Page.Contact as Contact
import Page.Customers as Customers
import Page.Home as Home
import Page.NotFound as NotFound
import Page.Services as Services
import Svg
import Svg.Attributes exposing (x1, x2, y1, y2)
import Svg.Events
import Task
import Time
import Url


type Msg
    = UrlChanged Url.Url
    | UrlRequest Browser.UrlRequest
    | Tick Time.Posix
    | GotHomeMsg Home.Msg
    | GotAboutMsg About.Msg
    | GotServicesMsg Services.Msg
    | GotCustomersMsg Customers.Msg
    | GotContactMsg Contact.Msg
    | GotViewport Browser.Dom.Viewport
    | GotViewportOfPage (Result Browser.Dom.Error Browser.Dom.Element)
    | ShowNavbar Bool
    | NoOp


type alias Model =
    { url : Url.Url
    , key : Browser.Navigation.Key
    , page : Page
    , home : Home.Model
    , about : About.Model
    , services : Services.Model
    , customers : Customers.Model
    , contact : Contact.Model
    , viewport : Browser.Dom.Viewport
    , showNavbar : Bool
    , error : Maybe Browser.Dom.Error
    }


init : () -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init _ url key =
    let
        page =
            Page.fromUrl url
    in
    ( { url = url
      , key = key
      , page = page
      , home = Home.init
      , about = About.init
      , services = Services.init
      , customers = Customers.init
      , contact = Contact.init
      , viewport = emptyViewport
      , showNavbar = False
      , error = Nothing
      }
    , viewportOfPage page
    )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Time.every 10 Tick


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChanged url ->
            let
                page =
                    Page.fromUrl url
            in
            ( { model | page = page }, viewportOfPage page )

        UrlRequest request ->
            case request of
                Browser.Internal url ->
                    ( model, Browser.Navigation.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Browser.Navigation.load href )

        GotHomeMsg pageMsg ->
            let
                ( newModel, cmds ) =
                    Home.update pageMsg model.home
            in
            ( { model | home = newModel }, Cmd.map GotHomeMsg cmds )

        GotAboutMsg pageMsg ->
            let
                ( newModel, cmds ) =
                    About.update pageMsg model.about
            in
            ( { model | about = newModel }, Cmd.map GotAboutMsg cmds )

        GotServicesMsg pageMsg ->
            let
                ( newModel, cmds ) =
                    Services.update pageMsg model.services
            in
            ( { model | services = newModel }, Cmd.map GotServicesMsg cmds )

        GotCustomersMsg pageMsg ->
            let
                ( newModel, cmds ) =
                    Customers.update pageMsg model.customers
            in
            ( { model | customers = newModel }, Cmd.map GotCustomersMsg cmds )

        GotContactMsg pageMsg ->
            let
                ( newModel, cmds ) =
                    Contact.update pageMsg model.contact
            in
            ( { model | contact = newModel }, Cmd.map GotContactMsg cmds )

        Tick _ ->
            ( model, Task.perform GotViewport Browser.Dom.getViewport )

        GotViewport viewport ->
            if model.viewport.viewport.y < viewport.viewport.y then
                ( { model | viewport = viewport, showNavbar = False }, Cmd.none )

            else
                ( { model | viewport = viewport }, Cmd.none )

        GotViewportOfPage result ->
            case result of
                Ok element ->
                    ( { model | viewport = { viewport = element.viewport, scene = element.scene } }
                    , Task.perform (\_ -> NoOp) (Browser.Dom.setViewport 0 element.element.y)
                    )

                Err error ->
                    ( { model | error = Just error }, Cmd.none )

        ShowNavbar showNavbar ->
            ( { model | showNavbar = showNavbar }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    let
        title =
            case model.page of
                Home ->
                    Home.title

                About ->
                    About.title

                Services ->
                    Services.title

                Customers ->
                    Customers.title

                Contact ->
                    Contact.title

                NotFound ->
                    NotFound.title
    in
    { title = title
    , body =
        case model.page of
            NotFound ->
                [ header model.showNavbar
                , NotFound.view
                , footer model
                ]

            _ ->
                [ header model.showNavbar
                , Html.map GotHomeMsg <| Home.view model.home
                , Html.map GotAboutMsg <| About.view model.about
                , Html.map GotServicesMsg <| Services.view model.services
                , Html.map GotCustomersMsg <| Customers.view model.customers
                , Html.map GotContactMsg <| Contact.view model.contact
                , footer model
                ]
    }


header : Bool -> Html Msg
header showNavbar =
    let
        navbarId =
            if showNavbar then
                "navbar"

            else
                "navbar-hidden"
    in
    div [ id "header" ]
        [ a [ id "logo-wrapper", href <| "/", Html.Events.onClick (ShowNavbar False) ] [ img [ id "logo", src "img/logo-white.png", alt "Logo" ] [] ]
        , div [ id navbarId ]
            [ a [ class "navlink", href <| "/" ++ About.route, Html.Events.onClick (ShowNavbar False) ] [ text "ABOUT" ]
            , a [ class "navlink", href <| "/" ++ Services.route, Html.Events.onClick (ShowNavbar False) ] [ text "SERVICES" ]
            , a [ class "navlink", href <| "/" ++ Customers.route, Html.Events.onClick (ShowNavbar False) ] [ text "CUSTOMERS" ]
            , a [ class "navlink", href <| "/" ++ Contact.route, Html.Events.onClick (ShowNavbar False) ] [ text "CONTACT" ]
            , hr [ id "navbar-separator" ] []
            ]
        , navbtn showNavbar
        ]


navbtn : Bool -> Html Msg
navbtn showNavbar =
    let
        transitionId =
            if showNavbar then
                "-transition"

            else
                ""
    in
    div [ id "navbtn" ]
        [ Svg.svg [ Svg.Attributes.viewBox "0 0 50 50", (Svg.Events.onClick << ShowNavbar << not) showNavbar, Svg.Attributes.width "100%" ]
            [ Svg.line
                [ Svg.Attributes.class "navbtn-line", Svg.Attributes.id ("first-line" ++ transitionId), x1 "0", x2 "50", y1 "5", y2 "5" ]
                []
            , Svg.line
                [ Svg.Attributes.class "navbtn-line", Svg.Attributes.id ("middle-line" ++ transitionId), x1 "0", x2 "50", y1 "20", y2 "20" ]
                []
            , Svg.line
                [ Svg.Attributes.class "navbtn-line", Svg.Attributes.id ("second-line" ++ transitionId), x1 "0", x2 "50", y1 "35", y2 "35" ]
                []
            ]
        ]


footer : Model -> Html msg
footer _ =
    div [ id "footer" ]
        [ div [ class "text" ]
            [ text "PB Consulting AS - Org. nr. 993 765 228 MVA" ]
        ]


viewportOfPage : Page -> Cmd Msg
viewportOfPage page =
    let
        id_ =
            case page of
                About ->
                    "about"

                Services ->
                    "services"

                Customers ->
                    "customers"

                Contact ->
                    "contact"

                _ ->
                    ""
    in
    if page == Home then
        Task.perform (\_ -> NoOp) (Browser.Dom.setViewport 0 0)

    else
        Task.attempt GotViewportOfPage (Browser.Dom.getElement id_)


emptyViewport : Browser.Dom.Viewport
emptyViewport =
    { scene =
        { width = 0
        , height = 0
        }
    , viewport =
        { x = 0
        , y = 0
        , width = 0
        , height = 0
        }
    }


main : Program () Model Msg
main =
    Browser.application
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = UrlRequest
        }
