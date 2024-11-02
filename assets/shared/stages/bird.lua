local xx = 1000;
local yy = 1000;
local xx2 = 1000;
local yy2 = 1000;
local ofs = 50;
local followchars = true;

function onCreate()
	makeLuaSprite('bg', 'birds/Bag_ground', 0, 0)
	scaleObject('bg', 2.5, 2.5)
    addLuaSprite('bg', false)
    setProperty('bg.alpha', 0)

    makeLuaSprite('title', 'birds/krimbon_wakey', 0, 0)
	scaleObject('title', 1, 1)
    addLuaSprite('title', true)
    setObjectCamera('title', 'other')
    screenCenter('title', 'xy')

    makeLuaSprite('nest', 'birds/nest', 0, 0)
	scaleObject('nest', 2.5, 2.5)
    addLuaSprite('nest', false)
    setProperty('nest.alpha', 0)

    setProperty('camHUD.alpha', 0)
    makeLuaSprite('xd', nil, 900, 1100)
    addLuaSprite('xd', false)
    setProperty('xd.visible', false)
end

function onSongStart()
    doTweenZoom('camGame', 'camGame', 0.5, 20, 'sineInOut')
    doTweenAlpha('xddd', 'nest', 1, 10, 'sineInOut')
    doTweenAlpha('xdddddd', 'title', 0, 3, 'sineInOut')
    doTweenAngle('xddddddddddd', 'xd', -0.3, 0.4)
    setProperty('timeBar.color', getColorFromHex("f50502"))
    setProperty('scoreTxt.color', getColorFromHex("f50502"))
    setProperty('timeTxt.color', getColorFromHex("f50502"))
end

function onBeatHit()
    if curBeat == 44 then
        doTweenX('xd', 'xd', 2700, 7, 'sineInOut')
        doTweenY('xdd', 'xd', 900, 7, 'sineInOut')
        doTweenAlpha('xddd', 'bg', 1, 6, 'sineInOut')
    end

    if curBeat == 60 then
        doTweenAlpha('xdddd', 'camHUD', 1, 2, 'sineInOut')
    end

    if curBeat == 192 then
        setProperty('bg.alpha', 1)
        setProperty('nest.alpha', 0)

        xx = 2400;
        yy = 950;
        xx2 = 3000;
        yy2 = 950;
    end

    if curBeat >= 192 and curBeat < 320 or curBeat >= 712 and curBeat < 775 or curBeat >= 777 and curBeat < 840 or curBeat >= 984 and curBeat < 1112 then
        if curBeat % 1 == 0 then
            setProperty('xd.angle', -1)
            triggerEvent('Add Camera Zoom', '0.04', '0.04');
            doTweenAngle('xddddddddddd', 'xd', -0.3, 0.4)
        end
    end

    if curBeat >= 448 and curBeat < 575 then
        if curBeat % 1 == 0 then
            setProperty('xd.angle', -0.65)
            triggerEvent('Add Camera Zoom', '0.03', '0.03');
            doTweenAngle('xddddddddddd', 'xd', -0.3, 0.4)
        end
    end

    if curBeat == 584 then
        xx = 2700;
        yy = 950;
        xx2 = 2700;
        yy2 = 950;
    end

    if curBeat >= 648 and curBeat < 712 then
        if curBeat % 2 == 0 then
            setProperty('xd.angle', -1)
            triggerEvent('Add Camera Zoom', '0.03', '0.03');
            doTweenAngle('xddddddddddd', 'xd', -0.3, 0.4)
        end
    end

    if curBeat == 712 then
        setProperty('bg.alpha', 1)
        setProperty('dad.alpha', 1)
        setProperty('boyfriend.alpha', 1)

        xx = 2400;
        yy = 950;
        xx2 = 3000;
        yy2 = 950;
    end

    if curBeat == 775 then
        doTweenAlpha('xd1', 'bg', 0, 0.4, 'sineInOut')
        doTweenAlpha('xd2', 'dad', 0, 0.4, 'sineInOut')
        doTweenAlpha('xd3', 'boyfriend', 0, 0.4, 'sineInOut')
    end

    if curBeat == 777 then
        doTweenAlpha('xd1', 'bg', 1, 0.4, 'sineInOut')
        doTweenAlpha('xd2', 'dad', 1, 0.4, 'sineInOut')
        doTweenAlpha('xd3', 'boyfriend', 1, 0.4, 'sineInOut')
    end

    if curBeat == 840 then
        doTweenAlpha('xd1', 'bg', 0, 1.4, 'sineInOut')
        doTweenAlpha('xd2', 'dad', 0, 1.4, 'sineInOut')
        doTweenAlpha('xd3', 'boyfriend', 0, 1.4, 'sineInOut')
        doTweenAlpha('xd4', 'camHUD', 0, 3, 'sineInOut')
    end

    if curBeat == 920 then
        setProperty('dad.alpha', 1)
        setProperty('camHUD.alpha', 1)
        setProperty('bg.alpha', 1)
        setProperty('boyfriend.alpha', 1)
    end

    if curBeat == 1112 then
        xx = 2600;
        yy = 950;
        xx2 = 2600;
        yy2 = 950;
    end

    if curBeat == 1116 then
        doTweenAlpha('xd1', 'bg', 0, 1, 'sineInOut')
        doTweenAlpha('xd2', 'dad', 0, 1, 'sineInOut')
        doTweenAlpha('xd3', 'boyfriend', 0, 1, 'sineInOut')
        doTweenAlpha('xd4', 'camHUD', 0, 2, 'sineInOut')
    end
end

function onMiss()
    if curBeat >= 584 and curBeat < 712 then
        setProperty('boyfriend.alpha', 0.9)
        doTweenAlpha('xd3', 'boyfriend', 0, 0.6, 'sineInOut')
    end
end

function goodNoteHit()
    if curBeat >= 584 and curBeat < 712 then
        setProperty('boyfriend.alpha', 0.9)
        doTweenAlpha('xd3', 'boyfriend', 0, 0.6, 'sineInOut')
    end
end

function opponentNoteHit()
    if curBeat >= 584 and curBeat < 712 then
        setProperty('dad.alpha', 0.9)
        doTweenAlpha('xd2', 'dad', 0, 0.6, 'sineInOut')
    end
end

function onStepHit()
    if curStep == 2302 then
        doTweenAlpha('xd1', 'bg', 0, 0.4, 'sineInOut')
        doTweenAlpha('xd2', 'dad', 0, 0.4, 'sineInOut')
        doTweenAlpha('xd3', 'boyfriend', 0, 0.4, 'sineInOut')
    end
end

function onUpdate()
    if curBeat >= 712 and curBeat < 730 then
        cancelTween('xd2')
        cancelTween('xd3')
        setProperty('bg.alpha', 1)
        setProperty('dad.alpha', 1)
        setProperty('boyfriend.alpha', 1)
    end

    setProperty('gf.alpha', 0)
    setProperty('healthBar.alpha', 0)
    setProperty('cameraSpeed', 0.5)

    chromatical = getProperty('xd.angle')
    runHaxeCode([[
        chrom.setFloat('amount',]] .. chromatical .. [[);
    ]])

    if curBeat < 70 then
        xx = getProperty('xd.x')
        xx2 = getProperty('xd.x')
        yy = getProperty('xd.y')
        yy2 = getProperty('xd.y')
    end
    if followchars == true then
        if mustHitSection == false then
           
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end
