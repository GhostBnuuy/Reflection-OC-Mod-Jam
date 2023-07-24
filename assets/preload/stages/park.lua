local path = 'backgrounds/2/'

function onCreate()
    makeLuaSprite('sky', path..'nightsky', -418, -1200)
    scaleObject('sky', 1.2, 1.2)
    addLuaSprite('sky', false)

    makeLuaSprite('bg', path..'bg', -410, -1180)
    scaleObject('bg', 1.2, 1.2)
    addLuaSprite('bg', false)

    makeLuaSprite('bg2', path..'bg2', -375, -1200)
    scaleObject('bg2', 1.2, 1.2)
    addLuaSprite('bg2', false)

    makeLuaSprite('fg', path..'fg', -400, 820)
    scaleObject('fg', 1.2, 1.2)
    addLuaSprite('fg', true)

    makeLuaSprite('lighting', path..'lighting', -70, -400)
    scaleObject('lighting', 1.2, 1.2)
    setBlendMode('lighting', 'add')
    addLuaSprite('lighting', true)
end

function onCreatePost()
    setProperty('gf.visible', false)
end