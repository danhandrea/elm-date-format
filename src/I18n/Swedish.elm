module I18n.Swedish exposing (month, weekday)

import Time exposing (Month(..), Weekday(..))


month : Month -> String
month m =
    case m of
        Jan ->
            "Januari"

        Feb ->
            "Februari"

        Mar ->
            "Mars"

        Apr ->
            "April"

        May ->
            "Maj"

        Jun ->
            "Juni"

        Jul ->
            "Juli"

        Aug ->
            "Augusti"

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
            "Måndag"

        Tue ->
            "Tisdag"

        Wed ->
            "Onsdag"

        Thu ->
            "Torsdag"

        Fri ->
            "Fredag"

        Sat ->
            "Lördag"

        Sun ->
            "Söndag"
