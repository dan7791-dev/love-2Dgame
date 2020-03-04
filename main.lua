require("sounds.music")

function love.load()
    balloon = {}
    balloon.x = 200
    balloon.y = 200
    balloon.speed = 300
    balloon.angle = 0
    balloon.image = love.graphics.newImage("Balloons6.png")
end

function love.update(dt)
    mouse_x, mouse_y = love.mouse.getPosition()
    balloon.angle = math.atan2(mouse_y - balloon.y, mouse_x - balloon.x)
    cos = math.cos(balloon.angle)
    sin = math.sin(balloon.angle)

    balloon.x = balloon.x + balloon.speed * cos * dt
    balloon.y = balloon.y + balloon.speed * sin * dt
end

function love.draw()
    love.graphics.draw(balloon.image, balloon.x, balloon.y, balloon.angle)
    love.graphics.circle("fill", mouse_x, mouse_y, 5)
end

-- keyboard controls
function love.keypressed(key)
   if key == "escape" then love.event.quit() end
   if key == "1" then balloon.image = love.graphics.newImage("Balloons" .. 1 .. ".png") end
   if key == "2" then balloon.image = love.graphics.newImage("Balloons" .. 2 .. ".png") end
   if key == "3" then balloon.image = love.graphics.newImage("Balloons" .. 3 .. ".png") end
   if key == "4" then balloon.image = love.graphics.newImage("Balloons" .. 4 .. ".png") end
   if key == "5" then balloon.image = love.graphics.newImage("Balloons" .. 5 .. ".png") end
   if key == "6" then balloon.image = love.graphics.newImage("Balloons" .. 6 .. ".png") end
   if key == "7" then balloon.image = love.graphics.newImage("Balloons" .. 7 .. ".png") end
end
