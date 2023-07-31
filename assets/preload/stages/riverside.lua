local path = 'backgrounds/1/'
startcd = false

function onCreate()
    makeAnimatedLuaSprite('river', path..'river', 100, 0)
    addAnimationByPrefix('river', 'idle', 'idle', 12)
    playAnim('river', 'idle', true)
    scaleObject('river', 0.9, 0.9)
    addLuaSprite('river', false)
    setProperty('river.alpha', 0.2)

    makeLuaSprite('fence', path..'fence', 0, 100)
    scaleObject('fence', 0.8, 0.8)
    addLuaSprite('fence', false)
    setProperty('fence.alpha', 0)

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
    setProperty('boyfriend.alpha', 0)
    setProperty('gf.visible', false)
    setProperty('dad.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('camHUD.alpha', 0)

    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'x', -500)
    end

    setProperty('defaultCamZoom', 1.7)
    --setProperty('showComboNum', false)
    --setProperty('showRating', false)
end

function onStartCountdown()
    if not startcd then
        setProperty('skipCountdown', true)
    end
end

function onBeatHit()
    if curBeat == 4 then
        firstStage()
    elseif curBeat == 96 then
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
    elseif curBeat == 192 then
        doTweenAlpha('hudgoneforever', 'camHUD', 0, 3, 'linear')
    end
end

function onStepHit()
    if curStep == 118 then
        doTweenAlpha('hudappears', 'camHUD', 1, 5, 'linear')
    elseif curStep == 831 and isStoryMode then
        playAnim('boyfriend', 'shocked')
    end
end

function firstStage()
    doTweenAlpha('riverfade', 'river', 1, 8, 'linear')
    doTweenAlpha('fencefade', 'fence', 1, 10, 'linear')
    doTweenAlpha('aquahiii', 'boyfriend', 1, 10, 'linear')
    doTweenZoom('zoomoutkinda', 'camGame', 1, 9, 'linear')
end

function secondStage()
    triggerEvent('Change Character', '0', 'aqua2')
    doTweenAlpha('fencefga', 'fencefg', 1, 9, 'linear')
    doTweenAlpha('riverfgf', 'riverfg', 0.9, 9, 'linear')
    doTweenAlpha('aquaappear', 'boyfriend', 1, 8, 'linear')
    doTweenZoom('zoomoutbrah', 'camGame', 1.1, 9, 'linear')
end
