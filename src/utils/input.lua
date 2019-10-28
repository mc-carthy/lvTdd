local Input = {}

local keysPressed = {}
local keysDown = {}
local mousePressed = {}
local mouseDown = {}

function Input.keyDown(key)
    return keysDown[key]
end

function Input.keyPressed(key)
    return keysPressed[key]
end

function Input.readInput()
    for k, v in pairs(keysDown) do
        if not love.keyboard.isDown(k) then
            keysDown[k] = false
        end
    end
    for k, v in pairs(mouseDown) do
        if not love.mouse.isDown(k) then
            mouseDown[k] = false
        end
    end
end

function Input.clearInput()
    keysPressed = {}
    mousePressed = {}
end

function love.keypressed(key)
    keysPressed[key] = true
    keysDown[key] = true
    if key == 'escape' then
        love.event.quit()
    end
end

function love.mousepressed(x, y, button, isTouch)
    mousePressed[button] = true
    mouseDown[button] = true
end

return Input