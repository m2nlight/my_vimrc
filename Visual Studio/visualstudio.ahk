; map ctrl-o to alt-right, ctrl-i to alt-left for vim navigate back/forward
#HotIf WinActive("ahk_exe devenv.exe")
^i::Send "^+-"
^o::Send "^-"
^=::Send "!+="
^-::Send "!+-"
; map capslock to ctrl key, like HHKB
;CapsLock::LCtrl
;AppsKey::CapsLock
#HotIf

; map win+q to win+alt+space for PowerToys 1.90.0
;#q::Send "#!{Space}"
