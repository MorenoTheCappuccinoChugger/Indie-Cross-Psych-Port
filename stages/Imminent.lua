function onCreatePost()
    setProperty('scoreTxt.visible', true)
    setProperty('timeBar.color', getColorFromHex('ffffff'))
    setProperty('timeTxt.color', getColorFromHex('ffffff'))
    setProperty('scoreTxt.color', getColorFromHex('ffffff'))

    setTextFont('scoreTxt','Bendy.ttf')
    setTextFont('timeTxt','Bendy.ttf')
    setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -35);
    
end

function onCreate()
	-- background shit
	makeLuaSprite('background', 'Bendy/imminent/BG01', -500, -55);
	setScrollFactor('background', 1, 1);
	scaleObject('background', 0.65, 0.65)

	makeLuaSprite('bendee', 'Bendy/imminent/Boi', -10, 215);
	setScrollFactor('bendee', 1, 1);
	scaleObject('bendee', 0.65, 0.65)

	makeLuaSprite('pillar', 'Bendy/imminent/Pillar', 1015, -80);
	setScrollFactor('pillar', 0.95, 0.95);
	scaleObject('pillar', 0.6, 0.6)
	setObjectOrder('pillar','5')

	makeAnimatedLuaSprite('light', 'Bendy/imminent/Light(Add-Blend)', 100, 0);
	addAnimationByPrefix('light', 'flash', 'fezt instance', 24, false);
	objectPlayAnimation('light', 'flash');
	scaleObject('light', 0.65, 0.65)
	setObjectOrder('light','4')

	makeAnimatedLuaSprite('MusicBox', 'Bendy/imminent/MusicBox', 350, 325);
	addAnimationByPrefix('MusicBox', 'booop', 'Music box thingy instance', 24, false);
	objectPlayAnimation('MusicBox', 'booop');
	scaleObject('MusicBox', 0.65, 0.65)
	setObjectOrder('MusicBox','3')

	addLuaSprite('MusicBox', false);
	addLuaSprite('bendee', true);
	addLuaSprite('pillar', true);
	addLuaSprite('light', true);
	addLuaSprite('background', false);
	
end

function onUpdatePost()
	update_tweens()

	if get_tween_value("introZoom1") then
		triggerEvent("Camera Follow Pos", get_tween_value("introZoom1"), 300)
	end
end
function onStepHit()
	objectPlayAnimation('light', 'flash');

	-------------------- INTRO ZOOMS LOL
	
	if curStep == 117 then
		doTweenZoom('introZoom1', 'camGame', 1.1, '0.1', 'backOut')
		tween_value("BendyIntro", 200, 0, 1, "backOut")
		doTweenAngle('screenTilt', 'camGame', 5, 0.1, 'quadInOut');
	end


	if curStep == 119 then
		doTweenZoom('introZoom1', 'camGame', 1.2, '0.1', 'backOut')
	end

	if curStep == 123 then
		doTweenZoom('introZoom1', 'camGame', 1.3, '0.1', 'backOut')
	end

	if curStep == 127 then
		doTweenZoom('introZoom1', 'camGame', 1.4, '0.1', 'backOut')
	end

	if curStep == 129 then
		doTweenZoom('introZoom1', 'camGame', 1.5, '0.1', 'backOut')
	end

	if curStep == 133 then
		doTweenZoom('introZoom1', 'camGame', 1, '0.5', 'backOut')
	end
	-------------------- INTRO ZOOMS LOL
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('MusicBox', 'booop');
	end
end