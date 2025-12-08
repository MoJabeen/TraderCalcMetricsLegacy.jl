function calculate_segments_ema!(segmentData::SegmentDataConverted,metrics::Metric)

    for (segment, minVal) in SEGMENT_MIN_VALS
        maxVal = SEGMENT_MAX_VALS[segment]
        metricField = SEGMENT_TO_METRIC[segment]
        segmentVal = getfield(segmentData, segment)
        metricVal = getfield(metrics.timeSegments, metricField)

        setfield!(metrics.timeSegments, metricField, 
            size(segmentVal, 1) >= minVal && count(val->(val==0),segmentVal) <= maxVal ? 
            _ema(segmentVal,metricVal) : 0.0)
    end
end

mutable struct PriceChangeEMA5m <: Metric
    
    timeSegments :: TimeSegments
    PriceChangeEMA5m() = new(TimeSegments(0.0))
end

function calculate!(metric::PriceChangeEMA5m,data::SegmentData)

    segmentData = segment(data,:price_change_5m)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct PriceChangeEMA15m <: Metric
    
    timeSegments :: TimeSegments
    PriceChangeEMA15m() = new(TimeSegments(0.0))
end

function calculate!(metric::PriceChangeEMA15m,data::SegmentData)

    segmentData = segment(data,:price_change_15m)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct PriceChangeEMA30m <: Metric
    
    timeSegments :: TimeSegments
    PriceChangeEMA30m() = new(TimeSegments(0.0))
end

function calculate!(metric::PriceChangeEMA30m,data::SegmentData)

    segmentData = segment(data,:price_change_30m)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct PriceChangeEMA1h <: Metric
    
    timeSegments :: TimeSegments
    PriceChangeEMA1h() = new(TimeSegments(0.0))
end

