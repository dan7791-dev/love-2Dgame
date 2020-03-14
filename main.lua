require("assets.animation")

red = 135/255
green = 206/255
blue = 235/255
alpha = 50/100
love.graphics.setBackgroundColor( red, green, blue, alpha)
love.window.setFullscreen(true, "desktop")

-- keyboard controls
function love.keypressed(key)
   if key == "escape" then love.event.quit() end
   if key == "1" then balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. 1 .. ".png") end
   if key == "2" then balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. 2 .. ".png") end
   if key == "3" then balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. 3 .. ".png") end
   if key == "4" then balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. 4 .. ".png") end
   if key == "5" then balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. 5 .. ".png") end
   if key == "6" then balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. 6 .. ".png") end
   if key == "7" then balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. 7 .. ".png") end
   if key == "space" then balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. math.random(7) .. ".png") end
end
