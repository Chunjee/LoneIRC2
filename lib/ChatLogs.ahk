Fn_Chatlog(LogNick,LogMessage)
{
LogDir := CreateArchiveDir()
FormatTime, TimeStamp,, [hh:mm]
FileAppend,%Timestamp% %LogNick%: %LogMessage%`n, %LogDir%.txt
}

CreateArchiveDir()
{
;CurrentDate = %A_Now%
FormatTime, CurrentYear,, yyyy
FormatTime, CurrentMonth,, MM-MMMM
FormatTime, CurrentDay,, dd-dddd
FormatTime, Time_Day,, MM/dd

LogDir = %A_ScriptDir%\Data\Archive\%CurrentYear%\%CurrentMonth%\
	If (!FileExist(LogDir)) {
	FileCreateDir, %LogDir%
	}
Path_Archive = %LogDir%\%CurrentDay%
Return %Path_Archive%
}