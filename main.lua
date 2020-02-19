function love.draw()
   name = "Daniel"
   age = "42"
   love.graphics.print("Hello, my name is " ..name.. ", and I am " ..age.. " years old.", 100, 100)
end

-- Load some default values for our rectangle.
function love.load()
    x, y, w, h = 20, 20, 60, 20
end
     
-- Increase the size of the rectangle every frame.
function love.update(dt)
   w = w + 1
   h = h + 1
end
	     
-- Draw a coloured rectangle.
function love.draw()
   love.graphics.setColor(0, 0.4, 0.4)
   love.graphics.rectangle("fill", x, y, w, h)
end

-- Play some audio
sound = love.audio.newSource("attack.wav", "static") -- the "static" tells LÖVE to load the file into memory, good for short sound effects
music = love.audio.newSource("epic.mp3", "stream") -- the "stream" tells LÖVE to stream the file from disk, good for longer music tracks
sound:play()
music:play()
