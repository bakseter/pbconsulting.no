module Main exposing (main)

import Browser
import Browser.Navigation
import Html exposing (Html, a, div, hr, img, text)
import Html.Attributes exposing (alt, class, href, id, src)
import Page exposing (Page)
import Page.About as About
import Page.Contact as Contact
import Page.Customers as Customers
import Page.Home as Home
import Page.NotFound as NotFound
import Page.Services as Services
import Url


type Msg
    = UrlChanged Url.Url
    | UrlRequest Browser.UrlRequest


type Model
    = Home Home.Model
    | About About.Model
    | Services Services.Model
    | Customers Customers.Model
    | Contact Contact.Model
    | NotFound NotFound.Model


init : () -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init _ url key =
    changeRouteTo url key


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChanged url ->
            changeRouteTo url (toKey model)

        UrlRequest request ->
            case request of
                Browser.Internal url ->
                    ( model, Browser.Navigation.pushUrl (toKey model) (Url.toString url) )

                Browser.External href ->
                    ( model, Browser.Navigation.load href )


view : Model -> Browser.Document Msg
view model =
    let
        ( title, body ) =
            case model of
                Home _ ->
                    ( Home.title, Home.view )

                About _ ->
                    ( About.title, About.view )

                Services _ ->
                    ( Services.title, Services.view )

                Customers _ ->
                    ( Customers.title, Customers.view )

                Contact _ ->
                    ( Contact.title, Contact.view )

                NotFound _ ->
                    ( NotFound.title, NotFound.view )
    in
    { title = title
    , body =
        [ header model
        , body
        , footer model
        ]
    }


isSelected : Model -> Page -> Html.Attribute msg
isSelected model page =
    case ( model, page ) of
        ( Home _, Page.Home ) ->
            class "selected"

        ( About _, Page.About ) ->
            class "selected"

        ( Services _, Page.Services ) ->
            class "selected"

        ( Customers _, Page.Customers ) ->
            class "selected"

        ( Contact _, Page.Contact ) ->
            class "selected"

        _ ->
            class ""


header : Model -> Html msg
header model =
    div [ id "header" ]
        [ a [ id "logo-wrapper", href <| "/" ] [ img [ id "logo", src "img/logo.png", alt "Logo" ] [] ]
        , a [ class "navlink", isSelected model Page.Home, href <| "/" ] [ text "HOME" ]
        , a [ class "navlink", isSelected model Page.About, href <| "/" ++ About.route ] [ text "ABOUT" ]
        , a [ class "navlink", isSelected model Page.Services, href <| "/" ++ Services.route ] [ text "SERVICES" ]
        , a [ class "navlink", isSelected model Page.Customers, href <| "/" ++ Customers.route ] [ text "CUSTOMERS" ]
        , a [ class "navlink", isSelected model Page.Contact, href <| "/" ++ Contact.route ] [ text "CONTACT" ]
        , hr [ class "seperator", id "header-seperator" ] []
        ]


footer : Model -> Html msg
footer _ =
    div [ id "footer" ]
        [ hr [ class "seperator", id "footer-seperator" ] []
        , div [ class "text" ]
            [ text "PB Consulting AS - Org. nr. 993 765 228 MVA" ]
        ]


toKey : Model -> Browser.Navigation.Key
toKey model =
    case model of
        Home home ->
            Home.toKey home

        About about ->
            About.toKey about

        Services services ->
            Services.toKey services

        Customers customers ->
            Customers.toKey customers

        Contact contact ->
            Contact.toKey contact

        NotFound notFound ->
            NotFound.toKey notFound


changeRouteTo : Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
changeRouteTo url key =
    case Page.fromUrl url of
        Page.Home ->
            ( Home (Home.init key)
            , Cmd.none
            )

        Page.About ->
            ( About (About.init key)
            , Cmd.none
            )

        Page.Services ->
            ( Services (Services.init key)
            , Cmd.none
            )

        Page.Customers ->
            ( Customers (Customers.init key)
            , Cmd.none
            )

        Page.Contact ->
            ( Contact (Contact.init key)
            , Cmd.none
            )

        Page.NotFound ->
            ( NotFound (NotFound.init key)
            , Cmd.none
            )


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
