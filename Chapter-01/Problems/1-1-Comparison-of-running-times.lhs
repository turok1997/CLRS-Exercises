For each function f(n) and time t in the following table, determine the largest
size n of a problem that can be solved in time t, assuming that the algorithm
to solve the problem takes f(n) microseconds.

            +----------+----------+----------+----------+----------+----------+----------+
            | 1 sec.   | 1 min.   | 1 hour   | 1 day    | 1 month  | 1 year   | 1 century|
    +-------+----------+----------+----------+----------+----------+----------+----------+
    | lg(n) |--------------------------- see below --------------------------------------|
    +-------+----------+----------+----------+----------+----------+----------+----------+
    |sqrt(n)|  1.0e12  | 3.6e15   | 1.3e19   | 7.46e21  | 6.72e24  | 9.95e26  |  9.95e30 |
    +-------+----------+----------+----------+----------+----------+----------+----------+
    |   n   |  1.0e6   |  6.0e7   |  3.6e9   | 8.64e10  | 2.59e12  | 3.15e13  |  3.15e15 |
    +-------+----------+----------+----------+----------+----------+----------+----------+
    |n lg(n)|  62746   | 2801417  | 1.334e8  | 2.755e9  | 7.19e10  | 7.98e11  |  6.86e13 |
    +-------+----------+----------+----------+----------+----------+----------+----------+
    |  n^2  |   1000   |  7745    |  60000   | 293938   | 1609968  | 5.616e6  |  5.616e7 |
    +-------+----------+----------+----------+----------+----------+----------+----------+
    |  n^3  |   100    |   391    |  1532    |  4420    |  13736   |  31593   |  146645  |
    +-------+----------+----------+----------+----------+----------+----------+----------+
    |  2^n  |   19     |     25   |   31     |   36     |   41     |   44     |    51    |
    +-------+----------+----------+----------+----------+----------+----------+----------+
    |  n!   |    9     |     11   |   12     |   13     |   15     |   16     |    17    |
    +-------+----------+----------+----------+----------+----------+----------+----------+


-- I know month, year, and century numbers aren't exact but nothing here is critical anyway... --

    second  = 1000000 microseconds
    minute  = 60 seconds
    hour    = 60 minutes
    day     = 24 hours
    month   = 30 days
    year    = 365 days
    century = 100 years


-- lg n = Tµs => n = 2^T µs --

    lg n = 1 second  => n = 2^1000000 = 9.9e301029
    lg n = 1 minute  => n = 2^60000000 = 5.5e18061799
    lg n = 1 hour    => n = 2^3600000000
    lg n = 1 day     => n = 2^86400000000
    lg n = 1 month   => n = 2^2592000000000
    lg n = 1 year    => n = 2^31536000000000
    lg n = 1 century => n = 2^3153600000000000


-- sqrt n = Tµs => n = T^2 µs --

    1 second  => 1000000^2          = 1.0e12 instructions
    1 minute  => 60000000^2         = 3.6e15
    1 hour    => 3600000000^2       = 1.296e19
    1 day     => 86400000000^2      = 7.46496e21
    1 month   => 2592000000000^2    = 6.718464e24
    1 year    => 31536000000000^2   = 9.94519296e26
    1 century => 3153600000000000^2 = 9.94519296e30


-- n = Tµs --

    1 second  => 1000000 instructions
    1 minute  => 60000000
    1 hour    => 3600000000
    1 day     => 86400000000
    1 month   => 2592000000000
    1 year    => 31536000000000
    1 century => 3153600000000000


-- n lg n = Tµs --

I don't feel like solving for n here so I'm just using a program in TI-BASIC for my TI-89

    :timeNLgN(t)
    :Func
    :solve(n * (log(n) / log(2)) = t, n)
    :EndFunc


Evaluating for the required times results in:

    1 second  => 62746
    1 minute  => 2.80142e6
    1 hour    => 1.33378e8
    1 day     => 2.75515e9
    1 month   => 7.18709e10
    1 year    => 7.97634e11
    1 century => 6.86110e13 (Used WolframAlpha for this one because it was too large for my TI-89)


-- n^2 = T => n = sqrt T --

    1 second  => sqrt 1000000          = 1000 instructions
    1 minute  => sqrt 60000000         = 7745 (Rounded down from 7745.966692414834 because answer is for complete instructions)
    1 hour    => sqrt 3600000000       = 60000
    1 day     => sqrt 86400000000      = 293938
    1 month   => sqrt 2592000000000    = 1609968
    1 year    => sqrt 31536000000000   = 5615692
    1 century => sqrt 3153600000000000 = 56156922


-- n^3 = T => n = T^(1/3) --

    1 second  => 1000000^(1/3)          = 99 (rounded down from 99.99999999999997, like others)
    1 minute  => 60000000^(1/3)         = 391
    1 hour    => 3600000000^(1/3)       = 1532
    1 day     => 86400000000^(1/3)      = 4420
    1 month   => 2592000000000^(1/3)    = 13736
    1 year    => 31536000000000^(1/3)   = 31593
    1 century => 3153600000000000^(1/3) = 14645


-- 2^n = T => n = lg T --

    1 second  => lg 1000000          = 19
    1 minute  => lg 60000000         = 25
    1 hour    => lg 3600000000       = 31
    1 day     => lg 86400000000      = 36
    1 month   => lg 2592000000000    = 41
    1 year    => lg 31536000000000   = 44
    1 century => lg 3153600000000000 = 51


* n! = T *

Using Haskell because I don't want to solve for n in n!

> type Time         = Double
> type Instructions = Integer
>
> times = [ 1000000          -- 1 second
>         , 60000000         -- 1 minute
>         , 3600000000       -- 1 hour
>         , 86400000000      -- 1 day
>         , 2592000000000    -- 1 month
>         , 31536000000000   -- 1 year
>         , 3153600000000000 -- 1 century
>         ]
>
> maxInstructions :: (Instructions -> Time) -> Time -> Instructions
> maxInstructions f t = head . reverse . takeWhile (\n -> t > f n) $ [1..]
>
> factorial :: Instructions -> Time
> factorial n = product [1..(fromIntegral n)]
>
> resultsFactorial :: [(Time, Instructions)]
> resultsFactorial = map (\t -> (t, maxInstructions factorial t)) $ times
>
> main = print resultsFactorial

results for resultsFactorial:

    1 second  => 9
    1 minute  => 11
    1 hour    => 12
    1 day     => 13
    1 month   => 15
    1 year    => 16
    1 century => 17
