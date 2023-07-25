local path = 'backgrounds/1/'

function onCreate()
    makeAnimatedLuaSprite('river', path..'river', 100, 0)
    addAnimationByPrefix('river', 'idle', 'idle', 24)
    playAnim('river', 'idle', true)
    scaleObject('river', 0.9, 0.9)
    addLuaSprite('river', false)

    makeLuaSprite('fence', path..'fence', 0, 100)
    scaleObject('fence', 0.8, 0.8)
    addLuaSprite('fence', false)

    makeLuaSprite('fencefg', path..'fence fg', 60, -30)
    scaleObject('fencefg', 1.28, 1.28)
    addLuaSprite('fencefg', true)
    setProperty('fencefg.alpha', 0)
    
    makeAnimatedLuaSprite('riverfg', path..'river_overlay', 200, 100)
    addAnimationByPrefix('riverfg', 'idle', 'river_overlay idle', 2)
    playAnim('riverfg', 'idle', true)
    addLuaSprite('riverfg', true)
    setProperty('riverfg.alpha', 0)

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
    if curBeat == 96 then
        doTweenAlpha('hudgone', 'camHUD', 0, 5, 'linear')
        doTweenZoom('zoominyeah', 'camGame', 2, 5, 'linear')
    elseif curBeat == 98 then
        doTweenAlpha('bye aqua', 'boyfriend', 0, 5, 'linear')
        doTweenAlpha('fencea', 'fence', 0, 5, 'linear')
        doTweenAlpha('riveraaa', 'river', 0, 5, 'linear')
    elseif curBeat == 104 then
        secondStage()
    elseif curBeat == 124 then
        doTweenAlpha('hudisback', 'camHUD', 1, 5, 'linear')
        
    end
end

function secondStage()
    triggerEvent('Change Character', '0', 'aqua2')
    doTweenAlpha('fencefga', 'fencefg', 1, 7, 'linear')
    doTweenAlpha('riverfgf', 'riverfg', 0.9, 7, 'linear')
    doTweenAlpha('aquaappear', 'boyfriend', 1, 7, 'linear')
    doTweenZoom('zoomoout', 'camGame', 1.1, 7, 'linear')
end
