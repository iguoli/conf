;; remap tab to hyper
;; if tab is toggled, keep the original key code

;; Hold Tab to Hyper Key
Tab::
    Send {Blind}{Ctrl Down}{Shift Down}{Alt Down}{LWin Down}
    cDown := A_TickCount
return                            

Tab up::
    If ((A_TickCount-cDown) < 150)
        Send {Blind}{Ctrl Up}{Shift Up}{Alt Up}{LWin Up}{Tab}
    Else
        Send {Blind}{Ctrl Up}{Shift Up}{Alt Up}{LWin Up}
return

;; Vim navigation with hyper
Tab & h:: Send {Left}
Tab & l:: Send {Right}
Tab & k:: Send {Up}
Tab & j:: Send {Down}

;; Hold CapsLock to Left Control
*CapsLock::
    Send {Blind}{LCtrl Down}
    cDown := A_TickCount
return

*CapsLock up::
    ; Modify the threshold time (in milliseconds) as necessary
    If ((A_TickCount-cDown) < 150)
        Send {Blind}{LCtrl Up}{CapsLock}
    Else
        Send {Blind}{LCtrl Up}
return

;; Left Shift to Esc
LShift::
    Send {Blind}{LShift Down}
    cDown := A_TickCount
return

LShift up::
    ; Modify the threshold time (in milliseconds) as necessary
    If ((A_TickCount-cDown) < 150)
        Send {Blind}{LShift Up}{Esc}
    Else
        Send {Blind}{LShift Up}
return
