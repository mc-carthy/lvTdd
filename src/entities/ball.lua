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
    inst.angle = params.angle or 0
    inst.speed = speed
    inst.radius = params.radius or 10

    inst.update = self.update
    inst.draw = self.draw

    inst.setPos = self.setPos
    inst.setAngle = self.setAngle
    inst.setSpeed = self.setSpeed
    inst.setVelocity = self.setVelocity
    
    inst.getPos = self.getPos
    inst.getAngle = self.getAngle
    inst.getSpeed = self.getSpeed
    inst.getVelocity = self.getVelocity

    inst.center = self.center
    inst.outOfBounds = self.outOfBounds
    inst.checkForWallCollision = self.checkForWallCollision

    return inst
end

function Ball:update(dt)
    local deltaPos = Vector2:init{
        x = math.cos(self.angle) * self.speed * dt,
        y = math.sin(self.angle) * self.speed * dt
    }

    self:setPos(self:getPos() + deltaPos)

    self:checkForWallCollision()
end

function Ball:draw()
    love.graphics.setColor(1, 0, 1)
    love.graphics.circle('fill', self.pos.x, self.pos.y, self.radius)
end

function Ball:getAngle()
    return self.angle
end

function Ball:getSpeed()
    return self.speed
end

function Ball:getVelocity()
    return {
        x = math.cos(self.angle) * self.speed,
        y = math.sin(self.angle) * self.speed
    }
end

function Ball:getPos()
    return Vector2:init{ x = self.pos.x, y = self.pos.y }
end

function Ball:setPos(a, b)
    -- Assume a is vector, add explicit check here
    if b == nil then
        self.pos.x = a.x
        self.pos.y = a.y
    else
        self.pos.x = a
        self.pos.y = b
    end
end

function Ball:setAngle(angle)
    self.angle = angle
end

function Ball:setSpeed(speed)
    self.speed = speed
end

function Ball:setVelocity(vel)
    local speed = Vector2.getMagnitude(vel)
    local angle = math.atan2(vel.y, vel.x)

    self:setSpeed(speed)
    self:setAngle(angle)
end

function Ball:center()
    self.pos.x = CONST.SCREEN.WIDTH / 2
    self.pos.y = CONST.SCREEN.HEIGHT / 2
end

function Ball:outOfBounds()
    if 
        (self.pos.x < (0 - self.radius) or
        self.pos.x > (CONST.SCREEN.WIDTH + self.radius) or
        self.pos.y < (0 - self.radius) or
        self.pos.y > (CONST.SCREEN.HEIGHT + self.radius))
    then
        return true
    else
        return false
    end
end

function Ball:checkForWallCollision()
    if (
        self.pos.y < self.radius or
        self.pos.y > (CONST.SCREEN.HEIGHT - self.radius)
    ) then
        local currentVel = self:getVelocity()
        self:setVelocity(Vector2:init{ x = currentVel.x, y = -currentVel.y })
    end
end

return Ball