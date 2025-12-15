function calculate_segments!(func::Function,metrics::Metric,segmentData::SegmentDataConverted, errorVal::Float64)

    for (segment, minVal) in SEGMENT_MIN_VALS
        metricField = SEGMENT_TO_METRIC[segment]
        segmentVal = getfield(segmentData, segment)
     
        setfield!(metrics.timeSegments, metricField, 
            size(segmentVal, 1) >= minVal ? func(segmentVal) : errorVal)
    end
end

mutable struct STD <: OHLCVbase
    
    timeSegments :: TimeSegments
    STD() = new(TimeSegments(ERRORVAL))
end

"""
    calculate!(metric::struct, data::SegmentData)

    Updates given metric object on calculation based on object type, using `data`.
"""
function calculate!(metric::STD, data::SegmentData)

    segmentData = segment(data,:close)

    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct Volatility <: OHLCVbase
    
    timeSegments :: TimeSegments
    Volatility() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::Volatility, data::SegmentData)

    segmentData = segment(data,:close)

    calculate_segments!(_volatility,metric,segmentData,ERRORVAL)
end

mutable struct William <: OHLCVbase
    
    timeSegments :: TimeSegments
    William() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::William,data::SegmentData)

    segmentData = segment(data,:close)
    
    if isempty(segmentData.oneHour)
        currentPrice = 0.0
    else
        currentPrice = segmentData.oneHour[end]
    end

    for (segment, minVal) in SEGMENT_MIN_VALS
        metricField = SEGMENT_TO_METRIC[segment]
        segmentVal = getfield(segmentData, segment)
        
        setfield!(metrics.timeSegments, metricField, 
            size(segmentVal, 1) >= minVal ? 
            _william(maximum(segmentVal),minimum(segmentVal),currentPrice) : ERRORVAL)
    end
end

mutable struct Stochastic <: OHLCVbase
    
    timeSegments :: TimeSegments
    Stochastic() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::Stochastic, data::SegmentData)

    segmentData = segment(data,:close)
    
    if isempty(segmentData.oneHour)
        currentPrice = 0.0
    else
        currentPrice = segmentData.oneHour[end]
    end

    for (segment, minVal) in SEGMENT_MIN_VALS
        metricField = SEGMENT_TO_METRIC[segment]
        segmentVal = getfield(segmentData, segment)
        
        setfield!(metrics.timeSegments, metricField, 
            size(segmentVal, 1) >= minVal ? 
            _stochastic(maximum(segmentVal),minimum(segmentVal),currentPrice) : ERRORVAL)
    end
end

function calculate_segments_tsi!(metrics::Metric,latestData,metricDict::Dict)

    for (segment, metricName) in metricDict
        
        if !isempty(latestData)

            setfield!(metrics.timeSegments,segment, 
            _tsi(latestData[metricName[1]],latestData[metricName[2]]))
        else

            @warn "empty value, tsi", metricName[1], metricName[2]
            setfield!(metrics.timeSegments,segment,ERRORVAL)
        end
    end
end

mutable struct TSI5m <: Metric
    
    timeSegments :: TimeSegments
    TSI5m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::TSI5m,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("dema_price_change_5m", "dema_abs_price_change_5m")
    metricDict = dicsymbol(metricsList)

    calculate_segments_tsi!(metrics,latestData,metricDict)
end

mutable struct TSI15m <: Metric
    
    timeSegments :: TimeSegments
    TSI15m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::TSI15m,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("dema_price_change_15m", "dema_abs_price_change_15m")
    metricDict = dicsymbol(metricsList)

    calculate_segments_tsi!(metrics,latestData,metricDict)
end

mutable struct TSI30m <: Metric
    
    timeSegments :: TimeSegments
    TSI30m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::TSI30m,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("dema_price_change_30m", "dema_abs_price_change_30m")
    metricDict = dicsymbol(metricsList)

    calculate_segments_tsi!(metrics,latestData,metricDict)
