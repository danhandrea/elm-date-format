module DateFormat exposing
    ( format
    , formatI18n
    , Language, english, french, spanish, dutch, finnish, greek, italian, norwegian, portuguese, swedish, german, russian
    )

{-| DateFormat

Inspired by C# Date formatting


# format

@docs format


# Specifiers

    "d"     - The day of the month, from 1 through 31.
    "dd"    - The day of the month, from 01 through 31.
    "ddd"   - The abbreviated name of the day of the week.
    "dddd"  - The full name of the day of the week.
    "h"     - The hour, using a 12-hour clock from 1 to 12.
    "hh"    - The hour, using a 12-hour clock from 01 to 12.
    "H"     - The hour, using a 24-hour clock from 0 to 23.
    "HH"    - The hour, using a 24-hour clock from 00 to 23.
    "m"     - The minute, from 0 through 59.
    "mm"    - The minute, from 00 through 59.
    "M"     - The month, from 1 through 12.
    "MM"    - The month, from 01 through 12.
    "MMM"   - The abbreviated name of the month.
    "MMMM"  - The full name of the month.
    "s"     - The second, from 0 through 59.
    "ss"    - The second, from 00 through 59.
    "t"     - The first character of the AM/PM designator.
    "tt"    - The AM/PM designator.
    "yy"    - The year, from 00 to 99.
    "yyyy"  - The year as a four-digit number.
    "f"     - The tenths of a second in a date and time value.
    "ff"    - The hundredths of a second in a date and time value.
    "fff"   - The milliseconds in a date and time value.


# formatI18n

@docs formatI18n


# Languages

@docs Language, english, french, spanish, dutch, finnish, greek, italian, norwegian, portuguese, swedish, german, russian

-}

import I18n.Dutch as Dutch
import I18n.English as English
import I18n.Finnish as Finnish
import I18n.French as French
import I18n.German as German
import I18n.Greek as Greek
import I18n.Italian as Italian
import I18n.Norwegian as Norwegian
import I18n.Portuguese as Portuguese
import I18n.Russian as Russian
import I18n.Spanish as Spanish
import I18n.Swedish as Swedish
import Time exposing (Month(..), Posix, Weekday(..), Zone)


{-| Languages currently supported
-}
type Language
    = English
    | French
    | Spanish
    | Dutch
    | Finnish
    | Greek
    | Italian
    | Norwegian
    | Portuguese
    | Swedish
    | German
    | Russian


{-| English
-}
english : Language
english =
    English


{-| French
-}
french : Language
french =
    French


{-| Spanish
-}
spanish : Language
spanish =
    Spanish


{-| Dutch
-}
dutch : Language
dutch =
    Dutch


{-| Finnish
-}
finnish : Language
finnish =
    Finnish


{-| Greek
-}
greek : Language
greek =
    Greek


{-| Italian
-}
italian : Language
italian =
    Italian


{-| Norwegian
-}
norwegian : Language
norwegian =
    Norwegian


{-| Portuguese
-}
portuguese : Language
portuguese =
    Portuguese


{-| Swedish
-}
swedish : Language
swedish =
    Swedish


{-| German
-}
german : Language
german =
    German


{-| Russian
-}
russian : Language
russian =
    Russian


type StringFormat
    = Abbreviated
    | Full


{-| format posix date and zone using a string format

    format "MM/dd/yyyy" Time.utc (Time.millisToPosix 1575021804192)
    == "11/29/2019"

    format "dddd, dd MMMM yyyy" Time.utc (Time.millisToPosix 1575021804192)
    == "Friday, 29 November 2019"

    format "dddd, dd MMMM yyyy HH:mm:ss" Time.utc (Time.millisToPosix 1575021804192)
    == "Friday, 29 November 2019 10:03:24"

    format "hh:mm tt" Time.utc (Time.millisToPosix 1575021804192)
    == "10:03 AM"

-}
format : String -> Zone -> Posix -> String
format fmt zone time =
    formatI18n English fmt zone time


{-| format multilanguage

    Only applies to weekdays and months

    formatI18n french "dddd, dd MMMM yyyy" Time.utc (Time.millisToPosix 1575021804192)
    == "Vendredi, 29 Novembre 2019"

    formatI18n spanish "dddd, dd MMMM yyyy HH:mm:ss" Time.utc (Time.millisToPosix 1575021804192)
    == "Viernes, 29 Noviembre 2019 10:03:24"

-}
formatI18n : Language -> String -> Zone -> Posix -> String
formatI18n lang fmt zone time =
    fmt
        |> String.split ""
        |> group
        |> List.map String.concat
        |> List.map (formatPart zone time lang)
        |> String.concat


