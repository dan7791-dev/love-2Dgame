-- game assets
require("art.animation")
require("sounds.music")

-- keyboard controls
function love.keypressed(key)
   if key == "escape" then love.event.quit() end
end
