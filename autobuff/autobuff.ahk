Loop
{
	Sleep, 3000
	CoordMode, Pixel
	ImageSearch, X, Y, 970, 560, 1060, 640, *100 pt.png
	if ErrorLevel = 0
	{
		Click, 1247, 610
		Sleep, 1500
		Send, 3
		Sleep, 1000
		Send, 4
		Sleep 3000
		Send, {Enter}/leaveparty
		Sleep, 1000
		Send, {Enter}
		Sleep 3000
		Send, {Enter}
	}
}
return