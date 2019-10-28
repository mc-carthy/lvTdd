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
end

function Paddle:draw()
    love.graphics.rectangle('fill', self.x, self.y, size.x, size.y)
end

return Paddle