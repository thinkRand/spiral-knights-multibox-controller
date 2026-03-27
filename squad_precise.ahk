#InstallKeybdHook
SetBatchLines, -1
SendMode, Input
Process, Priority, , High
ListLines, Off

duracionDepresion := 50 ;no cambiar sin avisarle al programador xd
tiempoEntreEntradas := 1 ;puedes cambiar este valor para adaptar el movimiento, entre -10 y 10 seria razonable

class winPersonaje{

	__New(winId){
		this.duracionDepresion := 50
		this.winId := winId
		this.Adown := ObjBindMethod(this, "controlSendDown", "a")
		this.Aup := ObjBindMethod(this, "controlSendUp", "a")
		this.Ddown := ObjBindMethod(this, "controlSendDown", "d")
		this.Dup := ObjBindMethod(this, "controlSendUp", "d")
		this.Wdown := ObjBindMethod(this, "controlSendDown", "w")
		this.Wup := ObjBindMethod(this, "controlSendUp", "w")
		this.Sdown := ObjBindMethod(this, "controlSendDown", "s")
		this.Sup := ObjBindMethod(this, "controlSendUp", "s")
	}


	sendA(){

		controlSendADown := this.Adown
		controlSendAUp := this.Aup
		SetTimer, % controlSendADown, -0
		SetTimer, % controlSendAUp, % -this.duracionDepresion
	}

	sendD(){
		
		controlSendDDown := this.Ddown
		controlSendDUp := this.Dup
		SetTimer, % controlSendDDown, -0
		SetTimer, % controlSendDUp, % -this.duracionDepresion

	}

	sendW(){
		
		controlSendWDown := this.Wdown
		controlSendWUp := this.Wup
		SetTimer, % controlSendWDown, -0
		SetTimer, % controlSendWUp, % -this.duracionDepresion

	}

	sendS(){
		
		controlSendSDown := this.Sdown
		controlSendSUp := this.Sup
		SetTimer, % controlSendSDown, -0
		SetTimer, % controlSendSUp, % -this.duracionDepresion

	}

	
	controlSendDown(tecla:=0){
		ControlSend, ahk_parent, % "{" . tecla . " down}", % "ahk_id " . this.winId
	}

	controlSendUp(tecla:=0){
		ControlSend, ahk_parent, % "{" . tecla . " up}", % "ahk_id " . this.winId
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
