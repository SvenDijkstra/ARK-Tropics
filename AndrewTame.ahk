#SingleInstance,Force			;
#NoEnv							; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn							; Enable warnings to assist with detecting common errors.
SendMode Input					; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir, %A_ScriptDir%	; Ensures a consistent starting directory.

 
;;ARK TURQOISE COLOR 
;;0x795E00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
toggle_tame := 0
global tame_key := "none"

global LEFT = 900
global RIGHT = 1650
global MIDDLE = 1275
global HOOG = 1000


;F9::
;MsgBox yHealthT=%yHealthT%
;Sleep, 1000
;getHealth()
;producePoop()
;autoFish()
;checkTame()
;tameAndrewsarchus()
;return


F9::
	;IfWinNotActive ARK: Survival Evolved
	;	return
	if toggle_tame = 0
		{
		SetTimer, tameAndrewsarchus, 50
		toggle_tame = 1
		ToolTip, AUTO TAME, 10, 50, 3
		}
	else
		{
		toggle_tame = 0
		SetTimer, tameAndrewsarchus, off
		Tooltip, , , , 3
		}
	return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


tameAndrewsarchus() {
	;IfWinActive ARK: Survival Evolved
	;{	
;;FIND LEFT WHITE
		;MsgBox tame_key=%tame_key%
		PixelSearch, Px, Py, 911, 765, 911, 765, 0XFBFFFF, 10, Fast
		if (ErrorLevel = 0)
		{
			if ( tame_key == "ä" ) {
				return
			}
			if ( tame_key == "d" ) {
				SendInput {d up}
				SendInput {a down}
				ToolTip KEY: A DOWN`nKEY: D UP, %LEFT%, %HOOG%, 3
				tame_key := "a"
			}
			if ( tame_key == "none" ) {
				SendInput {a down}
				ToolTip KEY: A DOWN`nKEY: D UP, %LEFT%, %HOOG%, 3
				tame_key := "a"
			}
			return
		}
		else
		{	
;;FIND LEFT GREEN
			PixelSearch, Px, Py, 911, 765, 911, 765, 0X00FA41, 75, Fast
			if (ErrorLevel = 0)
			{
				if ( tame_key == "ä" ) {
					return
				}
				if ( tame_key == "d" ) {
					SendInput {d up}
					SendInput {a down}
					ToolTip KEY: A DOWN`nKEY: D UP, %LEFT%, %HOOG%, 3
					tame_key := "a"
				}
				if ( tame_key == "none" ) {
					SendInput {a down}					
					ToolTip KEY: A DOWN`nKEY: D UP, %LEFT%, %HOOG%, 3
					tame_key := "a"
				}
				return
			}
			else
			{
;;FIND RIGHT WHITE
				PixelSearch, Px, Py, 1641, 748, 1641, 748, 0XFBFFFF, 10, Fast
                if (ErrorLevel = 0)
                {	
					if ( tame_key == "d" ) {
						return
					}
					if ( tame_key == "a" ) {
						SendInput {a up}
		        		SendInput {d down}
                		ToolTip KEY: A UP`nKEY: D DOWN, %RIGHT%, %HOOG%, 3
		        		tame_key := "d"	
		        	}
					if ( tame_key == "none" ) {
						SendInput {d down}
						ToolTip KEY: A UP`nKEY: D DOWN, %RIGHT%, %HOOG%, 3
						tame_key := "d"
					}
					return
		        }
		        else
		        {
;;FIND RIGHT GREEN				
					
					PixelSearch, Px, Py, 1641, 748, 1641, 748, 0x00FE42, 75, Fast
				    if (ErrorLevel 	= 0)
				    {
						;MsgBox Found right green
				    	if ( tame_key == "d" ) {
							return
						}
						if ( tame_key == "a" ) {
							SendInput {a up}
				    		SendInput {d down}
							ToolTip KEY: A UP`nKEY: D DOWN, %RIGHT%, %HOOG%, 3
				    		tame_key := "d"	
				    	}
						if ( tame_key == "none" ) {
							SendInput {d down}
							ToolTip KEY: A UP`nKEY: D DOWN, %RIGHT%, %HOOG%, 3
							tame_key := "d"
						}
						return
				    }
				    else 
				    {
				    	if ( tame_key == "none" ) {
				    	return
				    	}
				    	if ( tame_key == "a" ) {
				    		SendInput {a up}
				    		ToolTip KEY: A UP`nKEY: D UP, %MIDDLE%, %HOOG%, 3
				    		tame_key := "none"
				    	}
				    	if ( tame_key == "d" ) {
				    		SendInput {d up}
				    		ToolTip KEY: A UP`nKEY: D UP, %MIDDLE%, %HOOG%, 3
				    		tame_key := "none"
				    	}
				    }
				}
			}
		}
				
				
				
				
				
		
	;}
	;else
	;{
	;	if WinExist("ARK: Survival Evolved") {
	;		WinActivate
	;	}
	;}
}














^!z::  ; Control+Alt+Z hotkey.
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
MsgBox The color at the current cursor position is %color%.
return

RemoveToolTip:
	ToolTip
return

F10::
	Reload
return

F11::
	ExitApp
return
