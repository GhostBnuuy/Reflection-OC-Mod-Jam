function onCreate()
    makeAnimatedLuaSprite('river', 'backgrounds/1/river', 100, 0)
    addAnimationByPrefix('river', 'idle', 'idle', 24)
    playAnim('river', 'idle', true)
    scaleObject('river', 0.9, 0.9)
    addLuaSprite('river', false)

    makeLuaSprite('fence', 'backgrounds/1/fence', 0, 100)
    scaleObject('fence', 0.8, 0.8)
    addLuaSprite('fence', false)

    makeLuaSprite('fencefg', 'backgrounds/1/fence fg', 60, -30)
    scaleObject('fencefg', 1.28, 1.28)
    addLuaSprite('fencefg', true)
    setProperty('fencefg.visible', false)
    
    makeAnimatedLuaSprite('riverfg', 'backgrounds/1/river_overlay', 0, 0)
    addAnimationByPrefix('riverfg', 'idle', 'river_overlay idle', 2)
    playAnim('riverfg', 'idle', true)
    addLuaSprite('riverfg', true)
    setObjectCamera('riverfg', 'camHUD')
    setProperty('riverfg.alpha', 0.9)
    setProperty('riverfg.visible', false)

end

function onCreatePost()
    setProperty('gf.visible', false)
    setProperty('dad.visible', false)
    setProperty('iconP2.visible', false)

    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'x', -500)
    end
end

function onBeatHit()
    if curBeat == 2 then
        secondStage()
    end
end

function secondStage()
    setProperty('fence.visible', false)
    setProperty('river.visible', false)
    setProperty('fencefg.visible', true)
    setProperty('riverfg.visible', true)
    setProperty('defaultCamZoom', 1)
end
