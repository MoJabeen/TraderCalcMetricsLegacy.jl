mutable struct TimeSegments

    t5m :: Float64
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

    TimeSegments(errorVal)= new(errorVal,errorVal,errorVal,errorVal,errorVal,errorVal,errorVal,errorVal,errorVal,errorVal,errorVal)
end

mutable struct SegmentData

    fiveMin :: DataFrame
    fifteenMin :: DataFrame
    thirtyMin :: DataFrame
    oneHour :: DataFrame
    twoHour :: DataFrame
    fourHour :: DataFrame
    eightHour :: DataFrame
    twelveHour :: DataFrame
    sixteenHour :: DataFrame
    twentyFourHour :: DataFrame
    fortyEightHour :: DataFrame

    SegmentData() = new(DataFrame(),DataFrame(),DataFrame(),DataFrame(),DataFrame(),DataFrame(),DataFrame(),DataFrame(),DataFrame(),DataFrame(),DataFrame())
    SegmentData(fiveMin,fifteenMin,thirtyMin,oneHour,twoHour,fourHour,eightHour,twelveHour,sixteenHour,twentyFourHour,fortyEightHour) = new(
        fiveMin,fifteenMin,thirtyMin,oneHour,twoHour,fourHour,eightHour,twelveHour,sixteenHour,twentyFourHour,fortyEightHour)
    
end

mutable struct SegmentDataConverted

    fiveMin :: Vector
    fifteenMin :: Vector
    thirtyMin :: Vector
    oneHour :: Vector
    twoHour :: Vector
    fourHour :: Vector
    eightHour :: Vector
    twelveHour :: Vector
    sixteenHour :: Vector
    twentyFourHour :: Vector
    fortyEightHour :: Vector

    SegmentDataConverted() = new([],[],[],[],[],[],[],[],[],[],[])
    SegmentDataConverted(fiveMin,fifteenMin,thirtyMin,oneHour,twoHour,fourHour,eightHour,twelveHour,sixteenHour,twentyFourHour,fortyEightHour) = new(
        fiveMin,fifteenMin,thirtyMin,oneHour,twoHour,fourHour,eightHour,twelveHour,sixteenHour,twentyFourHour,fortyEightHour)
     
end

"""
    create_segment(data::DataFrame) -> SegmentData

    Returns dataframe of data into segmented dataframes over periods:
    5m,10m,15m,30m,1h,2h,4h and 8h. 
"""
function create_segment(data::DataFrame,startTime::DateTime)

    segmentData = SegmentData()

    if startTime != ERRORDATE 
        # startTime = floor(last(data[:,:timestamp]),Dates.Minute(1))

        segmentData = SegmentData(
            data[startTime .> data.timestamp .>= (startTime - Dates.Minute(5)),:],
            data[startTime .> data.timestamp .>= (startTime - Dates.Minute(15)),:],
            data[startTime .> data.timestamp .>= (startTime - Dates.Minute(30)),:],
            data[startTime .> data.timestamp .>= (startTime - Dates.Hour(1)),:],
            data[startTime .> data.timestamp .>= (startTime - Dates.Hour(2)),:],
            data[startTime .> data.timestamp .>= (startTime - Dates.Hour(4)),:],
            data[startTime .> data.timestamp .>= (startTime - Dates.Hour(8)),:],
            data[startTime .> data.timestamp .>= (startTime - Dates.Hour(12)),:],
            data[startTime .> data.timestamp .>= (startTime - Dates.Hour(16)),:],
            data[startTime .> data.timestamp .>= (startTime - Dates.Hour(24)),:],
            data[startTime .> data.timestamp .>= (startTime - Dates.Hour(48)),:]
        )

    else
        @warn "missing table values"
    end

    return segmentData
end

"""
    segment(data::SegmentData,metric::Symbol) -> SegmentDataConverted

    Converts then returns SegmentData into segmented vectors of periods:
    5m,10m,15m,30m,1h,2h,4h and 8h. For chosen `metric`.
"""
function segment(data::SegmentData,metric::Symbol)

    if isempty(data.oneHour)

        return SegmentDataConverted()
    else

        if data.oneHour[:,metric] isa Vector{Union{Missing, Decimals.Decimal}}
            data.fiveMin[!,metric] = number.(data.fiveMin[!,metric])
            data.fifteenMin[!,metric] = number.(data.fifteenMin[!,metric])
            data.thirtyMin[!,metric] = number.(data.thirtyMin[!,metric])
            data.oneHour[!,metric] = number.(data.oneHour[!,metric])
            data.twoHour[!,metric] = number.(data.twoHour[!,metric])
            data.fourHour[!,metric] = number.(data.fourHour[!,metric])
            data.eightHour[!,metric] = number.(data.eightHour[!,metric])
            data.twelveHour[!,metric] = number.(data.twelveHour[!,metric])
            data.sixteenHour[!,metric] = number.(data.sixteenHour[!,metric])
            data.twentyFourHour[!,metric] = number.(data.twentyFourHour[!,metric])
            data.fortyEightHour[!,metric] = number.(data.fortyEightHour[!,metric])
        end
    

        return SegmentDataConverted(
            data.fiveMin[:,metric],
            data.fifteenMin[:,metric],
            data.thirtyMin[:,metric],
            data.oneHour[:,metric],
            data.twoHour[:,metric],
            data.fourHour[:,metric],
            data.eightHour[:,metric],
            data.twelveHour[:,metric],
            data.sixteenHour[:,metric],
            data.twentyFourHour[:,metric],
            data.fortyEightHour[:,metric]
        )
    end

end

"""
    gensymbols(firstMetricName::String,secondMetricName::String) ->  Vector{Vector{Symbol}}

    Return array of arrays each array contains segment appended symbol of input params.
"""
function gensymbols(fixedMetricName::String,secondMetricName::String,segmentTimes::Vector=SEGMENT_TIMES)
    
    result = Vector{Vector{Symbol}}()
    
    for time in segmentTimes
        symbol_pair = [
            Symbol(fixedMetricName),
            Symbol(secondMetricName * "_$(time)")
        ]
        push!(result, symbol_pair)
    end
    
    return result
end

"""
    gensymbols(firstMetricName::String,secondMetricName::String) ->  Vector{Vector{Symbol}}

    Return array of arrays each array contains segment appended symbol of input params.
"""
function gendoublesymbols(firstMetricName::String,secondMetricName::String)
    
    result = Vector{Vector{Symbol}}()
    
    for time in SEGMENT_TIMES
        symbol_pair = [
            Symbol(firstMetricName * "_$(time)"),
            Symbol(secondMetricName * "_$(time)")
        ]
        push!(result, symbol_pair)
    end
    
    return result
end

"""
    dicsymbol(symbolVector::Vector) -> Dict

    Return dict with each segment symbol as key and pair of metric symbols as value.
"""
function dicsymbol(symbolVector::Vector, segmentSymbols::Vector=SEGMENT_SYMBOLS)

    result = Dict{Symbol, Vector{Symbol}}()

    for i in eachindex(segmentSymbols)
        result[segmentSymbols[i]] = symbolVector[i]
    end

    return result
end
