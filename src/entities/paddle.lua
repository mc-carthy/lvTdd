CONST = require('src.utils.constants')
Input = require('src.utils.input')

local Paddle = {}

local speed = 250
local size = {
    x = 20,
    y = 80
}

function Paddle:init(params)
    local inst = {}

    inst.x = params.x or 0
    inst.y = params.y or 0
    inst.size = size

    inst.update = self.update
    inst.draw = self.draw

    return inst
end

function Paddle:update(dt)
    if Input.keyDown('down') then
        self.y = self.y + speed * dt
    end
    if Input.keyDown('up') then
        self.y = self.y - speed * dt
    end
    if self.y < 0 then
        self.y = 0
    end
    if self.y + self.size.y > CONST.SCREEN.HEIGHT then
        self.y = CONST.SCREEN.HEIGHT - self.size.y
    end
end
-- luacov: disable
function Paddle:draw()
    love.graphics.rectangle('fill', self.x, self.y, size.x, size.y)
end
-- luacov: enable

return Paddle