function calculate!(metric::PriceChangeEMA1h,data::SegmentData)

    segmentData = segment(data,:price_change_1h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct PriceChangeEMA2h <: Metric
    
    timeSegments :: TimeSegments
    PriceChangeEMA2h() = new(TimeSegments(0.0))
end

function calculate!(metric::PriceChangeEMA2h,data::SegmentData)

    segmentData = segment(data,:price_change_2h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct PriceChangeEMA4h <: Metric
    
    timeSegments :: TimeSegments
    PriceChangeEMA4h() = new(TimeSegments(0.0))
end

function calculate!(metric::PriceChangeEMA4h,data::SegmentData)

    segmentData = segment(data,:price_change_4h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct PriceChangeEMA8h <: Metric
    
    timeSegments :: TimeSegments
    PriceChangeEMA8h() = new(TimeSegments(0.0))
end

function calculate!(metric::PriceChangeEMA8h,data::SegmentData)

    segmentData = segment(data,:price_change_8h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct PriceChangeEMA12h <: Metric
    
    timeSegments :: TimeSegments
    PriceChangeEMA12h() = new(TimeSegments(0.0))
end

function calculate!(metric::PriceChangeEMA12h,data::SegmentData)

    segmentData = segment(data,:price_change_12h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct PriceChangeEMA16h <: Metric
    
    timeSegments :: TimeSegments
    PriceChangeEMA16h() = new(TimeSegments(0.0))
end

function calculate!(metric::PriceChangeEMA16h,data::SegmentData)

    segmentData = segment(data,:price_change_16h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct PriceChangeEMA24h <: Metric
    
    timeSegments :: TimeSegments
    PriceChangeEMA24h() = new(TimeSegments(0.0))
end

function calculate!(metric::PriceChangeEMA24h,data::SegmentData)

    segmentData = segment(data,:price_change_24h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct PriceChangeEMA48h <: Metric
    
    timeSegments :: TimeSegments
    PriceChangeEMA48h() = new(TimeSegments(0.0))
end

function calculate!(metric::PriceChangeEMA48h,data::SegmentData)

    segmentData = segment(data,:price_change_48h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct AbsPriceChangeEMA5m <: Metric
    
    timeSegments :: TimeSegments
    AbsPriceChangeEMA5m() = new(TimeSegments(0.0))
end

function calculate!(metric::AbsPriceChangeEMA5m,data::SegmentData)
    
    segmentData = segment(data,:abs_price_change_5m)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct AbsPriceChangeEMA15m <: Metric
    
    timeSegments :: TimeSegments
    AbsPriceChangeEMA15m() = new(TimeSegments(0.0))
end

function calculate!(metric::AbsPriceChangeEMA15m,data::SegmentData)
    
    segmentData = segment(data,:abs_price_change_15m)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct AbsPriceChangeEMA30m <: Metric
    
    timeSegments :: TimeSegments
    AbsPriceChangeEMA30m() = new(TimeSegments(0.0))
end

function calculate!(metric::AbsPriceChangeEMA30m,data::SegmentData)
    
    segmentData = segment(data,:abs_price_change_30m)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct AbsPriceChangeEMA1h <: Metric
    
    timeSegments :: TimeSegments
    AbsPriceChangeEMA1h() = new(TimeSegments(0.0))
end

function calculate!(metric::AbsPriceChangeEMA1h,data::SegmentData)
    
    segmentData = segment(data,:abs_price_change_1h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct AbsPriceChangeEMA2h <: Metric
    
    timeSegments :: TimeSegments
    AbsPriceChangeEMA2h() = new(TimeSegments(0.0))
end

function calculate!(metric::AbsPriceChangeEMA2h,data::SegmentData)
    
    segmentData = segment(data,:abs_price_change_2h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct AbsPriceChangeEMA4h <: Metric
    
    timeSegments :: TimeSegments
    AbsPriceChangeEMA4h() = new(TimeSegments(0.0))
end

function calculate!(metric::AbsPriceChangeEMA4h,data::SegmentData)
    
    segmentData = segment(data,:abs_price_change_4h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct AbsPriceChangeEMA8h <: Metric
    
    timeSegments :: TimeSegments
    AbsPriceChangeEMA8h() = new(TimeSegments(0.0))
end

function calculate!(metric::AbsPriceChangeEMA8h,data::SegmentData)
    
    segmentData = segment(data,:abs_price_change_8h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct AbsPriceChangeEMA12h <: Metric
    
    timeSegments :: TimeSegments
    AbsPriceChangeEMA12h() = new(TimeSegments(0.0))
end

function calculate!(metric::AbsPriceChangeEMA12h,data::SegmentData)
    
    segmentData = segment(data,:abs_price_change_12h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct AbsPriceChangeEMA16h <: Metric
    
    timeSegments :: TimeSegments
    AbsPriceChangeEMA16h() = new(TimeSegments(0.0))
end

function calculate!(metric::AbsPriceChangeEMA16h,data::SegmentData)
    
    segmentData = segment(data,:abs_price_change_16h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct AbsPriceChangeEMA24h <: Metric
    
    timeSegments :: TimeSegments
    AbsPriceChangeEMA24h() = new(TimeSegments(0.0))
end

function calculate!(metric::AbsPriceChangeEMA24h,data::SegmentData)
    
    segmentData = segment(data,:abs_price_change_24h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct AbsPriceChangeEMA48h <: Metric
    
    timeSegments :: TimeSegments
    AbsPriceChangeEMA48h() = new(TimeSegments(0.0))
end

function calculate!(metric::AbsPriceChangeEMA48h,data::SegmentData)
    
    segmentData = segment(data,:abs_price_change_48h)

    calculate_segments_ema!(segmentData,metric)
end

mutable struct PCDEMA5m <: Metric
    
    timeSegments :: TimeSegments
    PCDEMA5m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::PCDEMA5m,data::SegmentData)
    
    segmentData = segment(data,:ema_price_change_5m_5m)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct PCDEMA15m <: Metric
    
    timeSegments :: TimeSegments
    PCDEMA15m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::PCDEMA15m,data::SegmentData)
    
    segmentData = segment(data,:ema_price_change_15m_15m)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct PCDEMA30m <: Metric
    
    timeSegments :: TimeSegments
    PCDEMA30m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::PCDEMA30m,data::SegmentData)
    
    segmentData = segment(data,:ema_price_change_30m_30m)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct PCDEMA1h <: Metric
    
    timeSegments :: TimeSegments
    PCDEMA1h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::PCDEMA1h,data::SegmentData)
    
    segmentData = segment(data,:ema_price_change_1h_1h)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct PCDEMA2h <: Metric
    
    timeSegments :: TimeSegments
    PCDEMA2h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::PCDEMA2h,data::SegmentData)
    
    segmentData = segment(data,:ema_price_change_2h_2h)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct PCDEMA4h <: Metric
    
    timeSegments :: TimeSegments
    PCDEMA4h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::PCDEMA4h,data::SegmentData)
    
    segmentData = segment(data,:ema_price_change_4h_4h)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct PCDEMA8h <: Metric
    
    timeSegments :: TimeSegments
    PCDEMA8h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::PCDEMA8h,data::SegmentData)
    
    segmentData = segment(data,:ema_price_change_8h_8h)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct PCDEMA12h <: Metric
    
    timeSegments :: TimeSegments
    PCDEMA12h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::PCDEMA12h,data::SegmentData)
    
    segmentData = segment(data,:ema_price_change_12h_12h)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct PCDEMA16h <: Metric
    
    timeSegments :: TimeSegments
    PCDEMA16h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::PCDEMA16h,data::SegmentData)
    
    segmentData = segment(data,:ema_price_change_16h_16h)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct PCDEMA24h <: Metric
    
    timeSegments :: TimeSegments
    PCDEMA24h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::PCDEMA24h,data::SegmentData)
    
    segmentData = segment(data,:ema_price_change_24h_24h)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct PCDEMA48h <: Metric
    
    timeSegments :: TimeSegments
    PCDEMA48h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::PCDEMA48h,data::SegmentData)
    
    segmentData = segment(data,:ema_price_change_48h_48h)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct APCDEMA5m <: Metric
    
    timeSegments :: TimeSegments
    APCDEMA5m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::APCDEMA5m,data::SegmentData)

    segmentData = segment(data,:ema_abs_price_change_5m_5m)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct APCDEMA15m <: Metric
    
    timeSegments :: TimeSegments
    APCDEMA15m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::APCDEMA15m,data::SegmentData)

    segmentData = segment(data,:ema_abs_price_change_15m_15m)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct APCDEMA30m <: Metric
    
    timeSegments :: TimeSegments
    APCDEMA30m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::APCDEMA30m,data::SegmentData)

    segmentData = segment(data,:ema_abs_price_change_30m_30m)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct APCDEMA1h <: Metric
    
    timeSegments :: TimeSegments
    APCDEMA1h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::APCDEMA1h,data::SegmentData)

    segmentData = segment(data,:ema_abs_price_change_1h_1h)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct APCDEMA2h <: Metric
    
    timeSegments :: TimeSegments
    APCDEMA2h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::APCDEMA2h,data::SegmentData)

    segmentData = segment(data,:ema_abs_price_change_2h_2h)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct APCDEMA4h <: Metric
    
    timeSegments :: TimeSegments
    APCDEMA4h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::APCDEMA4h,data::SegmentData)

    segmentData = segment(data,:ema_abs_price_change_4h_4h)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct APCDEMA8h <: Metric
    
    timeSegments :: TimeSegments
    APCDEMA8h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::APCDEMA8h,data::SegmentData)

    segmentData = segment(data,:ema_abs_price_change_8h_8h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct APCDEMA12h <: Metric
    
    timeSegments :: TimeSegments
    APCDEMA12h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::APCDEMA12h,data::SegmentData)

    segmentData = segment(data,:ema_abs_price_change_12h_12h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct APCDEMA16h <: Metric
    
    timeSegments :: TimeSegments
    APCDEMA16h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::APCDEMA16h,data::SegmentData)

    segmentData = segment(data,:ema_abs_price_change_16h_16h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct APCDEMA24h <: Metric
    
    timeSegments :: TimeSegments
    APCDEMA24h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::APCDEMA24h,data::SegmentData)

    segmentData = segment(data,:ema_abs_price_change_24h_24h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct APCDEMA48h <: Metric
    
    timeSegments :: TimeSegments
    APCDEMA48h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::APCDEMA48h,data::SegmentData)

    segmentData = segment(data,:ema_abs_price_change_48h_48h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAOBV5m <: Metric
    
    timeSegments :: TimeSegments
    EMAOBV5m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMAOBV5m,data::SegmentData)

    segmentData = segment(data,:diff_obv_5m)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct EMAOBV15m <: Metric
    
    timeSegments :: TimeSegments
    EMAOBV15m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMAOBV15m,data::SegmentData)

    segmentData = segment(data,:diff_obv_15m)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct EMAOBV30m <: Metric
    
    timeSegments :: TimeSegments
    EMAOBV30m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMAOBV30m,data::SegmentData)

    segmentData = segment(data,:diff_obv_30m)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct EMAOBV1h <: Metric
    
    timeSegments :: TimeSegments
    EMAOBV1h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMAOBV1h,data::SegmentData)

    segmentData = segment(data,:diff_obv_1h)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct EMAOBV2h <: Metric
    
    timeSegments :: TimeSegments
    EMAOBV2h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMAOBV2h,data::SegmentData)

    segmentData = segment(data,:diff_obv_2h)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct EMAOBV4h <: Metric
    
    timeSegments :: TimeSegments
    EMAOBV4h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMAOBV4h,data::SegmentData)

    segmentData = segment(data,:diff_obv_4h)  

    calculate_segments_ema!(segmentData,metric)
