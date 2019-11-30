module I18n.Russian exposing (month, weekday)

import Time exposing (Month(..), Weekday(..))


month : Month -> String
month m =
    case m of
        Jan ->
            "Январь"

        Feb ->
            "Февраль"

        Mar ->
            "Март"

        Apr ->
            "Апрель"

        May ->
            "Май"

        Jun ->
            "Июнь"

        Jul ->
            "Июль"

        Aug ->
            "Август"

        Sep ->
            "Сентябрь"

        Oct ->
            "Октябрь"

        Nov ->
            "Ноябрь"

        Dec ->
            "Декабрь"


weekday : Weekday -> String
weekday w =
    case w of
        Mon ->
            "понедельник"

        Tue ->
            "вторник"

        Wed ->
            "среда"

        Thu ->
            "четверг"

        Fri ->
            "пятница"

        Sat ->
            "суббота"

        Sun ->
            "воскресенье"
