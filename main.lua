Input = require('src.utils.input')
Paddle = require('src.entities.paddle')
Ball = require('src.entities.ball')

function love.load()
    paddle1 = Paddle:init{
        x = 20, y = 0
    }
    ball = Ball:init{
        x = 20, y = 20
    }
    ball:setAngle(math.random() * 2 * math.pi)
end

function love.update(dt)
    Input.readInput()
    paddle1:update(dt)
    ball:update(dt)
    Input.clearPressed()
end

function love.draw()
    paddle1:draw()
    ball:draw()
end

function love.keypressed(key)
    Input.setKeyDown(key)
    Input.setKeyPressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.mousepressed(x, y, button, isTouch)
    -- Input.setMouseDown(button)
end