end 

mutable struct EMAOBV8h <: Metric
    
    timeSegments :: TimeSegments
    EMAOBV8h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMAOBV8h,data::SegmentData)

    segmentData = segment(data,:diff_obv_8h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAOBV12h <: Metric
    
    timeSegments :: TimeSegments
    EMAOBV12h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMAOBV12h,data::SegmentData)

    segmentData = segment(data,:diff_obv_12h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAOBV16h <: Metric
    
    timeSegments :: TimeSegments
    EMAOBV16h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMAOBV16h,data::SegmentData)

    segmentData = segment(data,:diff_obv_16h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAOBV24h <: Metric
    
    timeSegments :: TimeSegments
    EMAOBV24h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMAOBV24h,data::SegmentData)

    segmentData = segment(data,:diff_obv_24h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAOBV48h <: Metric
    
    timeSegments :: TimeSegments
    EMAOBV48h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::EMAOBV48h,data::SegmentData)

    segmentData = segment(data,:diff_obv_48h)  

    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMA <: OHLCVbase
    
    timeSegments :: TimeSegments
    EMA() = new(TimeSegments(0.0))
end

function calculate!(metrics::EMA, data::SegmentData)

    segmentData = segment(data,:close)  

    for (segment, minVal) in SEGMENT_MIN_VALS
        metricField = SEGMENT_TO_METRIC[segment]
        segmentVal = getfield(segmentData, segment)
        metricVal = getfield(metrics.timeSegments, metricField)
        
        setfield!(metrics.timeSegments, metricField, 
            size(segmentVal, 1) >= minVal ? _ema(segmentVal,metricVal) : 0.0)
    end
