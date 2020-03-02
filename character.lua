-- Images on screen
function love.load()
   glowingImage = love.graphics.newImage("art/glowing.png")
end

function love.draw()
   love.graphics.draw(glowingImage,100,100)
end

