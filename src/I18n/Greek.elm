module I18n.Greek exposing (month, weekday)

import Time exposing (Month(..), Weekday(..))


month : Month -> String
month m =
    case m of
        Jan ->
            "Ιανουάριος"

        Feb ->
            "Φεβρουάριος"

        Mar ->
            "Μάρτιος"

        Apr ->
            "Απρίλιος"

        May ->
            "Μάιος"

        Jun ->
            "Ιούνιος"

        Jul ->
            "Ιούλιος"

        Aug ->
            "Αύγουστος"

        Sep ->
            "Σεπτέμβριος"

        Oct ->
            "Οκτώβριος"

        Nov ->
            "Νοέμβριος"

        Dec ->
            "Δεκέμβριος"


weekday : Weekday -> String
weekday w =
    case w of
        Mon ->
            "Δευτέρα"

        Tue ->
            "Τρίτη"

        Wed ->
            "Τετάρτη"

        Thu ->
            "Πέμπτη"

        Fri ->
            "Παρασκευή"

        Sat ->
            "Σάββατο"

        Sun ->
            "Κυριακή"