end

mutable struct EMAEMA5m <: Metric
    
    timeSegments :: TimeSegments
    EMAEMA5m() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAEMA5m,data::SegmentData)

    segmentData = segment(data,:ema_5m)  
    
    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAEMA15m <: Metric
    
    timeSegments :: TimeSegments
    EMAEMA15m() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAEMA15m,data::SegmentData)

    segmentData = segment(data,:ema_15m)  
    
    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAEMA30m <: Metric
    
    timeSegments :: TimeSegments
    EMAEMA30m() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAEMA30m,data::SegmentData)

    segmentData = segment(data,:ema_30m)  
    
    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAEMA1h <: Metric
    
    timeSegments :: TimeSegments
    EMAEMA1h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAEMA1h,data::SegmentData)

    segmentData = segment(data,:ema_1h)  
    
    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAEMA2h <: Metric
    
    timeSegments :: TimeSegments
    EMAEMA2h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAEMA2h,data::SegmentData)

    segmentData = segment(data,:ema_2h)  
    
    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAEMA4h <: Metric
    
    timeSegments :: TimeSegments
    EMAEMA4h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAEMA4h,data::SegmentData)

    segmentData = segment(data,:ema_4h)  
    
    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAEMA8h <: Metric
    
    timeSegments :: TimeSegments
    EMAEMA8h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAEMA8h,data::SegmentData)

    segmentData = segment(data,:ema_8h)  
    
    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAEMA12h <: Metric
    
    timeSegments :: TimeSegments
    EMAEMA12h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAEMA12h,data::SegmentData)

    segmentData = segment(data,:ema_12h)  
    
    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAEMA16h <: Metric
    
    timeSegments :: TimeSegments
    EMAEMA16h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAEMA16h,data::SegmentData)

    segmentData = segment(data,:ema_16h)  
    
    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAEMA24h <: Metric
    
    timeSegments :: TimeSegments
    EMAEMA24h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAEMA24h,data::SegmentData)

    segmentData = segment(data,:ema_24h)  
    
    calculate_segments_ema!(segmentData,metric)
