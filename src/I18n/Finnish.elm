module I18n.Finnish exposing (month, weekday)

import Time exposing (Month(..), Weekday(..))


month : Month -> String
month m =
    case m of
        Jan ->
            "Tammikuu"

        Feb ->
            "Helmikuu"

        Mar ->
            "Maaliskuu"

        Apr ->
            "Huhtikuu"

        May ->
            "Toukokuu"

        Jun ->
            "Kesäkuu"

        Jul ->
            "Heinäkuu"

        Aug ->
            "Elokuu"

        Sep ->
            "Syyskuu"

        Oct ->
            "Lokakuu"

        Nov ->
            "Marraskuu"

        Dec ->
            "Joulukuu"


weekday : Weekday -> String
weekday w =
    case w of
        Mon ->
            "Maanantai"

        Tue ->
            "Tiistai"

        Wed ->
            "Keskiviikko"

        Thu ->
            "Torstai"

        Fri ->
            "Perjantai"

        Sat ->
            "Lauantai"

        Sun ->
            "Sunnuntai"
