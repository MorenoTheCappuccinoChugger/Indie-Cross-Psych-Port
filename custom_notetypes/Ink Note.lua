function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Ink Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/INK_assets');

				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

ink1 = true 
ink2 = false 
ink3 = false 
ink4 = false 
inkLoop = true

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Ink Note' then
		setProperty('health', 0.4);
		playSound('Bendy/inked', 0.5)
		triggerEvent('Play Animation', 'Ouch', 'BF');

		makeLuaSprite('ink4', 'Bendy/Damage04', 0, 0);
		setScrollFactor('ink4', 0, 0);
		scaleObject('ink4', 0.7, 0.7);
		addLuaSprite('ink4', true);
		setObjectCamera('ink4','other')
		setProperty('ink4.visible', false)

		makeLuaSprite('ink3', 'Bendy/Damage03', 0, 0);
		setScrollFactor('ink3', 0, 0);
		scaleObject('ink3', 0.7, 0.7);
		addLuaSprite('ink3', true);
		setObjectCamera('ink3','other')
		setProperty('ink3.visible', false)

		makeLuaSprite('ink3', 'Bendy/Damage03', 0, 0);
		setScrollFactor('ink3', 0, 0);
		scaleObject('ink3', 0.7, 0.7);
		addLuaSprite('ink3', true);
		setObjectCamera('ink3','other')
		setProperty('ink3.visible', false)

		makeLuaSprite('ink2', 'Bendy/Damage02', 0, 0);
		setScrollFactor('ink2', 0, 0);
		scaleObject('ink2', 0.7, 0.7);
		addLuaSprite('ink2', true);
		setObjectCamera('ink2','other')
		setProperty('ink2.visible', false)
		

		makeLuaSprite('ink1', 'Bendy/Damage01', 0, 0);
		setScrollFactor('ink1', 0, 0);
		scaleObject('ink1', 0.7, 0.7);
		addLuaSprite('ink1', true);
		setObjectCamera('ink1','other')
		setProperty('ink1.visible', false)

		if ink1 == true then
			ink4 = false
			setProperty('ink1.visible', true)
			setProperty('ink2.visible', false)
			setProperty('ink3.visible', false)
			setProperty('ink4.visible', false)
			runTimer('toggleInk2', 0.1, 0)
		end

		if ink2 == true then
			ink1 = false
			setProperty('ink1.visible', false)
			setProperty('ink2.visible', true)
			runTimer('toggleInk3', 0.1, 0)
		end

		if ink3 == true then
			ink2 = false
			setProperty('ink1.visible', false)
			setProperty('ink2.visible', false)
			setProperty('ink3.visible', true)
			runTimer('toggleInk4', 0.1, 0)
		end

		if ink4 == true then
			ink3 = false
			setProperty('ink1.visible', false)
			setProperty('ink2.visible', false)
			setProperty('ink3.visible', false)
			setProperty('ink4.visible', true)
			runTimer('toggleInk1', 0.5, 0)
		end

		runTimer('hide', 5, 0)
	end
end

function onTimerCompleted(tag)
	if tag == 'hide' then
		doTweenAlpha('inkHide1', 'ink1', 0, 2, 'linear')
		doTweenAlpha('inkHide2', 'ink2', 0, 2, 'linear')
		doTweenAlpha('inkHide3', 'ink3', 0, 2, 'linear')
		doTweenAlpha('inkHide4', 'ink4', 0, 2, 'linear')
	end



	if tag == 'toggleInk2' then
		ink2 = true
	end
	if tag == 'toggleInk3' then
		ink3 = true
	end

	if tag == 'toggleInk4' then
		ink4 = true
	end

	if tag == 'toggleInk1' then
		ink1 = true
	end

	
end


function onTweenCompleted(tag)
	if tag == 'inkHide1' then
		setProperty('ink1.visible', false)
	end

	if tag == 'inkHide2' then
		setProperty('ink2.visible', false)
	end

	if tag == 'inkHide3' then
		setProperty('ink3.visible', false)
	end

	if tag == 'inkHide4' then
		setProperty('ink4.visible', false)
	end
end