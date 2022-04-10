function onStartCountdown()
setPropertyFromClass("openfl.Lib", "application.window.title",'Playing: ' .. 'Imminent- ' .. ' against ' .. ' Bendy? ')
end

function onDestroy()
setPropertyFromClass("openfl.Lib", "application.window.title","Friday Night Funkin': Psych Engine")
end

function onGameOver()
setPropertyFromClass("openfl.Lib", "application.window.title",'Down the Inkwell..')
end

function onGameOverConfirm(retry)
setPropertyFromClass("openfl.Lib", "application.window.title",'Playing: ' .. 'Imminent- ' .. ' against ' .. ' Bendy? ')
end