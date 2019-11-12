CONST = require('src.utils.constants')
Input = require('src.utils.input')
Vector2 = require('src.utils.vector2')
Ball = require('src.entities.ball')

describe('Ball tests #ball', function()
    describe('movement tests', function() 
        
        local ball

        setup(function() 
            ball = Ball:init{}
        end)

        before_each(function()
            ball:center()
            Input.clearInput()
        end)
        
        it('should move in a straight line if not interrupted', function()
            local currentSpeed = ball:getSpeed()
            local currentDirection = ball:getDirection()
            local initialBallPos = ball:getPos()
            local dt = 1
            ball:update(dt)
            local finalBallPos = ball:getPos()
            local distTravelled = Vector2:getMagnitude(finalBallPos - initialBallPos)
            local direction = Vector2:angle(initialBallPos, finalBallPos)
            assert.is_equal(currentDirection, direction, "Expected direction to be " .. currentDirection .. ", actual angle was " .. direction)
            assert.is_equal(distTravelled, currentSpeed * dt, "Expected ball to travel " .. (currentSpeed * dt) .. ", ball actually travelled " .. distTravelled)
        end)
    end)
end)