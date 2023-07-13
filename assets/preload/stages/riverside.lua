function onCreate()
    makeAnimatedLuaSprite('river', 'backgrounds/1/river', 100, 0)
    addAnimationByPrefix('river', 'idle', 'idle', 24)
    playAnim('river', 'idle', true)
    scaleObject('river', 0.9, 0.9)
    addLuaSprite('river', false)

    makeLuaSprite('fence', 'backgrounds/1/fence', 0, 100)
    scaleObject('fence', 0.8, 0.8)
    addLuaSprite('fence', false)
end

function onCreatePost()
    setProperty('gf.visible', false)
    setProperty('dad.visible', false)
    setProperty('iconP2.visible', false)

    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'x', -500)
    end
end