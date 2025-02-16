#HotIf WinActive("ahk_exe devenv.exe") or WinActive("ahk_exe ReSharper.Backend64c.exe")
; map ctrl-o, ctrl-i to navigate back/forward
^i::Send "^+-"
^o::Send "^-"
; map ctrl-k to previous split pane
^k::Send "+{F6}"
; map ctrl-p, ctrl-n
^p::Send "{up}"
^n::Send "{down}"
#HotIf