function _period(dataSize::Int)

    if dataSize <=5
        return 5
    elseif 5<dataSize<=10
        return 10
    elseif 10<dataSize<=15
        return 15
    elseif 15<dataSize<=30
        return 30
    elseif 30<dataSize<=60
        return 60
    elseif 60<dataSize<=120
        return 120
    elseif 120<dataSize<=240
        return 240
    elseif 240<dataSize<=480
        return 480
    elseif 480<dataSize<=720
        return 720
    elseif 720<dataSize<=960
        return 960
    elseif 960<dataSize<=1440
        return 1440
    elseif 1440<dataSize<=2880
        return 2880
    end

    @error("Invalid size of entry ","Data Size: ",dataSize)
    error("Invalid size of entry ","Data Size: ",dataSize)

end


function _volatility(data::Vector)

    if data isa Vector{Union{Missing, Decimals.Decimal}}
        data = number.(data)
    end

    currentSTD = std(data)

    vol = currentSTD/mean(data)

    return Float64(vol)
end


function _obv(open,close,prevOBV,volume)

    if volume isa Decimals.Decimal    
        volume = number(volume)
    end

    if open > close
        obv = prevOBV - volume
    else
        obv = prevOBV + volume
    end

    return Float64(obv)
end

function _sma(data::Vector)

    if data isa Vector{Union{Missing, Decimals.Decimal}}
        data = number.(data)
    end

    average = mean(data)

    return Float64(average)

end

#Default smoothing of 2.
function _ema(data::Vector, prevEMA,smoothing::Int=2)

    if data isa Vector{Union{Missing, Decimals.Decimal}}
        data = number.(data)
    end

    if size(data,1) == 481
        @info "check data lentgh" data
    end

    factor = smoothing/ (1+_period(size(data,1)))

    if prevEMA == ERRORVAL || prevEMA == 0
        smaVal = _sma(data)

        return smaVal
    end

    result = prevEMA + factor*(data[end] - prevEMA)

    return Float64(result)

end


function _dema(emaVal,demaVal)

    if emaVal == ERRORVAL || emaVal == 0 || demaVal == ERRORVAL || demaVal == 0
        return ERRORVAL
    end
 
    result = 2*emaVal - demaVal

    return Float64(result)

end


function _cci(data::Vector)

    if data isa Vector{Union{Missing, Decimals.Decimal}}
        data = number.(data)
    end

    stdVal = std(data)

    if stdVal == 0
        result = 0
    else
        result = (data[end] - _sma(data)) / std(data)
    end

    return Float64(result)
end


function _william(high, low, price)

    if high == low
        result = 100
    else
        result = (high - price) / (high - low)
        result *= 100
    end

    return Float64(result)
end

function _stochastic(high, low, price)

    if high == low
        result = 100
    else
        result = (price - low) / (high - low)
        result *= 100
    end

    return Float64(result)
end 

function _tsi(pcDEMA,apcDEMA)

    if pcDEMA == ERRORVAL || apcDEMA == ERRORVAL
        return ERRORVAL
    end

   if apcDEMA ==0 && pcDEMA ==0
        result = 0 
    else
        result = 100* (pcDEMA/apcDEMA)
    end

    return Float64(result)
end

function _atr(high,low)

    result = number(Decimal(high)-Decimal(low))

    return Float64(result)
end

function _ppo(shortEMA,longEMA)

    if shortEMA == 0 || longEMA == 0
        return ERRORVAL
    end

    result = 100 * (shortEMA - longEMA)/longEMA 

    return Float64(result)
end