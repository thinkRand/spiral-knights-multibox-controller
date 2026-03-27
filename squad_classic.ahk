#InstallKeybdHook
SetBatchLines, -1
SendMode, Input
Process, Priority, , High
ListLines, Off

duracionDepresion := 50 ;no cambiar sin avisarle al programador xd
tiempoEntreEntradas := 7 ;puedes cambiar este valor para adaptar el movimiento, entre -10 y 10 seria razonable

class winPersonaje{

	__New(winId){
		this.duracionDepresion := 50
		this.winId := winId
		this.A := ObjBindMethod(this, "controlSendA")
		this.D := ObjBindMethod(this, "controlSendD")
		this.W := ObjBindMethod(this, "controlSendW")
		this.S := ObjBindMethod(this, "controlSendS")
	}


	sendA(){

		controlSendA := this.A
		SetTimer, % controlSendA, -0
	
	}

	sendW(){
		
		controlSendW := this.W
		SetTimer, % controlSendW, -0

	}
	
	sendS(){
		
		controlSendS := this.S
		SetTimer, % controlSendS, -0

	}

	sendD(){
		
		controlSendD := this.D
		SetTimer, % controlSendD, -0

	}



	controlSendA(){

		ControlSend, ahk_parent, {a down}, % "ahk_id " . this.winId
		Sleep, % this.tiempoEntreEntradas
		ControlSend, ahk_parent, {a up}, % "ahk_id " . this.winId
	
	}

	controlSendW(){

		ControlSend, ahk_parent, {w down}, % "ahk_id " . this.winId
		Sleep, % this.tiempoEntreEntradas
		ControlSend, ahk_parent, {w up}, % "ahk_id " . this.winId
	
	}

	controlSendS(){
	
		ControlSend, ahk_parent, {s down}, % "ahk_id " . this.winId
		Sleep, % this.tiempoEntreEntradas
		ControlSend, ahk_parent, {s up}, % "ahk_id " . this.winId
	
	}

	controlSendD(){
	
		ControlSend, ahk_parent, {d down}, % "ahk_id " . this.winId
		Sleep, % this.tiempoEntreEntradas
		ControlSend, ahk_parent, {d up}, % "ahk_id " . this.winId
	
	}
}


WinGet, win, List, ahk_class LWJGL ;Notepad 
personaje :=[]
loop %win%{
	obj := new winPersonaje(win%A_Index%)
	personaje.push(obj)
}
pCount := personaje.Count()
tiempoDeAguardo := duracionDepresion + tiempoEntreEntradas

setTimer, escuchaA, 50
setTimer, escuchaD, 50
setTimer, escuchaW, 50
setTimer, escuchaS, 50
return

a::return
d::return
w::return
s::return


escuchaA(){

	Global personaje, pCount, tiempoDeAguardo
	
	While GetKeyState("a","P"){
	    Loop, %pCount% 
	    	personaje[A_Index].sendA()
		
		Sleep, tiempoDeAguardo
	}

}

escuchaD(){

	Global personaje, pCount, tiempoDeAguardo
	
	While GetKeyState("d","P"){
	    Loop, %pCount% 
	    	personaje[A_Index].sendD()
	    
		Sleep, tiempoDeAguardo
	}

}

escuchaW(){

	Global personaje, pCount, tiempoDeAguardo
	
	While GetKeyState("w","P"){
	    Loop, %pCount% 
	    	personaje[A_Index].sendW()
	    
		Sleep, tiempoDeAguardo
	}

}

escuchaS(){

	Global personaje, pCount, tiempoDeAguardo
	
	While GetKeyState("s","P"){
	    Loop, %pCount% 
	    	personaje[A_Index].sendS()
	    
		Sleep, tiempoDeAguardo
	}

}
