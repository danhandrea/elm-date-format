module I18n.Dutch exposing (month, weekday)

import Time exposing (Month(..), Weekday(..))


month : Month -> String
month m =
    case m of
        Jan ->
            "Januari"

        Feb ->
            "Februari"

        Mar ->
            "Maart"

        Apr ->
            "April"

        May ->
            "Mei"

        Jun ->
            "Juni"

        Jul ->
            "Juli"

        Aug ->
            "Augustus"

        Sep ->
            "September"

        Oct ->
            "Oktober"

        Nov ->
            "November"

        Dec ->
            "December"


weekday : Weekday -> String
weekday w =
    case w of
        Mon ->
            "Maandag"

        Tue ->
            "Dinsdag"

        Wed ->
            "Woensdag"

        Thu ->
            "Donderdag"

        Fri ->
            "Vrijdag"

        Sat ->
            "Zaterdag"

        Sun ->
            "Zondag"
