module I18n.French exposing (month, weekday)

import Time exposing (Month(..), Weekday(..))


month : Month -> String
month m =
    case m of
        Jan ->
            "Janvier"

        Feb ->
            "Février"

        Mar ->
            "Mars"

        Apr ->
            "Avril"

        May ->
            "Mai"

        Jun ->
            "Juin"

        Jul ->
            "Juillet"

        Aug ->
            "Aout"

        Sep ->
            "Septembre"

        Oct ->
            "Octobre"

        Nov ->
            "Novembre"

        Dec ->
            "Décembre"


weekday : Weekday -> String
weekday w =
    case w of
        Mon ->
            "Lundi"

        Tue ->
            "Mardi"

        Wed ->
            "Mercredi"

        Thu ->
            "Jeudi"

        Fri ->
            "Vendredi"

        Sat ->
            "Samedi"

        Sun ->
            "Dimanche"
