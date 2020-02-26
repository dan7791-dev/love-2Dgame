function love.load()
   menu = {"start", "options", "exit"}
   for i=1,#menu do
      print(menu[i])
   end
end

function love.draw()
   for i=1,#menu do
      love.graphics.print(menu[i], 100, 100 + 50 * i)
   end
end
