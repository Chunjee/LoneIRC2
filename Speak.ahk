;/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\
; Description
;\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/
; Speaks the Argument 1 in the voice of Argument 2
; This exists so we can have microsoft anna speaking simultaneously
;

;~~~~~~~~~~~~~~~~~~~~~
;Compile Options
;~~~~~~~~~~~~~~~~~~~~~
StartUp()
Version_Name = v1.0
The_ProjectName = BackGround_TTS

;Dependencies
#Include %A_LineFile%\..\lib
#Include TTS.ahk

;/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\
;MAIN PROGRAM STARTS HERE
;\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/

;Command Line Argument 2 can be a path to a settings file. Otherwise check ScriptDir
CLI_Arg1 = %1%
CLI_Arg2 = %2%
	If (CLI_Arg1 != ""||CLI_Arg2 != "") {
	Voice := CLI_Arg1
	Message := CLI_Arg2
	} Else {
	ExitApp, 100
	}
	
;Check that voice exists? Not yet implemented/needed?

;Create Object and send message
Random, Rand, 1, 100
obj_TTSVoice := Fn_TTSCreateVoice(Voice)
Fn_TTS(obj_TTSVoice, "Speak", Message)
;SpeakFile := Fn_TTS(obj_TTSVoice, "SpeakToFile", Message, A_LineFile . A_Now . "_" . Rand . ".wav")
;SoundPlay, %SpeakFile%, WAIT
;SoundPlay, alf.mp3
FileDelete, %SpeakFile%
ExitApp

;/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\
; FUNCTIONS
;\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/

StartUp()
{
#NoTrayIcon
}