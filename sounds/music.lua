-- Play some audio
music = love.audio.newSource("sounds/epic.mp3", "stream") -- the "stream" tells LÖVE to stream the file from disk, good for longer music tracks

music:play()
