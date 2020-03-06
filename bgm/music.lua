-- Play some audio
music = love.audio.newSource("bgm/up.mp3", "stream") -- the "stream" tells LÖVE to stream the file from disk, good for longer music tracks
music:setLooping(true)
music:play()
