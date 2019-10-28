Input = require('src.utils.input')
Paddle = require('src.entities.paddle')

describe('Paddle tests', function()
    describe('movement tests', function() 
        
        local paddle

        setup(function() 
            paddle = Paddle:init{
                x = 20,
                y = 20
            }
        end)

        before_each(function()
            paddle.x, paddle.y = 20, 20
            Input.clearInput()
        end)

        it('should move down when the down key is pressed', function()
            local initialPaddleY = paddle.y
            Input.setKeyDown('down', true)
            paddle:update(0.1)
            local finalPaddleY = paddle.y
            assert.is_true(finalPaddleY > initialPaddleY, "Paddle has not moved down, initial y position: " .. initialPaddleY .. ' - final y position: ' .. finalPaddleY)
        end)

        it('should move up when the up key is pressed', function()
            local initialPaddleY = paddle.y
            Input.setKeyDown('up', true)
            paddle:update(0.1)
            local finalPaddleY = paddle.y
            assert.is_true(finalPaddleY < initialPaddleY, "Paddle has not moved up, initial y position: " .. initialPaddleY .. ' - final y position: ' .. finalPaddleY)
        end)
    end)
end)