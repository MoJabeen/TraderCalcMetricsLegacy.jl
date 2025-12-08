abstract type Metric end
abstract type OHLCVbase <: Metric end

IsOHLCV(::OHLCVbase) = true
IsOHLCV(::Metric) = false