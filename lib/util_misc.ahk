; Version 0.5 of all around useful functions

;/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\
; Functions
;\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/

;Quick RegEx for quick matches. Remember to include match parenthesis (\d+).+ Returns matched value
;Fn_QuickRegEx(A_LoopRealLine,"(\d+)")
Fn_QuickRegEx(para_Input,para_RegEx,para_ReturnValue := 1)
{
	RegExMatch(para_Input, para_RegEx, RE_Match)
	If (RE_Match%para_ReturnValue% != "")
	{
	ReturnValue := RE_Match%para_ReturnValue%
	Return %ReturnValue%
	}
Return "null"
}

Fn_ReplaceString(para_1,para_2,para_String) {
StringReplace, l_Newstring, para_String, %para_1%, %para_2%, All
Return l_Newstring
}

Fn_InArray(Obj,para_Search,para_Table := "")
{
	If (para_Table = "") {
		Loop % Obj.MaxIndex() {
			If(Obj[A_Index] = para_Search)	{
			Return 1
			}
		}
		;Return 0 if the search did not find any match
		Return 0
	}
	
	If (para_Table != "") {
		Loop % Obj.MaxIndex() {
			If(Obj[A_Index,para_Table] = para_Search)	{
			Return 1
			}
		}
		;Return 0 if the search did not find any match
		Return 0
	}
Return 0
}

Fn_SearchArrayReturnOther(Obj,para_Search,para_SearchTable,para_ReturnTable)
{
	Loop % Obj.MaxIndex() {
		If(Obj[A_Index,para_SearchTable] = para_Search)	{
		Return Obj[A_Index,para_ReturnTable]
		}
	}
Return "null"
}


Fn_SearchArrayReturnTrue(Obj,para_Search,para_SearchTable)
{
	Loop % Obj.MaxIndex() {
		If(Obj[A_Index,para_SearchTable] = para_Search) {
		Return True
		}
	}
Return False
}


Fn_SearchSimpleArray(Obj,para_Search)
{
	Loop % Obj.MaxIndex() {
		If (Obj[A_Index] = para_Search) {
		Return True
		}
	}
Return False
}


;/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\
; Subroutines
;\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/--\--/

;Allows for remote shutdown
Sb_RemoteShutDown()
{
SetTimer, RemoteShutDown, 2520000 ;42 mins
Return
RemoteShutDown:
l_Shutdownfile = %A_ScriptDir%\shutdown.cmd
	If (FileExist(l_Shutdownfile)) {
	ExitApp
	}
Return
}

;Debug_Msg is for showing a variable or two instead of msgbox
Debug_Msg(message)
{
Progress, 100, %message%, , , 
;Arial
}