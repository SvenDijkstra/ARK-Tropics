#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;; UPLOADED TO GIT after i found this link
;;;; https://guidedhacking.com/threads/ahk-ark-hacks-auto-attack-auto-fish.18246/  ;;;;
;;;; someone took my crappy script and used it as a guide =)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Global variables & toggles  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

i = 1
toggle_run := 0
toggle_walk := 0
toggle_attack := 0
toggle_e := 0
toggle_c := 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;        READ ME STRINGS       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

title := ".:ARK TROPICS:."

welcomeText = 
(
Welcome to Ark Tropics script.
This script contains the following functions.


	.......ALL FUNCTIONS.......
	-RUN		F1
	-WALK		F2
	-CLICK		F3
	-E		F4
	-C		F5
	-FISH ON		F6
	-FISH OFF 	F7
	-READ ME	F8
	-EXIT ARK Tropics	F9
		
Press Yes for instructions.
Press No to continue using ARK Tropics.

)

instructions = 
(
AUTO RUN
	Press F1 to Auto run.
	Press (shift) F1 to stop running.

AUTO WALK
	Press F2 to Auto walk.
	Press F2 again to stop walking.

AUTO CLICK
	Press F3 to Auto click/attack.
	Press F3 again to stop clicking.

AUTO E
	Press F4 to Auto press E.
	Press F4 again to stop pressing.

AUTO C
	Press F5 to Auto press C.
	Press F5 again to stop pressing.

AUTO FISH
	Press F6 to Auto fish.
	Have your rod casted and let the script run.
	
	Press F7 to stop the script.
	The Auto fisher will automatically cast the rod again.
	
READ ME
	Press F8 to see the manual
	
EXIT
	Press F9 to close ARK Tropics

....................AUTO FISHING TROUBLESHOOTING....................
If the auto fisher does not work, make sure that your resolution
of the screen and the game are set on 1920x1080 and video settings 
of ARK are on WindowedFullscreen and all other settings on default.	
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;WELCOME MSG & READ ME;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

manual:
if (i = 1) {
MsgBox, 4, %title% , %welcomeText%
	IfMsgBox Yes
    MsgBox, 0 , READ ME, %instructions%
else
	i = 0
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;       Read the manual        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

F8:: 
	i = 1
	if (i = 1)
	{
		MsgBox, 4, %title%, %welcomeText%
			IfMsgBox Yes
				MsgBox, 0 , READ ME, %instructions%
			else
			i = 0
	}
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;        Autorun macro         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Press F1 to toggle on/off   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

arkAutoRun:
	IfWinNotActive ARK: Survival Evolved
		{
		SendInput {Shift up}
		SendInput {w up}
		SetTimer, arkAutoRun, off
		toggle_run = 0
		}
	return
  
F1::
	IfWinNotActive ARK: Survival Evolved
		return
	if toggle_run = 0
		{
		SendInput {Shift down}
		SendInput {w down}
		SetTimer, arkAutoRun, 200
		toggle_run = 1
		ToolTip, AUTO RUN, 10, 50, 3
		}
	else
		{
		toggle_run = 0
		SendInput {Shift up}
		SendInput {w up}
		SetTimer, arkAutoRun, off
		Tooltip, , , , 3
		}
	return
	
+F1::
	toggle_run = 0
		SendInput {Shift up}
		SendInput {w up}
		SetTimer, arkAutoRun, off
		Tooltip, , , , 3
	return
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;        Autowalk macro        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Press F2 to toggle on/off   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

arkAutoWalk:
	IfWinNotActive ARK: Survival Evolved
		{
		SendInput {w up}
		SetTimer, arkAutoWalk, off
		toggle_walk = 0\
		}
	return
  
F2::
	IfWinNotActive ARK: Survival Evolved
		return
	if toggle_walk = 0
		{
		SendInput {w down}
		SetTimer, arkAutoWalk, 200
		toggle_walk = 1
		ToolTip, AUTO WALK, 10, 50, 3
		}
	else
		{
		toggle_walk = 0
		SendInput {w up}
		SetTimer, arkAutoWalk, off
		Tooltip, , , , 3
		}
	return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;      Autoattack macro        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Press F3 to toggle on/off   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

arkAutoAttack:
	IfWinActive ARK: Survival Evolved
		{
		SendEvent {Click}
		}
	else
		{
		SetTimer, arkAutoAttack, off
		}
	return

F3::
	if toggle_attack = 0
		{
		toggle_attack = 1
		SetTimer, arkAutoAttack, 100
		ToolTip, AUTO ATTACK, 10, 10, 1
		}
	else
		{
		toggle_attack = 0
		SetTimer, arkAutoAttack, off
		Tooltip, , , , 1
		}
	return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;         Auto E macro         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Press F4 to toggle on/off   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

arkAutoE:
	IfWinActive ARK: Survival Evolved
		{
		Send, e
		}
	else
		{
		SetTimer, arkAutoE, off
		}
	return

F4::
	if toggle_e = 0
		{
		toggle_e = 1
		SetTimer, arkAutoE, 100
		ToolTip, AUTO E, 10, 30, 2
		}
	else
		{
		toggle_e = 0
		SetTimer, arkAutoE, off
		Tooltip, , , , 2
		}
	return
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;         Auto C macro         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Press F5 to toggle on/off   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

arkAutoC:
	IfWinActive ARK: Survival Evolved
		{
		Send, c
		}
	else
		{
		SetTimer, arkAutoC, off
		}
	return

F5::
	if toggle_c = 0
		{
		toggle_c = 1
		SetTimer, arkAutoC, 100
		ToolTip, AUTO C, 10, 30, 2
		}
	else
		{
		toggle_c = 0
		SetTimer, arkAutoC, off
		Tooltip, , , , 2
		}
	return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;      Auto Fisher macro       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     Press F6 to turn on      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;      Press F7 to stop        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

F7::
	i := 1
	ToolTip, STOPPED, 10, 10, 1
	SetTimer, RemoveToolTip, -5000
	return

F6::
	i := 0
	color = 0xFFFFFF
	speed = 150
	ToolTip, AUTO FISHING Started.`nwaiting for fish... , 10, 10, 1

	while ( %i% = 0 ) 
		{
;;Auto Recast Rod
		PixelSearch, RecastPx, RecastPy, 0, 0, A_ScreenWidth/4, A_ScreenHeight/4, 0x7FFD03, 3, Fast ;
			if (ErrorLevel = 0)
				{
				ToolTip, Casting in 3, 10, 10, 1
				Sleep, 250
				ToolTip, Casting in 3., 10, 10, 1
				Sleep, 250
				ToolTip, CASTING in 3.., 10, 10, 1
				Sleep, 250
				ToolTip, Casting in 3..., 10, 10, 1
				Sleep, 250
				ToolTip, Casting in 2, 10, 10, 1
				Sleep, 250
				ToolTip, Casting in 2., 10, 10, 1
				Sleep, 250
				ToolTip, Casting in 2.., 10, 10, 1
				Sleep, 250
				ToolTip, RCastingin 2..., 10, 10, 1
				Sleep, 250
				ToolTip, Casting in 1, 10, 10, 1
				Sleep, 250
				ToolTip, Casting in 1., 10, 10, 1
				Sleep, 250
				ToolTip, Casting in 1.., 10, 10, 1
				Sleep, 250
				ToolTip, Casting in 1..., 10, 10, 1
				Sleep, 250
				ToolTip, NOT CASTING ANYMORE!, 10, 10, 1
				Sleep, 250
				;;MouseClick, left
				Sleep, 1000
				ToolTip, Waiting for fish to take the bait... , 10, 10, 1
				}
    
;;A
		PixelSearch Px, Py, 1162, 970, 1162, 970, color, 3, Fast
			if (ErrorLevel = 0)
				{	
				;;WinActivate, ARK: Survival Evolved
				Send, a
				ToolTip, found the letter A... , 10, 10, 1
				Sleep, speed
				}

;;z
		PixelSearch Px, Py, 1158, 973, 1158, 973, color, 3, Fast
			if (ErrorLevel = 0)
				{	
				;;WinActivate, ARK: Survival Evolved
				Send, z
				ToolTip, found the letter Z... , 10, 10, 1
				Sleep, speed
				}

;;q
		PixelSearch Px, Py, 1181, 1016, 1181, 1016, color, 3, Fast
			if (ErrorLevel = 0)
				{	
				;;WinActivate, ARK: Survival Evolved
				Send, q
				ToolTip, found the letter Q... , 10, 10, 1
				Sleep, speed
				}

;;w
		PixelSearch Px, Py, 1113, 868, 1113, 868, color, 3, Fast
			if (ErrorLevel = 0)
				{	
				;;WinActivate, ARK: Survival Evolved
				Send, w
				ToolTip, found the letter W... , 10, 10, 1
				Sleep, speed
				}
		
;;x
		PixelSearch Px, Py, 1167, 972, 1167, 972, color, 3, Fast
			if (ErrorLevel = 0)
				{	
				;;WinActivate, ARK: Survival Evolved
				Send, x
				ToolTip, found the letter X... , 10, 10, 1
				Sleep, speed
				}

;;d
		PixelSearch Px, Py, 1192, 906, 1192, 906, color, 3, Fast
			if (ErrorLevel = 0)
			{	
			;;WinActivate, ARK: Survival Evolved
			Send, d
			ToolTip, found the letter D... , 10, 10, 1
			Sleep, speed
			}


;;BEGIN PROCESS OF ELIMINATION TO FIND E, S, C
		
;;E
		PixelSearch Px, Py, 1186, 998, 1186, 998, color, 3, Fast 

		PixelSearch PxA, PyA, 1162, 970, 1162, 970, color, 3, Fast	;;a
		PixelSearch PxZ, PyZ, 1158, 973, 1158, 973, color, 3, Fast	;;z
		PixelSearch PxW, PyW, 1113, 868, 1113, 868, color, 3, Fast	;;w
		PixelSearch PxX, PyX, 1167, 972, 1167, 972, color, 3, Fast	;;x
		PixelSearch PxD, PyD, 1192, 906, 1192, 906, color, 3, Fast	;;d

			if ( Px && Py ) && (!PxA && !PyA) && (!PxZ && !PyZ) && (!PxW && !PyW) && (!PxX && !PyX) && (!PxD && !PyD) 
				{
				Send, e
				ToolTip, found the letter E... , 10, 10, 1
				Sleep, speed
				}

;;S
		PixelSearch Px, Py, 1161, 917, 1161, 917, color, 3, Fast 

		PixelSearch PxZ, PyZ, 1158, 973, 1158, 973, color, 3, Fast	;;z
		PixelSearch PxW, PyW, 1113, 868, 1113, 868, color, 3, Fast	;;w
		PixelSearch PxX, PyX, 1167, 972, 1167, 972, color, 3, Fast	;;x


			if ( Px && Py ) && (!PxZ && !PyZ) && (!PxW && !PyW) && (!PxX && !PyX) 
				{
				Send, s
				ToolTip, found the letter S... , 10, 10, 1
				Sleep, speed
				}
;;C
		PixelSearch Px, Py, 1135, 918, 1135, 918, color, 3, Fast

		PixelSearch PxQ, PyQ, 1181, 1016, 1181, 1016, color, 3, Fast ;;q
		PixelSearch PxD, PyD, 1192, 906, 1192, 906, color, 3, Fast	;;d

			if ( Px && Py )  && (!PxQ && !PyQ) && (!PxD && !PyD) 
				{
				Send, c
				ToolTip, found the letter C... , 10, 10, 1
				Sleep, speed
				}

		}		
	return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;         Exit the app         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

F9::
	ExitApp
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

RemoveToolTip:
	ToolTip
return