end

mutable struct EMAEMA48h <: Metric
    
    timeSegments :: TimeSegments
    EMAEMA48h() = new(TimeSegments(0.0))
end

function calculate!(metric::EMAEMA48h,data::SegmentData)

    segmentData = segment(data,:ema_48h)  
    
    calculate_segments_ema!(segmentData,metric)
end

mutable struct UpperWickChangeEMA5m <: Metric
    
    timeSegments :: TimeSegments
    UpperWickChangeEMA5m() = new(TimeSegments(0.0))
end

function calculate!(metric::UpperWickChangeEMA5m,data::SegmentData)

    segmentData = segment(data,:upper_wick_change_5m)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct UpperWickChangeEMA15m <: Metric
    
    timeSegments :: TimeSegments
    UpperWickChangeEMA15m() = new(TimeSegments(0.0))
end

function calculate!(metric::UpperWickChangeEMA15m,data::SegmentData)

    segmentData = segment(data,:upper_wick_change_15m)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct UpperWickChangeEMA30m <: Metric
    
    timeSegments :: TimeSegments
    UpperWickChangeEMA30m() = new(TimeSegments(0.0))
end

function calculate!(metric::UpperWickChangeEMA30m,data::SegmentData)

    segmentData = segment(data,:upper_wick_change_30m)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct UpperWickChangeEMA1h <: Metric
    
    timeSegments :: TimeSegments
    UpperWickChangeEMA1h() = new(TimeSegments(0.0))
end

function calculate!(metric::UpperWickChangeEMA1h,data::SegmentData)

    segmentData = segment(data,:upper_wick_change_1h)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct UpperWickChangeEMA2h <: Metric
    
    timeSegments :: TimeSegments
    UpperWickChangeEMA2h() = new(TimeSegments(0.0))
end

function calculate!(metric::UpperWickChangeEMA2h,data::SegmentData)

    segmentData = segment(data,:upper_wick_change_2h)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct UpperWickChangeEMA4h <: Metric
    
    timeSegments :: TimeSegments
    UpperWickChangeEMA4h() = new(TimeSegments(0.0))
end

function calculate!(metric::UpperWickChangeEMA4h,data::SegmentData)

    segmentData = segment(data,:upper_wick_change_4h)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct UpperWickChangeEMA8h <: Metric
    
    timeSegments :: TimeSegments
    UpperWickChangeEMA8h() = new(TimeSegments(0.0))
end

