const ERRORVAL = -999999999 #Sentinel value as NaN and Missing dont work well
const ERRORDATE = Dates.DateTime("2012-01-01")

const SEGMENT_TIMES = [
    "5m", "15m", "30m", "1h", "2h", "4h", "8h", "12h", "16h", "24h", "48h"
]

const SEGMENT_SYMBOLS = [
    :t5m, :t15m, :t30m, :t1h, :t2h, :t4h, :t8h, :t12h, :t16h, :t24h, :t48h
]

# Define a mapping between time segment names and minimum value constants
const SEGMENT_MIN_VALS = Dict(
    :fiveMin => 4,
    :fifteenMin => 12,
    :thirtyMin => 25,
    :oneHour => 52,
    :twoHour => 110,
    :fourHour => 225,
    :eightHour => 460,
    :twelveHour => 680,
    :sixteenHour => 900,
    :twentyFourHour => 1360,
    :fortyEightHour => 2700
)

# Define a mapping between time segment names and maximum value constants
const SEGMENT_MAX_VALS = Dict(
    :fiveMin => 1,
    :fifteenMin => 3,
    :thirtyMin => 5,
    :oneHour => 8,
    :twoHour => 10,
    :fourHour => 15,
    :eightHour => 20,
    :twelveHour => 25,
    :sixteenHour => 30,
    :twentyFourHour => 35,
    :fortyEightHour => 50
)

# Define a mapping between segment fields and metric fields
const SEGMENT_TO_METRIC = Dict(
    :fiveMin => :t5m,
    :fifteenMin => :t15m,
    :thirtyMin => :t30m,
    :oneHour => :t1h,
    :twoHour => :t2h,
    :fourHour => :t4h,
    :eightHour => :t8h,
    :twelveHour => :t12h,
    :sixteenHour => :t16h,
    :twentyFourHour => :t24h,
    :fortyEightHour => :t48h
)