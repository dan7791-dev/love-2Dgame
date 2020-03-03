function love.load()
   frames = {}
   
   for i=1,7 do
      table.insert(frames, love.graphics.newImage("art/Balloons/Balloons" .. i .. ".png"))
   end
   currentFrame = 1
end

function love.update(dt)
   currentFrame = currentFrame + 15 * dt
   if currentFrame >= 8 then
      currentFrame = 1
   end
end

function love.draw()
   love.graphics.draw(frames[math.floor(currentFrame)])
end
