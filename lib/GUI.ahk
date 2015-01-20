Sb_UserAndChannelWindow()
{
global

;Gui, 81: Add, Picture, x0 y0 h190 w280 0x4000000, grad.png
Gui, 81: Font, s14, Arial
Gui, 81: Add, Text, x12 y10 w250 h40 +Center +BackgroundTrans, Choose Username
Gui, 81: Add, Edit, vNickName x62 y60 w150 h40 +Center,
;Gui, 81: Add, Text, Center W270 yp+30 x5 +BackgroundTrans, Channel To Join
;Gui, 81: Add, Edit, vChannel1 W150 yp+20 xp+60, %ReadDefChan%
Gui, 81: Font, s12, Arial
Gui, 81: Add, Button, x92 y110 w90 h40 , Join


Gui, 81: Show, w279 h159
Return

81GuiClose:
ExitApp

81ButtonJoin:
Gui, 81: Submit
	If (NickName = "") {
	
	}
Channel1 := (SubStr(Channel1, 1, 1) = "#") ? Channel1 : "#" Channel1
}