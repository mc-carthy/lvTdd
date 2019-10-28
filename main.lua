keysPressed = {}
keysDown = {}
mousePressed = {}
mouseDown = {}


function love.load()

end

function love.update(dt)
    updateKeyboardMouse()
    print(mouseDown[1])
end

function love.draw()

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

function updateKeyboardMouse()
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
    keysPressed = {}
    mousePressed = {}
end