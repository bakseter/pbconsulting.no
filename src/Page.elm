module Page exposing (Page(..), fromUrl)

import Page.About as About
import Page.Contact as Contact
import Page.Customers as Customers
import Page.Services as Services
import Url
import Url.Parser as Parser


type Page
    = Home
    | About
    | Services
    | Customers
    | Contact
    | NotFound


fromUrl : Url.Url -> Page
fromUrl url =
    case Parser.parse decoder url of
        Just page ->
            page

        Nothing ->
            NotFound


decoder : Parser.Parser (Page -> a) a
decoder =
    Parser.oneOf
        [ Parser.map Home Parser.top
        , Parser.map About (Parser.s About.route)
        , Parser.map Services (Parser.s Services.route)
        , Parser.map Customers (Parser.s Customers.route)
        , Parser.map Contact (Parser.s Contact.route)
        ]
