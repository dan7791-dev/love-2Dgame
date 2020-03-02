local enemies = {}

function newEnemy(x,y)
  local enemy = {}
  enemy.x = x
  enemy.y = y
  enemy.width = 64
  enemy.height = 64
  enemy.removed = false
  table.insert(enemies, enemy)
end


function love.load()
  monster = love.graphics.newImage("art/glowing.png")
  newEnemy(0, 0)
  newEnemy(100, 100)
  newEnemy(200, 200)
end


function love.update(dt)
  for i=#enemies, 1, -1 do
    local enemy = enemies[i]
    if not enemy.removed then
      -- update enemy
    else table.remove(enemies, i) end
  end
end


function love.draw()
  for i=#enemies, 1, -1 do
    local enemy = enemies[i]
    -- draw stuff
    love.graphics.draw(monster, enemy.x, enemy.y, enemy.width, enemy.height)
  end
end


function love.keypressed(key)
  if key == "escape" then love.event.quit() end
  if key == "space" and #enemies > 0 then enemies[#enemies].removed = true end
end
