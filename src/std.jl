function calculate_segments_std!(segmentData::SegmentDataConverted,metrics::Metric)

    for (segment, minVal) in SEGMENT_MIN_VALS
        maxVal = SEGMENT_MAX_VALS[segment]
        metricField = SEGMENT_TO_METRIC[segment]
        segmentVal = getfield(segmentData, segment)

        setVal = 0.0

        if size(segmentVal,1) >= minVal && count(val->(val==0.0),segmentVal) <= maxVal
            setVal = std(segmentVal)
        elseif count(val->(val==0.0),segmentVal) > maxVal
            setVal = ERRORVAL
        end
        
        setfield!(metrics.timeSegments, metricField, setVal)
    end
end

mutable struct SMASTD5m <: Metric
    
    timeSegments :: TimeSegments
    SMASTD5m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::SMASTD5m, data::SegmentData)

    segmentData = segment(data,:sma_5m)

    calculate_segments_std!(segmentData,metric)
end

mutable struct SMASTD15m <: Metric
    
    timeSegments :: TimeSegments
    SMASTD15m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::SMASTD15m, data::SegmentData)

    segmentData = segment(data,:sma_15m)

    calculate_segments_std!(segmentData,metric)
end

mutable struct SMASTD30m <: Metric
    
    timeSegments :: TimeSegments
    SMASTD30m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::SMASTD30m, data::SegmentData)

    segmentData = segment(data,:sma_30m)

    calculate_segments_std!(segmentData,metric)
end

mutable struct SMASTD1h <: Metric
    
    timeSegments :: TimeSegments
    SMASTD1h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::SMASTD1h, data::SegmentData)

    segmentData = segment(data,:sma_1h)

    calculate_segments_std!(segmentData,metric)
end

mutable struct SMASTD2h <: Metric
    
    timeSegments :: TimeSegments
    SMASTD2h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::SMASTD2h, data::SegmentData)

    segmentData = segment(data,:sma_2h)

    calculate_segments_std!(segmentData,metric)
end

mutable struct SMASTD4h <: Metric
    
    timeSegments :: TimeSegments
    SMASTD4h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::SMASTD4h, data::SegmentData)

    segmentData = segment(data,:sma_4h)

    calculate_segments_std!(segmentData,metric)
end

mutable struct SMASTD8h <: Metric
    
    timeSegments :: TimeSegments
    SMASTD8h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::SMASTD8h, data::SegmentData)

    segmentData = segment(data,:sma_8h)

    calculate_segments_std!(segmentData,metric)
end

mutable struct SMASTD12h <: Metric
    
    timeSegments :: TimeSegments
    SMASTD12h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::SMASTD12h, data::SegmentData)

    segmentData = segment(data,:sma_12h)

    calculate_segments_std!(segmentData,metric)
end

mutable struct SMASTD16h <: Metric
    
    timeSegments :: TimeSegments
    SMASTD16h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::SMASTD16h, data::SegmentData)

    segmentData = segment(data,:sma_16h)

    calculate_segments_std!(segmentData,metric)
end

mutable struct SMASTD24h <: Metric
    
    timeSegments :: TimeSegments
    SMASTD24h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::SMASTD24h, data::SegmentData)

    segmentData = segment(data,:sma_24h)

    calculate_segments_std!(segmentData,metric)
end

mutable struct EMASTD5m <: Metric
    
    timeSegments :: TimeSegments
    EMASTD5m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMASTD5m, data::SegmentData)

    segmentData = segment(data,:ema_5m)

    calculate_segments_std!(segmentData,metric)
end

mutable struct EMASTD15m <: Metric
    
    timeSegments :: TimeSegments
    EMASTD15m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMASTD15m, data::SegmentData)

    segmentData = segment(data,:ema_15m)

    calculate_segments_std!(segmentData,metric)
end

mutable struct EMASTD30m <: Metric
    
    timeSegments :: TimeSegments
    EMASTD30m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMASTD30m, data::SegmentData)

    segmentData = segment(data,:ema_30m)

    calculate_segments_std!(segmentData,metric)
end

mutable struct EMASTD1h <: Metric
    
    timeSegments :: TimeSegments
    EMASTD1h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMASTD1h, data::SegmentData)

    segmentData = segment(data,:ema_1h)

    calculate_segments_std!(segmentData,metric)
end

mutable struct EMASTD2h <: Metric
    
    timeSegments :: TimeSegments
    EMASTD2h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMASTD2h, data::SegmentData)

    segmentData = segment(data,:ema_2h)

    calculate_segments_std!(segmentData,metric)
end

mutable struct EMASTD4h <: Metric
    
    timeSegments :: TimeSegments
    EMASTD4h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMASTD4h, data::SegmentData)

    segmentData = segment(data,:ema_4h)

    calculate_segments_std!(segmentData,metric)
end

mutable struct EMASTD8h <: Metric
    
    timeSegments :: TimeSegments
    EMASTD8h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMASTD8h, data::SegmentData)

    segmentData = segment(data,:ema_8h)

    calculate_segments_std!(segmentData,metric)
end

mutable struct EMASTD24h <: Metric
    
    timeSegments :: TimeSegments
    EMASTD24h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMASTD24h, data::SegmentData)

    segmentData = segment(data,:ema_24h)

    calculate_segments_std!(segmentData,metric)
end

mutable struct EMASTD48h <: Metric
    
    timeSegments :: TimeSegments
    EMASTD48h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMASTD48h, data::SegmentData)

    segmentData = segment(data,:ema_48h)

    calculate_segments_std!(segmentData,metric)
end

mutable struct UpperWickSTD <: OHLCVbase
    
    timeSegments :: TimeSegments
    UpperWickSTD() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::UpperWickSTD, data::SegmentData)

    segmentData = segment(data,:high)

    calculate_segments_std!(segmentData,metric)
end

mutable struct LowerWickSTD <: OHLCVbase
    
    timeSegments :: TimeSegments
    LowerWickSTD() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::LowerWickSTD, data::SegmentData)

    segmentData = segment(data,:low)

    calculate_segments_std!(segmentData,metric)
end