function calculate!(metric::UpperWickChangeEMA8h,data::SegmentData)

    segmentData = segment(data,:upper_wick_change_8h)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct UpperWickChangeEMA12h <: Metric
    
    timeSegments :: TimeSegments
    UpperWickChangeEMA12h() = new(TimeSegments(0.0))
end

function calculate!(metric::UpperWickChangeEMA12h,data::SegmentData)

    segmentData = segment(data,:upper_wick_change_12h)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct LowerWickChangeEMA5m <: Metric
    
    timeSegments :: TimeSegments
    LowerWickChangeEMA5m() = new(TimeSegments(0.0))
end

function calculate!(metric::LowerWickChangeEMA5m,data::SegmentData)

    segmentData = segment(data,:lower_wick_change_5m)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct LowerWickChangeEMA15m <: Metric
    
    timeSegments :: TimeSegments
    LowerWickChangeEMA15m() = new(TimeSegments(0.0))
end

function calculate!(metric::LowerWickChangeEMA15m,data::SegmentData)

    segmentData = segment(data,:lower_wick_change_15m)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct LowerWickChangeEMA30m <: Metric
    
    timeSegments :: TimeSegments
    LowerWickChangeEMA30m() = new(TimeSegments(0.0))
end

function calculate!(metric::LowerWickChangeEMA30m,data::SegmentData)

    segmentData = segment(data,:lower_wick_change_30m)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct LowerWickChangeEMA1h <: Metric
    
    timeSegments :: TimeSegments
    LowerWickChangeEMA1h() = new(TimeSegments(0.0))
end

function calculate!(metric::LowerWickChangeEMA1h,data::SegmentData)

    segmentData = segment(data,:lower_wick_change_1h)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct LowerWickChangeEMA2h <: Metric
    
    timeSegments :: TimeSegments
    LowerWickChangeEMA2h() = new(TimeSegments(0.0))
end

function calculate!(metric::LowerWickChangeEMA2h,data::SegmentData)

    segmentData = segment(data,:lower_wick_change_2h)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct LowerWickChangeEMA4h <: Metric
    
    timeSegments :: TimeSegments
    LowerWickChangeEMA4h() = new(TimeSegments(0.0))
end

function calculate!(metric::LowerWickChangeEMA4h,data::SegmentData)

    segmentData = segment(data,:lower_wick_change_4h)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct LowerWickChangeEMA8h <: Metric
    
    timeSegments :: TimeSegments
    LowerWickChangeEMA8h() = new(TimeSegments(0.0))
end

function calculate!(metric::LowerWickChangeEMA8h,data::SegmentData)

    segmentData = segment(data,:lower_wick_change_8h)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct LowerWickChangeEMA12h <: Metric
    
    timeSegments :: TimeSegments
    LowerWickChangeEMA12h() = new(TimeSegments(0.0))
end

function calculate!(metric::LowerWickChangeEMA12h,data::SegmentData)

    segmentData = segment(data,:lower_wick_change_12h)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct LowerWickChangeEMA16h <: Metric
    
    timeSegments :: TimeSegments
    LowerWickChangeEMA16h() = new(TimeSegments(0.0))
end

function calculate!(metric::LowerWickChangeEMA16h,data::SegmentData)

    segmentData = segment(data,:lower_wick_change_16h)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct LowerWickChangeEMA24h <: Metric
    
    timeSegments :: TimeSegments
    LowerWickChangeEMA24h() = new(TimeSegments(0.0))
end

function calculate!(metric::LowerWickChangeEMA24h,data::SegmentData)

    segmentData = segment(data,:lower_wick_change_24h)

    calculate_segments_ema!(segmentData,metric) 
end

mutable struct LowerWickChangeEMA48h <: Metric
    
    timeSegments :: TimeSegments
    LowerWickChangeEMA48h() = new(TimeSegments(0.0))
end

function calculate!(metric::LowerWickChangeEMA48h,data::SegmentData)

    segmentData = segment(data,:lower_wick_change_48h)

    calculate_segments_ema!(segmentData,metric) 
end