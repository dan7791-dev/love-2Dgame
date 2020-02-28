function love.load()
   menu = {"start", "exit"}
end

function love.draw()
   for i=1, #menu do
      love.graphics.print(menu[i], 100, 100 + 50 * i)
      love.graphics.print(menu[i], 100, 100 + 50 * i)
   end

   current_menu = 1
   if love.keyboard.isDown("up") then 
      love.graphics.rectangle("line", 100, 100 + 50 * current_menu, 35, 25)
   elseif love.keyboard.isDown("down") then
      love.graphics.rectangle("line", 100, 100 + 50 * current_menu + 50, 35, 25)
   end
end
