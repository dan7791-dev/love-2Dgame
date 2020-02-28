function love.load()
   menu = {"start", "exit"}
end

function love.draw()
      love.graphics.print(menu[1], 100, 100 + 50 * 1)
      love.graphics.print(menu[2], 100, 100 + 50 * 2)
      if love.keyboard.isDown("up") then 
         love.graphics.rectangle("line", 100, 100 + 50 * 1, 35, 25)
      elseif love.keyboard.isDown("down") then
         love.graphics.rectangle("line", 100, 100 + 50 * 2, 35, 25)
      end
end
