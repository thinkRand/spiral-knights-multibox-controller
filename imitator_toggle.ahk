;#InstallKeybdHook
#MaxThreadsPerHotkey, 20
SendMode, Event
SetBatchLines, -1
ListLines, Off
Process, Priority, , High

WinGet, win, List, ahk_class LWJGL ; Notepad
return


$a::
	if(togglea:=!togglea){
        
		setTimer, ordenA, 15
		showDebugMsg("ON")

	}else{

		setTimer, ordenA, Off
		showDebugMsg("OFF")
	
	}
return

$w::
	if(togglew:=!togglew){
        
		setTimer, ordenW, 15
		showDebugMsg("ON")

	}else{

		setTimer, ordenW, Off
		showDebugMsg("OFF")
	
	}
return

$s::
	if(toggles:=!toggles){
        
		setTimer, ordenS, 15
		showDebugMsg("ON")

	}else{

		setTimer, ordenS, Off
		showDebugMsg("OFF")
	
	}
return

$d::
	if(toggled:=!toggled){
        
		setTimer, ordenD, 15
		showDebugMsg("ON")

	}else{

		setTimer, ordenD, Off
		showDebugMsg("OFF")
	
	}
return





ordenA(){

	Global win
	Loop, %win%
		ControlSend, ahk_parent, {vk41sc01E}, % "ahk_id " . win%A_Index%

}

ordenW(){

	Global win
	Loop, %win%
		ControlSend, ahk_parent, {w}, % "ahk_id " . win%A_Index%

}

ordenS(){

	Global win
	Loop, %win%
		ControlSend, ahk_parent, {s}, % "ahk_id " . win%A_Index%

}

ordenD(){

	Global win
	Loop, %win%
		ControlSend, ahk_parent, {d}, % "ahk_id " . win%A_Index%

}


showDebugMsg(msg:=""){
	
	Tooltip, % msg
	setTimer, quitarTooltip, -2000
	return

	quitarTooltip:
		Tooltip
	return

}