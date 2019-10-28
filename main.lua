Input = require('src.utils.input')
local Paddle = require('src.entities.paddle')

function love.load()
    paddle1 = Paddle:init{
        x = 20, y = 0
    }
end

function love.update(dt)
    Input.readInput()
    paddle1:update(dt)
    Input.clearInput()
end

function love.draw()
    paddle1:draw()
end