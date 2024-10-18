#Requires AutoHotkey v2.+

;; Switch CapsLock and Left Control
;; Use KeyTweak for better effect
;CapsLock::Ctrl
;Ctrl::CapsLock

;; Vimlike navigation
^h::Send "{Left}"
^l::Send "{Right}"
^j::Send "{Down}"
^k::Send "{Up}"

~LShift::
{
  if KeyWait('LShift', 'T0.2')
    ; Single press
    Send "{Esc}"
  else
    ; Long press
    KeyWait('LShift')
}

