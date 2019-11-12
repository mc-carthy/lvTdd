local CONST = require('src.utils.constants')
local Ball = {}

function Ball:init(params)
    local inst = {}

    inst.x = params.x or CONST.SCREEN.WIDTH / 2
    inst.y = params.y or CONST.SCREEN.HEIGHT / 2

    inst.update = self.update
    inst.draw = self.draw

    inst.getDirection = self.getDirection
    inst.getSpeed = self.getSpeed
    inst.getPos = self.getPos
    inst.center = self.center

    return inst
end

function Ball:update(dt)

end

function Ball:draw()
    
end

function Ball:getDirection()

end

function Ball:getSpeed()

end

function Ball:getPos()

end

function Ball:center()
    self.x = CONST.SCREEN.WIDTH / 2
    self.y = CONST.SCREEN.HEIGHT / 2
end

return Ball