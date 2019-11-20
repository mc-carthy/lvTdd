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
            local currentAngle = ball:getAngle()
            local initialBallPos = ball:getPos()
            local dt = 1
            ball:update(dt)
            local finalBallPos = ball:getPos()
            local displacementVector = finalBallPos - initialBallPos
            local distTravelled = displacementVector:getMagnitude()
            local angle = displacementVector:getAngle()
            assert.is_equal(currentAngle, angle, "Expected angle to be " .. currentAngle .. ", actual angle was " .. angle)
            assert.is_equal(distTravelled, currentSpeed * dt, "Expected ball to travel " .. (currentSpeed * dt) .. ", ball actually travelled " .. distTravelled)
        end)


        it('should be destroyed if moved off screen', function()
            ball:setPos{ x = 10, y = 10 }
            ball:setAngle(-math.pi)
            ball:update(0.5)
            assert.is_true(ball:outOfBounds())
        end)
    end)
end)