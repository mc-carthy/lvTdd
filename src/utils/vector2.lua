local Vector = {}

function Vector:init(params)
    local inst = {}

    inst.x = params.x or 0
    inst.y = params.y or 0

    return inst
end

function Vector:getMagnitude()

end

function Vector:angle()

end

return Vector