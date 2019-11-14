local Vector = {}

function Vector:init(params)
    local inst = {}

    inst.x = params.x or 0
    inst.y = params.y or 0

    local mt = {
        __index = Vector,
        __add = self.add,
        __sub = self.subtract,
        __tostring = function(self)
            return 'x: ' .. self.x .. ' - y: ' .. self.y
        end
    }

    setmetatable(inst, mt)

    return inst
end

function Vector:getMagnitude()
    return math.sqrt(math.pow(self.x, 2) + math.pow(self.y, 2))
end

function Vector:getAngle()
    return math.atan2(self.y, self.x) 
end

function Vector:getAngleBetween(v2)
    local deltaVector = self.subtract(self, v2)
    return self.getAngle(deltaVector)
end

function Vector:add(v2)
    local dx = self.x + v2.x
    local dy = self.y + v2.y

    return Vector:init{
        x = dx,
        y = dy
    }
end

function Vector:subtract(v2)
    local dx = self.x - v2.x
    local dy = self.y - v2.y

    return Vector:init{
        x = dx,
        y = dy
    }
end

return Vector