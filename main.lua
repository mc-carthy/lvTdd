Input = require('src.utils.input')
Paddle = require('src.entities.paddle')

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

function love.keypressed(key)
    Input.setKeyDown(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.mousepressed(x, y, button, isTouch)
    -- Input.setMouseDown(button)
end