#NoEnv
#Persistent
#NoTrayIcon
#SingleInstance, Off
SetWorkingDir, %A_LineFile%\..
SetBatchLines, -1
#Include %A_LineFile%\..\lib
#Include Socket.ahk
#Include Json.ahk
#Include Utils.ahk
#Include %A_ScriptDir%\util_arrays

Json = %1%
for Var, Value in Json_ToObj(Json)
	%Var% := Value
;Array_Gui(Json_ToObj(Json))
	

Settings := Ini_Read("Settings.ini")
if (Settings.Bitly.login)
	Shorten(Settings.Bitly.login, Settings.Bitly.apiKey)

Chat(Channel, Text)
{
	TCP := new SocketTCP()
	TCP.Connect("localhost", 26656)
	TCP.SendText(Channel "," Text)
}

/*
ChatAction(Channel, Text)
{
	TCP := new SocketTCP()
	TCP.Connect("localhost", 26656)
	Text2 := A_Space . Text
	TCP.SendText(Channel "," Text)
}


SendACTION(Channel, Text)
{
	TCP := new SocketTCP()
	TCP.Connect("localhost", 26656)
	TCP.SendText(Channel " ACTION " Text)
	
	
	;SendCTCP(Channel, "ACTION", Text)
	;TCP.SendText(Channel "," Text)
}
*/