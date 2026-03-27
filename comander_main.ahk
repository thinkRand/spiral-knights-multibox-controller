SendMode, Event
SetBatchLines, -1
ListLines, Off

mainWinId := 0
arrayWin := []
arrayWinCount := 0
WinGet, win, List, ahk_class LWJGL
temp := WinExist("A")
loop %win% {
    w := win%A_Index%
    if (w = temp){
        mainWinId := temp
        continue
    }

    arrayWin.push(w)
}

if (mainWinId = 0){
    showDebugMsg("Main no definida - controlando a todas las unidades") 
}else{
    showDebugMsg("Main definida - controlando solo alts")
}
arrayWinCount := arrayWin.Count()

comandar := false
togglea := true
togglew := true
toggles := true
toggled := true
Hotkey, tab, comandar
return


comandar:
    comandar:=!comandar
    SoundBeep,,300
return

$a::
    if (comandar){

        if (togglea){
            setTimer, ordenA, 15
            togglea := false
        }

    }else{

        SendInput, {a down}
    
    }
return


$a Up::
    if (comandar){
        if(!togglea){
            togglea := true
            setTimer, ordenA, Off
        }
    }
    SendInput, {a up}
return


$w::
    if (comandar){

        if (togglew){
            setTimer, ordenW, 15
            togglew := false
        }

    }else{

        SendInput, {w down}
    
    }
return


$w Up::
    if (comandar){
        if(!togglew){
            togglew := true
            setTimer, ordenW, Off
        }
    }
    SendInput, {w up}
return


$s::
    if (comandar){

        if (toggles){
            setTimer, ordenS, 15
            toggleS := false
        }

    }else{

        SendInput, {s down}
    
    }
return


$s Up::
    if (comandar){
        if(!toggles){
            toggles := true
            setTimer, ordenS, Off
        }
    }
    SendInput, {s up}
return

$d::
    if (comandar){

        if (toggled){
            setTimer, ordenD, 15
            toggled := false
        }

    }else{

        SendInput, {d down}
    
    }
return


$d Up::
    if (comandar){
        if(!toggled){
            toggled := true
            setTimer, ordenD, Off
        }
    }
    SendInput, {d up}
return



^f12:: ;Control f12 carga todas las ventanas en este momento y define la main
    mainWinId := 0
    arrayWin := []
    arrayWinCount := 0
    WinGet, win, List, ahk_class LWJGL
    temp := WinExist("A")
    loop %win% {
        w := win%A_Index%
        if (w = temp){
            mainWinId := temp
            continue
        }

        arrayWin.push(w)
    }

    if (mainWinId = 0){
        showDebugMsg("Main no definida") 
    }else{
        showDebugMsg("Main definida")
    }
    arrayWinCount := arrayWin.Count()
return





ordenA(){

    Global arrayWinCount, arrayWin 
    
    Loop, %arrayWinCount% 
    {
        w := arrayWin[A_Index]
        ControlSend, ahk_parent, a, % "ahk_id " . arrayWin[A_Index]
    }
    
}


ordenW(){

    Global arrayWinCount, arrayWin
    Loop, %arrayWinCount%
        ControlSend, ahk_parent, w, % "ahk_id " arrayWin[A_Index]

}

ordenS(){

    Global arrayWinCount, arrayWin
    Loop, %arrayWinCount%
        ControlSend, ahk_parent, s, % "ahk_id " arrayWin[A_Index]

}

ordenD(){

    Global arrayWinCount, arrayWin
    Loop, %arrayWinCount%
        ControlSend, ahk_parent, d, % "ahk_id " arrayWin[A_Index]
 
}

showDebugMsg(msg:=""){
    
    Tooltip, % msg
    setTimer, quitarTooltip, -2000
    return

    quitarTooltip:
        Tooltip
    return

}