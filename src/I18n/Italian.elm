module I18n.Italian exposing (month, weekday)

import Time exposing (Month(..), Weekday(..))


month : Month -> String
month m =
    case m of
        Jan ->
            "Gennaio"

        Feb ->
            "Febbraio"

        Mar ->
            "Marzo"

        Apr ->
            "Aprile"

        May ->
            "Maggio"

        Jun ->
            "Giugno"

        Jul ->
            "Luglio"

        Aug ->
            "Agosto"

        Sep ->
            "Settembre"

        Oct ->
            "Ottobre"

        Nov ->
            "Novembre"

        Dec ->
            "Dicembre"


weekday : Weekday -> String
weekday w =
    case w of
        Mon ->
            "Lunedì"

        Tue ->
            "Martedì"

        Wed ->
            "Mercoledì"

        Thu ->
            "Giovedì"

        Fri ->
            "Venerdì"

        Sat ->
            "Sabato"

        Sun ->
            "Domenica"
