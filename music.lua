-- Play some audio
fight = love.audio.newSource("sounds/filmfight.wav", "static") -- the "static" tells LÖVE to load the file into memory, good for short sound effects
music = love.audio.newSource("sounds/epic.mp3", "stream") -- the "stream" tells LÖVE to stream the file from disk, good for longer music tracks

fight:play()
music:play()
