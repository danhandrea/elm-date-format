module I18n.Portuguese exposing (month, weekday)

import Time exposing (Month(..), Weekday(..))


month : Month -> String
month m =
    case m of
        Jan ->
            "Janeiro"

        Feb ->
            "Fevereiro"

        Mar ->
            "Março"

        Apr ->
            "Abril"

        May ->
            "Maio"

        Jun ->
            "Junho"

        Jul ->
            "Julho"

        Aug ->
            "Agosto"

        Sep ->
            "Setembro"

        Oct ->
            "Outubro"

        Nov ->
            "Novembro"

        Dec ->
            "Dezembro"


weekday : Weekday -> String
weekday w =
    case w of
        Mon ->
            "Segunda-feira"

        Tue ->
            "Terça-feira"

        Wed ->
            "Quarta-feira"

        Thu ->
            "Quinta-feira"

        Fri ->
            "Sexta-feira"

        Sat ->
            "Sábado"

        Sun ->
            "Domingo"
