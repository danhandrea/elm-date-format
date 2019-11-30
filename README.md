# elm-date-format

Format elm time

2.0.0 - Refactored so that by adding languages won't force MAJOR version

## Format

```elm
format "MM/dd/yyyy" Time.utc (Time.millisToPosix 1575021804192)
== "11/29/2019"

format "dddd, dd MMMM yyyy" Time.utc (Time.millisToPosix 1575021804192)
== "Friday, 29 November 2019"

format "dddd, dd MMMM yyyy HH:mm:ss" Time.utc (Time.millisToPosix 1575021804192)
== "Friday, 29 November 2019 10:03:24"

format "hh:mm tt" Time.utc (Time.millisToPosix 1575021804192)
== "10:03 AM"
```

## Specifiers

```elm
"d"     -- The day of the month, from 1 through 31.
"dd"    -- The day of the month, from 01 through 31.
"ddd"   -- The abbreviated name of the day of the week.
"dddd"  -- The full name of the day of the week.
"h"     -- The hour, using a 12-hour clock from 1 to 12.
"hh"    -- The hour, using a 12-hour clock from 01 to 12.
"H"     -- The hour, using a 24-hour clock from 0 to 23.
"HH"    -- The hour, using a 24-hour clock from 00 to 23.
"m"     -- The minute, from 0 through 59.
"mm"    -- The minute, from 00 through 59.
"M"     -- The month, from 1 through 12.
"MM"    -- The month, from 01 through 12.
"MMM"   -- The abbreviated name of the month.
"MMMM"  -- The full name of the month.
"s"     -- The second, from 0 through 59.
"ss"    -- The second, from 00 through 59.
"t"     -- The first character of the AM/PM designator.
"tt"    -- The AM/PM designator.
"yy"    -- The year, from 00 to 99.
"yyyy"  -- The year as a four-digit number.
"f"     -- The tenths of a second in a date and time value.
"ff"    -- The hundredths of a second in a date and time value.
"fff"   -- The milliseconds in a date and time value.
```

## formatI18n

```elm
formatI18n french "dddd, dd MMMM yyyy" Time.utc (Time.millisToPosix 1575021804192)
== "Vendredi, 29 Novembre 2019"

formatI18n spanish "dddd, dd MMMM yyyy HH:mm:ss" Time.utc (Time.millisToPosix 1575021804192)
== "Viernes, 29 Noviembre 2019 10:03:24"
```
## Languages

Currently supporting:
```elm
- English - default
- French
- Spanish
- Dutch
- Finnish
- Greek
- Italian
- Norwegian
- Portuguese
- Swedish
- German
- Russian
```

Will add additional languages on request/the way.
