module Tests exposing (..)

import DateFormat exposing (format)
import Expect
import Test exposing (..)
import Time


suite : Test
suite =
    describe "Date Format"
        [ describe "format"
            [ test "handling of 12 noon is correct" <|
                \_ ->
                    let
                        time =
                            Time.millisToPosix 1672747838000

                        zone =
                            Time.utc

                        result =
                            format "dddd, dd MMMM yyyy hh:mm:ss tt"
                                zone
                                time
                    in
                    Expect.equal result "Tuesday, 03 January 2023 12:10:38 PM"
            ]
        ]
