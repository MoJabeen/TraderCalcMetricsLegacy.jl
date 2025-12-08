mutable struct SignalLine5m15m <: Metric
    
    timeSegments :: TimeSegments
    SignalLine5m15m() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine5m15m,data::SegmentData)

    segmentData = segment(data,:macd_5m_15m)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine5m30m <: Metric
    
    timeSegments :: TimeSegments
    SignalLine5m30m() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine5m30m,data::SegmentData)

    segmentData = segment(data,:macd_5m_30m)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine5m1h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine5m1h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine5m1h,data::SegmentData)

    segmentData = segment(data,:macd_5m_1h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine5m2h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine5m2h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine5m2h,data::SegmentData)

    segmentData = segment(data,:macd_5m_2h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine5m4h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine5m4h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine5m4h,data::SegmentData)

    segmentData = segment(data,:macd_5m_4h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine5m8h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine5m8h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine5m8h,data::SegmentData)

    segmentData = segment(data,:macd_5m_8h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine5m16h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine5m16h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine5m16h,data::SegmentData)

    segmentData = segment(data,:macd_5m_16h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine5m24h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine5m24h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine5m24h,data::SegmentData)

    segmentData = segment(data,:macd_5m_24h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine15m30m <: Metric
    
    timeSegments :: TimeSegments
    SignalLine15m30m() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine15m30m,data::SegmentData)

    segmentData = segment(data,:macd_15m_30m)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine15m1h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine15m1h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine15m1h,data::SegmentData)

    segmentData = segment(data,:macd_15m_1h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine15m2h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine15m2h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine15m2h,data::SegmentData)

    segmentData = segment(data,:macd_15m_2h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine15m4h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine15m4h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine15m4h,data::SegmentData)

    segmentData = segment(data,:macd_15m_4h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine15m8h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine15m8h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine15m8h,data::SegmentData)

    segmentData = segment(data,:macd_15m_8h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine15m16h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine15m16h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine15m16h,data::SegmentData)

    segmentData = segment(data,:macd_15m_16h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine15m24h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine15m24h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine15m24h,data::SegmentData)

    segmentData = segment(data,:macd_15m_24h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine30m1h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine30m1h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine30m1h,data::SegmentData)

    segmentData = segment(data,:macd_30m_1h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine30m2h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine30m2h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine30m2h,data::SegmentData)

    segmentData = segment(data,:macd_30m_2h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine30m4h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine30m4h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine30m4h,data::SegmentData)

    segmentData = segment(data,:macd_30m_4h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine30m8h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine30m8h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine30m8h,data::SegmentData)

    segmentData = segment(data,:macd_30m_8h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine30m16h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine30m16h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine30m16h,data::SegmentData)

    segmentData = segment(data,:macd_30m_16h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine30m24h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine30m24h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine30m24h,data::SegmentData)

    segmentData = segment(data,:macd_30m_24h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine1h2h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine1h2h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine1h2h,data::SegmentData)

    segmentData = segment(data,:macd_1h_2h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine1h4h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine1h4h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine1h4h,data::SegmentData)

    segmentData = segment(data,:macd_1h_4h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine1h8h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine1h8h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine1h8h,data::SegmentData)

    segmentData = segment(data,:macd_1h_8h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine1h16h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine1h16h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine1h16h,data::SegmentData)

    segmentData = segment(data,:macd_1h_16h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine1h24h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine1h24h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine1h24h,data::SegmentData)

    segmentData = segment(data,:macd_1h_24h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine2h4h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine2h4h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine2h4h,data::SegmentData)

    segmentData = segment(data,:macd_2h_4h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine2h8h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine2h8h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine2h8h,data::SegmentData)

    segmentData = segment(data,:macd_2h_8h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine2h16h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine2h16h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine2h16h,data::SegmentData)

    segmentData = segment(data,:macd_2h_16h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct SignalLine2h24h <: Metric
    
    timeSegments :: TimeSegments
    SignalLine2h24h() = new(TimeSegments(ERRORVAL))
end 

function calculate!(metric::SignalLine2h24h,data::SegmentData)

    segmentData = segment(data,:macd_2h_24h)  

    calculate_segments_ema!(segmentData,metric)
end