end

mutable struct TSI1h <: Metric
    
    timeSegments :: TimeSegments
    TSI1h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::TSI1h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("dema_price_change_1h", "dema_abs_price_change_1h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_tsi!(metrics,latestData,metricDict)
end

mutable struct TSI2h <: Metric
    
    timeSegments :: TimeSegments
    TSI2h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::TSI2h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("dema_price_change_2h", "dema_abs_price_change_2h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_tsi!(metrics,latestData,metricDict)
end

mutable struct TSI4h <: Metric
    
    timeSegments :: TimeSegments
    TSI4h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::TSI4h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("dema_price_change_4h", "dema_abs_price_change_4h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_tsi!(metrics,latestData,metricDict)
end

mutable struct TSI8h <: Metric
    
    timeSegments :: TimeSegments
    TSI8h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::TSI8h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("dema_price_change_8h", "dema_abs_price_change_8h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_tsi!(metrics,latestData,metricDict)
end

mutable struct TSI12h <: Metric
    
    timeSegments :: TimeSegments
    TSI12h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::TSI12h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("dema_price_change_12h", "dema_abs_price_change_12h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_tsi!(metrics,latestData,metricDict)
end

mutable struct TSI16h <: Metric
    
    timeSegments :: TimeSegments
    TSI16h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::TSI16h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("dema_price_change_16h", "dema_abs_price_change_16h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_tsi!(metrics,latestData,metricDict)
end

mutable struct TSI24h <: Metric
    
    timeSegments :: TimeSegments
    TSI24h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::TSI24h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end


    metricsList = gendoublesymbols("dema_price_change_24h", "dema_abs_price_change_24h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_tsi!(metrics,latestData,metricDict)
end

mutable struct TSI48h <: Metric
    
    timeSegments :: TimeSegments
    TSI48h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::TSI48h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("dema_price_change_48h", "dema_abs_price_change_48h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_tsi!(metrics,latestData,metricDict)
end

mutable struct OBV <: OHLCVbase

    value :: Float64

    OBV() = new(0.0)
end 

function calculate!(metric::OBV,data::SegmentData)

    if data.oneHour[:,:close] isa Vector{Union{Missing, Decimals.Decimal}}
        data.oneHour[!,:close] = number.(data.oneHour[!,:close])
    end

    if nrow(data.oneHour) < 2 
        @warn "empty value, obv"
        metric.value = 0.0 #A more reliable reset on OBV value
    else
        latestData = last(data.oneHour)
        metric.value = _obv(data.oneHour[end-1,:close],latestData[:close],metric.value,latestData[:volume])
    end
end

mutable struct DiffOBV <: Metric
    
    timeSegments :: TimeSegments
    DiffOBV() = new(TimeSegments(0.0))
end

function calculate!(metrics::DiffOBV, data::SegmentData)

    segmentData = segment(data,:obv)  

    if isempty(segmentData.oneHour)
        latestOBV = 0.0
    else
        latestOBV = segmentData.oneHour[end]
    end

    for (segment, minVal) in SEGMENT_MIN_VALS
        metricField = SEGMENT_TO_METRIC[segment]
        segmentVal = getfield(segmentData, segment)
       
        setVal = 0.0

        if size(segmentVal,1) >= minVal
            
           
            setVal = number(Decimal(latestOBV) - Decimal(first(segmentVal)))
                
            # setVal = latestOBV-first(segmentVal)
            
            # end  
        end

        setfield!(metrics.timeSegments, metricField, Float64(setVal))
    end 
end

mutable struct CCI <: OHLCVbase
    
    timeSegments :: TimeSegments
    CCI() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::CCI,data::SegmentData)
    
    segmentData = segment(data,:close)  
    
    calculate_segments!(_cci,metric,segmentData,ERRORVAL)
end

function calculate_segments_macd!(metrics::Metric,latestData,metricDict::Dict)

    for (segment, metricName) in metricDict
        
        if !isempty(latestData)

            val = number(Decimal(latestData[metricName[1]])) - number(Decimal(latestData[metricName[2]]))
            setfield!(metrics,segment,Float64(val))
        else
            @warn "empty value, macd", metricName[1], metricName[2]
            setfield!(metrics,segment,0.0)
        end
    end
end

mutable struct MACD5m <: Metric

    t15m :: Float64
    t30m :: Float64
    t1h :: Float64
    t2h :: Float64
    t4h :: Float64
    t8h :: Float64
    t12h :: Float64
    t16h :: Float64
    t24h :: Float64
    t48h :: Float64

    MACD5m() = new(0,0,0,0,0,0,0,0,0,0)
end

function calculate!(metrics::MACD5m,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["15m", "30m", "1h", "2h", "4h", "8h", "12h", "16h", "24h", "48h"]
    segmentSymbols = [:t15m, :t30m, :t1h, :t2h, :t4h, :t8h, :t12h, :t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_5m", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_macd!(metrics,latestData,metricDict)
end

mutable struct MACD15m <: Metric

    t30m :: Float64
    t1h :: Float64
    t2h :: Float64
    t4h :: Float64
    t8h :: Float64
    t12h :: Float64
    t16h :: Float64
    t24h :: Float64
    t48h :: Float64

    MACD15m() = new(0,0,0,0,0,0,0,0,0)
end

function calculate!(metrics::MACD15m,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["30m", "1h", "2h", "4h", "8h", "12h", "16h", "24h", "48h"]
    segmentSymbols = [:t30m, :t1h, :t2h, :t4h, :t8h, :t12h, :t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_15m", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_macd!(metrics,latestData,metricDict)
end

mutable struct MACD30m <: Metric

    t1h :: Float64
    t2h :: Float64
    t4h :: Float64
    t8h :: Float64
    t12h :: Float64
    t16h :: Float64
    t24h :: Float64
    t48h :: Float64

    MACD30m() = new(0,0,0,0,0,0,0,0)
end

function calculate!(metrics::MACD30m,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["1h", "2h", "4h", "8h", "12h", "16h", "24h", "48h"]
    segmentSymbols = [:t1h, :t2h, :t4h, :t8h, :t12h, :t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_30m", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_macd!(metrics,latestData,metricDict)
end

mutable struct MACD1h <: Metric

    t2h :: Float64
    t4h :: Float64
    t8h :: Float64
    t12h :: Float64
    t16h :: Float64
    t24h :: Float64
    t48h :: Float64

    MACD1h() = new(0,0,0,0,0,0,0)
end

function calculate!(metrics::MACD1h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["2h", "4h", "8h", "12h", "16h", "24h", "48h"]
    segmentSymbols = [:t2h, :t4h, :t8h, :t12h, :t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_1h", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_macd!(metrics,latestData,metricDict)
end

mutable struct MACD2h <: Metric

    t4h :: Float64
    t8h :: Float64
    t12h :: Float64
    t16h :: Float64
    t24h :: Float64
    t48h :: Float64

    MACD2h() = new(0,0,0,0,0,0)
end

function calculate!(metrics::MACD2h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["4h", "8h", "12h", "16h", "24h", "48h"]
    segmentSymbols = [:t4h, :t8h, :t12h, :t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_2h", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_macd!(metrics,latestData,metricDict)
end

mutable struct MACD4h <: Metric

    t8h :: Float64
    t12h :: Float64
    t16h :: Float64
    t24h :: Float64
    t48h :: Float64

    MACD4h() = new(0,0,0,0,0)
end

function calculate!(metrics::MACD4h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["8h", "12h", "16h", "24h", "48h"]
    segmentSymbols = [:t8h, :t12h, :t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_4h", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_macd!(metrics,latestData,metricDict)
end

mutable struct MACD8h <: Metric

    t12h :: Float64 
    t16h :: Float64 
    t24h :: Float64 
    t48h :: Float64 

    MACD8h() = new(0,0,0,0) 
end

function calculate!(metrics::MACD8h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["12h", "16h", "24h", "48h"]
    segmentSymbols = [:t12h, :t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_8h", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_macd!(metrics,latestData,metricDict)
end

mutable struct MACD12h <: Metric

    t16h :: Float64
    t24h :: Float64
    t48h :: Float64

    MACD12h() = new(0,0,0)
end

function calculate!(metrics::MACD12h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["16h", "24h", "48h"]
    segmentSymbols = [:t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_12h", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_macd!(metrics,latestData,metricDict)
end

mutable struct MACD16h <: Metric

    t24h :: Float64
    t48h :: Float64

    MACD16h() = new(0,0)
end

function calculate!(metrics::MACD16h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["24h", "48h"]
    segmentSymbols = [:t24h, :t48h]

    metricsList = gensymbols("ema_16h", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_macd!(metrics,latestData,metricDict)
end

mutable struct SMA <: OHLCVbase
    
    timeSegments :: TimeSegments
    SMA() = new(TimeSegments(0.0))
end

function calculate!(metric::SMA, data::SegmentData)

    segmentData = segment(data,:close)  
    
    calculate_segments!(_sma,metric,segmentData,0.0) 
end

function calculate_segments_dema!(metrics::Metric,latestData,metricDict::Dict)

    for (segment, metricName) in metricDict

        if !isempty(latestData)
            setfield!(metrics.timeSegments,segment, 
            _dema(latestData[metricName[1]],latestData[metricName[2]]))
        else
            @warn "empty value, dema", metricName[1], metricName[2]
            setfield!(metrics.timeSegments,segment,ERRORVAL)
        end
    end
end

mutable struct DEMA5m <: Metric
    
    timeSegments :: TimeSegments
    DEMA5m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::DEMA5m, data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("ema", "ema_ema_5m")
    metricDict = dicsymbol(metricsList)

    calculate_segments_dema!(metrics,latestData,metricDict)
end

mutable struct DEMA15m <: Metric
    
    timeSegments :: TimeSegments
    DEMA15m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::DEMA15m, data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("ema", "ema_ema_15m")
    metricDict = dicsymbol(metricsList)

    calculate_segments_dema!(metrics,latestData,metricDict)
end

mutable struct DEMA30m <: Metric
    
    timeSegments :: TimeSegments
    DEMA30m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::DEMA30m, data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("ema", "ema_ema_30m")
    metricDict = dicsymbol(metricsList)

    calculate_segments_dema!(metrics,latestData,metricDict)
end

mutable struct DEMA1h <: Metric
    
    timeSegments :: TimeSegments
    DEMA1h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::DEMA1h, data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("ema", "ema_ema_1h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_dema!(metrics,latestData,metricDict)
end

mutable struct DEMA2h <: Metric
    
    timeSegments :: TimeSegments
    DEMA2h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::DEMA2h, data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("ema", "ema_ema_2h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_dema!(metrics,latestData,metricDict)
end

mutable struct DEMA4h <: Metric
    
    timeSegments :: TimeSegments
    DEMA4h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::DEMA4h, data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("ema", "ema_ema_4h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_dema!(metrics,latestData,metricDict)
end

mutable struct DEMA8h <: Metric
    
    timeSegments :: TimeSegments
    DEMA8h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::DEMA8h, data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("ema", "ema_ema_8h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_dema!(metrics,latestData,metricDict)
end

mutable struct DEMA12h <: Metric
    
    timeSegments :: TimeSegments
    DEMA12h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::DEMA12h, data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("ema", "ema_ema_12h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_dema!(metrics,latestData,metricDict)
end

mutable struct DEMA16h <: Metric
    
    timeSegments :: TimeSegments
    DEMA16h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::DEMA16h, data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("ema", "ema_ema_16h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_dema!(metrics,latestData,metricDict)
end

mutable struct DEMA24h <: Metric
    
    timeSegments :: TimeSegments
    DEMA24h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::DEMA24h, data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("ema", "ema_ema_24h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_dema!(metrics,latestData,metricDict)
end

mutable struct DEMA48h <: Metric
    
    timeSegments :: TimeSegments
    DEMA48h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metrics::DEMA48h, data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    metricsList = gendoublesymbols("ema", "ema_ema_48h")
    metricDict = dicsymbol(metricsList)

    calculate_segments_dema!(metrics,latestData,metricDict)
end

function calculate_segments_ppo!(metrics::Metric,latestData,metricDict::Dict)

    for (segment, metricName) in metricDict
        
        if !isempty(latestData)
            setfield!(metrics,segment, 
            _ppo(latestData[metricName[1]],latestData[metricName[2]]))
        else
            @warn "empty value, ppo", metricName[1], metricName[2]
            setfield!(metrics,segment,ERRORVAL)
        end
    end
end

mutable struct PPO5m <: Metric

    t15m :: Float64
    t30m :: Float64
    t1h :: Float64
    t2h :: Float64
    t4h :: Float64
    t8h :: Float64
    t12h :: Float64
    t16h :: Float64
    t24h :: Float64
    t48h :: Float64
    
    PPO5m() = new(ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL) 
end

function calculate!(metrics::PPO5m,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["15m", "30m", "1h", "2h", "4h", "8h", "12h", "16h", "24h", "48h"]
    segmentSymbols = [:t15m, :t30m, :t1h, :t2h, :t4h, :t8h, :t12h, :t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_5m", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_ppo!(metrics,latestData,metricDict)
end

mutable struct PPO15m <: Metric

    t30m :: Float64
    t1h :: Float64
    t2h :: Float64
    t4h :: Float64
    t8h :: Float64
    t12h :: Float64
    t16h :: Float64
    t24h :: Float64
    t48h :: Float64
    
    PPO15m() = new(ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL) 
end

function calculate!(metrics::PPO15m,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["30m", "1h", "2h", "4h", "8h", "12h", "16h", "24h", "48h"]
    segmentSymbols = [:t30m, :t1h, :t2h, :t4h, :t8h, :t12h, :t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_15m", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_ppo!(metrics,latestData,metricDict)
end

mutable struct PPO30m <: Metric

    t1h :: Float64
    t2h :: Float64
    t4h :: Float64
    t8h :: Float64
    t12h :: Float64
    t16h :: Float64
    t24h :: Float64
    t48h :: Float64
    
    PPO30m() = new(ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL) 
end

function calculate!(metrics::PPO30m,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["1h", "2h", "4h", "8h", "12h", "16h", "24h", "48h"]
    segmentSymbols = [:t1h, :t2h, :t4h, :t8h, :t12h, :t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_30m", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_ppo!(metrics,latestData,metricDict)
end

mutable struct PPO1h <: Metric

    t2h :: Float64
    t4h :: Float64
    t8h :: Float64
    t12h :: Float64
    t16h :: Float64
    t24h :: Float64
    t48h :: Float64
    
    PPO1h() = new(ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL) 
end

function calculate!(metrics::PPO1h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["2h", "4h", "8h", "12h", "16h", "24h", "48h"]
    segmentSymbols = [:t2h, :t4h, :t8h, :t12h, :t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_1h", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_ppo!(metrics,latestData,metricDict)
end

mutable struct PPO2h <: Metric

    t4h :: Float64
    t8h :: Float64
    t12h :: Float64
    t16h :: Float64
    t24h :: Float64
    t48h :: Float64

    PPO2h() = new(ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL) 
end

function calculate!(metrics::PPO2h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["4h", "8h", "12h", "16h", "24h", "48h"]
    segmentSymbols = [:t4h, :t8h, :t12h, :t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_2h", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_ppo!(metrics,latestData,metricDict)
end

mutable struct PPO4h <: Metric

    t8h :: Float64
    t12h :: Float64
    t16h :: Float64
    t24h :: Float64
    t48h :: Float64

    PPO4h() = new(ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL) 
end

function calculate!(metrics::PPO4h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["8h", "12h", "16h", "24h", "48h"]
    segmentSymbols = [:t8h, :t12h, :t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_4h", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_ppo!(metrics,latestData,metricDict)
end

mutable struct PPO8h <: Metric

    t12h :: Float64
    t16h :: Float64
    t24h :: Float64
    t48h :: Float64

    PPO8h() = new(ERRORVAL,ERRORVAL,ERRORVAL,ERRORVAL) 
end

function calculate!(metrics::PPO8h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["12h", "16h", "24h", "48h"]
    segmentSymbols = [:t12h, :t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_8h", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_ppo!(metrics,latestData,metricDict)
end

mutable struct PPO12h <: Metric

    t16h :: Float64
    t24h :: Float64
    t48h :: Float64

    PPO12h() = new(ERRORVAL,ERRORVAL,ERRORVAL) 
end

function calculate!(metrics::PPO12h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["16h", "24h", "48h"]
    segmentSymbols = [:t16h, :t24h, :t48h]

    metricsList = gensymbols("ema_12h", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_ppo!(metrics,latestData,metricDict)
end

mutable struct PPO16h <: Metric

    t24h :: Float64
    t48h :: Float64

    PPO16h() = new(ERRORVAL) 
end

function calculate!(metrics::PPO16h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["24h", "48h"]
    segmentSymbols = [:t24h, :t48h]

    metricsList = gensymbols("ema_16h", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_ppo!(metrics,latestData,metricDict)
end

mutable struct PPO24h <: Metric

    t48h :: Float64

    PPO24h() = new(ERRORVAL) 
end

function calculate!(metrics::PPO24h,data::SegmentData)

    if isempty(data.oneHour)
        latestData = DataFrame()
    else
        latestData = last(data.oneHour)
    end

    segmentTimes = ["48h"]
    segmentSymbols = [:t48h]

    metricsList = gensymbols("ema_24h", "ema",segmentTimes)
    metricDict = dicsymbol(metricsList,segmentSymbols)

    calculate_segments_ppo!(metrics,latestData,metricDict)
end

mutable struct ATR <: OHLCVbase
    
    timeSegments :: TimeSegments
    ATR() = new(TimeSegments(0.0))
end

function calculate!(metrics::ATR,data::SegmentData)

    segmentData = segment(data,:close)  

    for (segment, minVal) in SEGMENT_MIN_VALS
        metricField = SEGMENT_TO_METRIC[segment]
        segmentVal = getfield(segmentData, segment)
        
        setfield!(metrics.timeSegments, metricField, 
            size(segmentVal, 1) >= minVal ? 
            Float64(_atr(maximum(segmentVal),minimum(segmentVal))) : 0.0)
    end
end

mutable struct STDATR5m <: Metric
    
    timeSegments :: TimeSegments
    STDATR5m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDATR5m,data::SegmentData)

    segmentData = segment(data,:atr_5m)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDATR15m <: Metric
    
    timeSegments :: TimeSegments
    STDATR15m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDATR15m,data::SegmentData)

    segmentData = segment(data,:atr_15m)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDATR30m <: Metric
    
    timeSegments :: TimeSegments
    STDATR30m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDATR30m,data::SegmentData)

    segmentData = segment(data,:atr_30m)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDATR1h <: Metric
    
    timeSegments :: TimeSegments
    STDATR1h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDATR1h,data::SegmentData)

    segmentData = segment(data,:atr_1h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDATR2h <: Metric
    
    timeSegments :: TimeSegments
    STDATR2h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDATR2h,data::SegmentData)

    segmentData = segment(data,:atr_2h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDATR4h <: Metric
    
    timeSegments :: TimeSegments
    STDATR4h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDATR4h,data::SegmentData)

    segmentData = segment(data,:atr_4h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDATR8h <: Metric
    
    timeSegments :: TimeSegments
    STDATR8h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDATR8h,data::SegmentData)

    segmentData = segment(data,:atr_8h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDATR12h <: Metric
    
    timeSegments :: TimeSegments
    STDATR12h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDATR12h,data::SegmentData)

    segmentData = segment(data,:atr_12h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDATR16h <: Metric
    
    timeSegments :: TimeSegments
    STDATR16h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDATR16h,data::SegmentData)

    segmentData = segment(data,:atr_16h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDATR24h <: Metric
    
    timeSegments :: TimeSegments
    STDATR24h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDATR24h,data::SegmentData)

    segmentData = segment(data,:atr_24h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct WATR <: OHLCVbase
    
    timeSegments :: TimeSegments
    WATR() = new(TimeSegments(0.0))
end

function calculate!(metrics::WATR,data::SegmentData)

    segmentDataHigh = segment(data,:high)  
    segmentDataLow = segment(data,:low)  

    for (segment, minVal) in SEGMENT_MIN_VALS
        metricField = SEGMENT_TO_METRIC[segment]
        segmentHighVal = getfield(segmentDataHigh, segment)
        segmentLowVal = getfield(segmentDataLow, segment)
        
        setfield!(metrics.timeSegments, metricField, 
            size(segmentHighVal, 1) >= minVal ? 
            Float64(_atr(maximum(segmentHighVal),minimum(segmentLowVal))) : 0.0)
    end 
end

mutable struct STDWATR5m <: Metric
    
    timeSegments :: TimeSegments
    STDWATR5m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDWATR5m,data::SegmentData)

    segmentData = segment(data,:watr_5m)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDWATR15m <: Metric
    
    timeSegments :: TimeSegments
    STDWATR15m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDWATR15m,data::SegmentData)

    segmentData = segment(data,:watr_15m)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDWATR30m <: Metric
    
    timeSegments :: TimeSegments
    STDWATR30m() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDWATR30m,data::SegmentData)

    segmentData = segment(data,:watr_30m)
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDWATR1h <: Metric
    
    timeSegments :: TimeSegments
    STDWATR1h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDWATR1h,data::SegmentData)

    segmentData = segment(data,:watr_1h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDWATR2h <: Metric
    
    timeSegments :: TimeSegments
    STDWATR2h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDWATR2h,data::SegmentData)

    segmentData = segment(data,:watr_2h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDWATR4h <: Metric
    
    timeSegments :: TimeSegments
    STDWATR4h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDWATR4h,data::SegmentData)

    segmentData = segment(data,:watr_4h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDWATR8h <: Metric
    
    timeSegments :: TimeSegments
    STDWATR8h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDWATR8h,data::SegmentData)

    segmentData = segment(data,:watr_8h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDWATR12h <: Metric
    
    timeSegments :: TimeSegments
    STDWATR12h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDWATR12h,data::SegmentData)

    segmentData = segment(data,:watr_12h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDWATR16h <: Metric
    
    timeSegments :: TimeSegments
    STDWATR16h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDWATR16h,data::SegmentData)

    segmentData = segment(data,:watr_16h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDWATR24h <: Metric
    
    timeSegments :: TimeSegments
    STDWATR24h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDWATR24h,data::SegmentData)

    segmentData = segment(data,:watr_24h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end

mutable struct STDWATR48h <: Metric
    
    timeSegments :: TimeSegments
    STDWATR48h() = new(TimeSegments(ERRORVAL))
end

function calculate!(metric::STDWATR48h,data::SegmentData)

    segmentData = segment(data,:watr_48h)  
 
    calculate_segments!(std,metric,segmentData,0.0)
end