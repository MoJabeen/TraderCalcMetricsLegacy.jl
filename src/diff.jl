function calculate_segments_diff!(segmentData::SegmentDataConverted,metrics::Metric)

    if isempty(segmentData.oneHour)
        currentVal = 0.0
    else
        currentVal = segmentData.oneHour[end]
    end

    for (segment, minVal) in SEGMENT_MIN_VALS
        metricField = SEGMENT_TO_METRIC[segment]
        segmentVal = getfield(segmentData, segment)
        
        setfield!(metrics.timeSegments, metricField, 
            size(segmentVal, 1) >= minVal ? 
            Float64(number(Decimal(currentVal) - Decimal(first(segmentVal)))) : 0.0)
    end
end

mutable struct PriceChange <: OHLCVbase
    
    timeSegments :: TimeSegments
    PriceChange() = new(TimeSegments(0.0))
end

function calculate!(metric::PriceChange,data::SegmentData)
        
    segmentData = segment(data,:close)

    calculate_segments_diff!(segmentData,metric)
end

mutable struct AbsPriceChange <: OHLCVbase
    
    timeSegments :: TimeSegments
    AbsPriceChange() = new(TimeSegments(0.0))
end

function calculate!(metric::AbsPriceChange,data::SegmentData)

    segmentData = segment(data,:close)

    calculate_segments_diff!(segmentData,metric) 

    metric.timeSegments.t5m = abs(metric.timeSegments.t5m)
    metric.timeSegments.t15m = abs(metric.timeSegments.t15m)
    metric.timeSegments.t30m = abs(metric.timeSegments.t30m)
    metric.timeSegments.t1h = abs(metric.timeSegments.t1h)
    metric.timeSegments.t2h = abs(metric.timeSegments.t2h)
    metric.timeSegments.t4h = abs(metric.timeSegments.t4h)
    metric.timeSegments.t8h = abs(metric.timeSegments.t8h)
    metric.timeSegments.t12h = abs(metric.timeSegments.t12h)
    metric.timeSegments.t16h = abs(metric.timeSegments.t16h)
    metric.timeSegments.t24h = abs(metric.timeSegments.t24h)
    metric.timeSegments.t48h = abs(metric.timeSegments.t48h)
end

mutable struct EMAChange5m <: Metric
    
    timeSegments :: TimeSegments
    EMAChange5m() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAChange5m,data::SegmentData)
    
    segmentData = segment(data,:ema_5m)

    calculate_segments_diff!(segmentData,metric) 
end

mutable struct EMAChange15m <: Metric
    
    timeSegments :: TimeSegments
    EMAChange15m() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAChange15m,data::SegmentData)
    
    segmentData = segment(data,:ema_15m)

    calculate_segments_diff!(segmentData,metric) 
end

mutable struct EMAChange30m <: Metric
    
    timeSegments :: TimeSegments
    EMAChange30m() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAChange30m,data::SegmentData)
    
    segmentData = segment(data,:ema_30m)

    calculate_segments_diff!(segmentData,metric) 
end

mutable struct EMAChange1h <: Metric
    
    timeSegments :: TimeSegments
    EMAChange1h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAChange1h,data::SegmentData)
    
    segmentData = segment(data,:ema_1h)

    calculate_segments_diff!(segmentData,metric) 
end

mutable struct EMAChange4h <: Metric
    
    timeSegments :: TimeSegments
    EMAChange4h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAChange4h,data::SegmentData)
    
    segmentData = segment(data,:ema_4h)

    calculate_segments_diff!(segmentData,metric) 
end

mutable struct EMAChange8h <: Metric
    
    timeSegments :: TimeSegments
    EMAChange8h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAChange8h,data::SegmentData)
    
    segmentData = segment(data,:ema_8h)

    calculate_segments_diff!(segmentData,metric) 
end

mutable struct EMAChange12h <: Metric
    
    timeSegments :: TimeSegments
    EMAChange12h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAChange12h,data::SegmentData)
    
    segmentData = segment(data,:ema_12h)

    calculate_segments_diff!(segmentData,metric) 
end

mutable struct EMAChange16h <: Metric
    
    timeSegments :: TimeSegments
    EMAChange16h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAChange16h,data::SegmentData)
    
    segmentData = segment(data,:ema_16h)

    calculate_segments_diff!(segmentData,metric) 
end

mutable struct EMAChange24h <: Metric
    
    timeSegments :: TimeSegments
    EMAChange24h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAChange24h,data::SegmentData)
    
    segmentData = segment(data,:ema_24h)

    calculate_segments_diff!(segmentData,metric) 
end

mutable struct EMAChange48h <: Metric
    
    timeSegments :: TimeSegments
    EMAChange48h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAChange48h,data::SegmentData)
    
    segmentData = segment(data,:ema_48h)

    calculate_segments_diff!(segmentData,metric) 
end

mutable struct UpperWickChange <: OHLCVbase
    
    timeSegments :: TimeSegments
    UpperWickChange() = new(TimeSegments(0.0))
end

function calculate!(metric::UpperWickChange,data::SegmentData)
    
    segmentData = segment(data,:high)

    calculate_segments_diff!(segmentData,metric)
end

mutable struct LowerWickChange <: OHLCVbase
    
    timeSegments :: TimeSegments
    LowerWickChange() = new(TimeSegments(0.0))
end

function calculate!(metric::LowerWickChange,data::SegmentData)

    segmentData = segment(data,:low)

    calculate_segments_diff!(segmentData,metric)
end