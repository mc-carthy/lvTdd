local CONST = require('src.utils.constants')
local Vector2 = require('src.utils.vector2')
local Ball = {}

local speed = 100

function Ball:init(params)
    local inst = {}

    inst.pos = Vector2:init{
        x = params.x or CONST.SCREEN.WIDTH / 2,
        y = params.y or CONST.SCREEN.HEIGHT / 2
    }
    inst.direction = params.direction or 0
    inst.speed = speed

    inst.update = self.update
    inst.draw = self.draw

    inst.setPos = self.setPos
    inst.getDirection = self.getDirection
    inst.getSpeed = self.getSpeed
    inst.getPos = self.getPos
    inst.center = self.center

    return inst
end

function Ball:update(dt)
    local deltaPos = Vector2:init{
        x = math.cos(self.direction) * self.speed * dt,
        y = math.sin(self.direction) * self.speed * dt
    }

    self:setPos(self:getPos() + deltaPos)
end

function Ball:draw()
    love.graphics.setColor(1, 0, 1)
    love.graphics.circle('fill', self.pos.x, self.pos.y, 10)
end

function Ball:getDirection()
    return self.direction
end

function Ball:getSpeed()
    return self.speed
end

function Ball:getPos()
    return self.pos
end

function Ball:setPos(a, b)
    -- Assume a is vector, add explicit check here
    if b == nil then
        self.pos = a
    else
        self.pos.x = a
        self.pos.y = b
    end
end

function Ball:center()
    self.x = CONST.SCREEN.WIDTH / 2
    self.y = CONST.SCREEN.HEIGHT / 2
end

return Ball