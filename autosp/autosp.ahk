#NoEnv
SetWorkingDir, %A_ScriptDir%
Process, Priority,, High
castedTime := 0
silent := 0
auth := ["ptchelle.png", "ptjerry.png", "ptwatch.png", "ptrtn.png"]

CoordMode, Pixel
Loop
{
	Sleep, 20
	
	ImageSearch, X, Y, 970, 560, 1060, 640, *100 pt.png
	if (ErrorLevel = 0)
	{
		access := 0
		text := "{Enter}/p {$}27{#}Welcome stranger{!}"
		for k, v in auth
		{
			ImageSearch, X, Y, 1037, 589, 1159, 612, *100 %v%
			if (ErrorLevel = 0)
			{
				access := 1
				if (k = 1)
				{
					text := "{Enter}/p {$}27{#}Yo, {$}2{#}Chelle{$}27{#}{!}"
				}
				else if (k = 2)
				{
					text := "{Enter}/p {$}27{#}Yo, {$}2{#}Jerry{$}27{#}{!}"
				}
				else if (k = 3)
				{
					text := "{Enter}/p {$}27{#}Ahoy, {$}2{#}Dave{$}27{#}{!}"
				}
				else if (k = 4)
				{
					text := "{Enter}/p {$}27{#}Hai, {$}2{#}Rtn{$}27{#}{!}"
				}
				break
			}
		}
		if (access = 1)
		{
			Click, 1247, 610
			if (silent = 0)
			{
				Send, %text%
				Sleep, 50
				Send, {Enter}
				Sleep, 1000
			}
		}
		else
		{
			Click, 1265, 610
		}
		Sleep, 1500
	}

	if (silent = 0)
	{
		ImageSearch, X, Y, 50, 630, 150, 660, *100 cdcommand.png
		if (ErrorLevel = 0)
		{
			text := "{Enter}/p {$}34{#}SP{$}27{#} is available now{!}"
			currentTime := (A_Hour * 3600) + (A_Min * 60) + A_Sec
			cd := 300 - (currentTime - castedTime) - 1
			if (cd > 300)
			{
				text := "{Enter}/p {$}34{#}No idea, sorry. :("
			}
			else if (cd > 0)
			{
				text := "{Enter}/p {$}27{#}Remaining cooldown time is {$}2{#}" . cd . "s{$}27{#}."
			}
			Send, %text%
			Sleep, 50
			Send, {Enter}
			Sleep, 1000
		}
	}

	ImageSearch, X, Y, 50, 630, 150, 660, *100 spcommand.png
	if (ErrorLevel = 0)
	{
		ImageSearch, X, Y, 595, 670, 650, 725, *100 spskill.png	
		if (ErrorLevel = 0)
		{
			castedTime := (A_Hour * 3600) + (A_Min * 60) + A_Sec
			Send, 6
			Sleep, 1000
			Send, 7
			chat := "/p "
			if (silent = 1)
			{
				chat := "/c "
			}
			Sleep, 500
			text := "{Enter}" . chat . "{$}27{#}Enjoy your {$}34{#}SP{$}27{#}{!}"
			Send, %text%
			Sleep, 50
			Send, {Enter}
			Sleep, 1000
		}
		else if (ErrorLevel = 1)
		{
			Send, 7
			if (silent = 0)
			{
				Sleep, 500	
				currentTime := (A_Hour * 3600) + (A_Min * 60) + A_Sec
				cd := 300 - (currentTime - castedTime) - 1
				text := "{Enter}/p {$}27{#}Please wait and try again. ({$}2{#}" . cd . "s{$}27{#})"
				if (cd < 0 or cd > 300)
				{
					text := "{Enter}/p {$}27{#}Please wait and try again."
				}
				Send, %text%
				Sleep, 50
				Send, {Enter}
			}
			else
			{
				Send, {Enter}/c {$}27{#}No Jerry, that's not going to work{.}
				Sleep, 50
				Send, {Enter}
			}
			Sleep, 1000
		}
		
	}

	ImageSearch, X, Y, 50, 630, 150, 660, *100 silentcommand.png
	if (ErrorLevel = 0)
	{
		text := "{Enter}/c {$}27{#}Silent mode turned {$}2{#}OFF{$}27{#}{!}"
		if (silent = 0)
		{
			text := "{Enter}/c {$}27{#}Silent mode turned {$}2{#}ON{$}27{#}{!}"
			silent := 1
		}
		else
		{
			silent := 0
		}
		Send, %text%
		Sleep, 50
		Send, {Enter}
		Sleep, 1000
	}
}