formatPart : Zone -> Posix -> Language -> String -> String
formatPart zone time lang part =
    let
        stringPadLeft20 i =
            i
                |> String.fromInt
                |> String.padLeft 2 '0'

        stringTake n i =
            i
                |> String.fromInt
                |> String.split ""
                |> List.take n
                |> String.concat

        to12hour n = if n == 12 then 12 else modBy 12 n

    in
    case part of
        "d" ->
            Time.toDay zone time
                |> String.fromInt

        "dd" ->
            Time.toDay zone time
                |> stringPadLeft20

        "ddd" ->
            Time.toWeekday zone time
                |> weekdayToString lang Abbreviated

        "dddd" ->
            Time.toWeekday zone time
                |> weekdayToString lang Full

        "h" ->
            Time.toHour zone time
                |> to12hour
                |> String.fromInt

        "hh" ->
            Time.toHour zone time
                |> to12hour
                |> stringPadLeft20

        "H" ->
            Time.toHour zone time
                |> String.fromInt

        "HH" ->
            Time.toHour zone time
                |> stringPadLeft20

        "m" ->
            Time.toMinute zone time
                |> String.fromInt

        "mm" ->
            Time.toMinute zone time
                |> stringPadLeft20

        "M" ->
            Time.toMonth zone time
                |> monthToInt
                |> String.fromInt

        "MM" ->
            Time.toMonth zone time
                |> monthToInt
                |> stringPadLeft20

        "MMM" ->
            Time.toMonth zone time
                |> monthToString lang Abbreviated

        "MMMM" ->
            Time.toMonth zone time
                |> monthToString lang Full

        "s" ->
            Time.toSecond zone time
                |> String.fromInt

        "ss" ->
            Time.toSecond zone time
                |> stringPadLeft20

        "t" ->
            if Time.toHour zone time < 12 then
                "A"

            else
                "P"

        "tt" ->
            if Time.toHour zone time < 12 then
                "AM"

            else
                "PM"

        "yy" ->
            Time.toYear zone time
                |> modBy 100
                |> stringPadLeft20

        "yyyy" ->
            Time.toYear zone time
                |> String.fromInt

        "f" ->
            Time.toMillis zone time
                |> stringTake 1

        "ff" ->
            Time.toMillis zone time
                |> stringTake 2

        "fff" ->
            Time.toMillis zone time
                |> stringTake 3

        a ->
            a



-- MONTH


monthToString : Language -> StringFormat -> Month -> String
monthToString lang fmt month =
    let
        full =
            case lang of
                English ->
                    English.month month

                French ->
                    French.month month

                Spanish ->
                    Spanish.month month

                Dutch ->
                    Dutch.month month

                Finnish ->
                    Finnish.month month

                Greek ->
                    Greek.month month

                Italian ->
                    Italian.month month

                Norwegian ->
                    Norwegian.month month

                Portuguese ->
                    Portuguese.month month

                Swedish ->
                    Swedish.month month

                German ->
                    German.month month

                Russian ->
                    Russian.month month
    in
    case fmt of
        Abbreviated ->
            toAbberviated full

        Full ->
            full


monthToInt : Month -> Int
monthToInt month =
    case month of
        Time.Jan ->
            1

        Time.Feb ->
            2

        Time.Mar ->
            3

        Time.Apr ->
            4

        Time.May ->
            5

        Time.Jun ->
            6

        Time.Jul ->
            7

        Time.Aug ->
            8

        Time.Sep ->
            9

        Time.Oct ->
            10

        Time.Nov ->
            11

        Time.Dec ->
            12



-- WEEKDAY


weekdayToString : Language -> StringFormat -> Weekday -> String
weekdayToString lang fmt weekday =
    let
        full =
            case lang of
                English ->
                    English.weekday weekday

                French ->
                    French.weekday weekday

                Spanish ->
                    Spanish.weekday weekday

                Dutch ->
                    Dutch.weekday weekday

                Finnish ->
                    Finnish.weekday weekday

                Greek ->
                    Greek.weekday weekday

                Italian ->
                    Italian.weekday weekday

                Norwegian ->
                    Norwegian.weekday weekday

                Portuguese ->
                    Portuguese.weekday weekday

                Swedish ->
                    Swedish.weekday weekday

                German ->
                    German.weekday weekday

                Russian ->
                    Russian.weekday weekday
    in
    case fmt of
        Abbreviated ->
            toAbberviated full

        Full ->
            full



-- UTIL


toAbberviated : String -> String
toAbberviated full =
    full
        |> String.split ""
        |> List.take 3
        |> String.concat



-- LIST


group : List a -> List (List a)
group =
    group_ []


group_ : List (List a) -> List a -> List (List a)
group_ acc fmt =
    case fmt of
        [] ->
            List.reverse acc

        a :: bs ->
            case acc of
                [] ->
                    group_ [ [ a ] ] bs

                (y :: ys) :: xs ->
                    if a == y then
                        group_ ((a :: y :: ys) :: xs) bs

                    else
                        group_ ([ a ] :: (y :: ys) :: xs) bs

                [] :: _ ->
                    acc
