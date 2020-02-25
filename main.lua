-- Images on screen
function love.load()
   glowingImage = love.graphics.newImage("art/glowing.png")
end

function love.draw()
   love.graphics.draw(glowingImage,100,100)
end

-- Play some audio
fight = love.audio.newSource("sounds/filmfight.wav", "static") -- the "static" tells LÖVE to load the file into memory, good for short sound effects
music = love.audio.newSource("sounds/epic.mp3", "stream") -- the "stream" tells LÖVE to stream the file from disk, good for longer music tracks

fight:play()
music:play()
