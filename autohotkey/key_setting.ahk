/*
[NewScriptTemplate]
Description = Just #Requires v2.0
*/
; #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #SingleInstance Force  ; Prevent multiple script instances.

#Requires AutoHotkey v2.0

; 各種設定 ===========================================================================

; 多重起動不可
#SingleInstance Force

; プロセス優先度
ProcessSetPriority("Realtime")

; リマップ ===========================================================================

; 無変換キーを修飾キーとして使うため、無効化
SC07B:: Return

; vk1D ( 無変換キー ) を修飾キーとしたリマップ
#HotIf GetKeyState("SC07B", "P")

; 「無変換⁺上段キー」でファンクションキーの動作をさせる
1::Send("{F1}")
2::Send("{F2}")
3::Send("{F3}")
4::Send("{F4}")
5::Send("{F5}")
6::Send("{F6}")
7::Send("{F7}")
8::Send("{F8}")
9::Send("{F9}")
0::Send("{F10}")
-::Send("{F11}")
^::Send("{F12}")
\::Send("{Ins}")

; 上段
q::Send("{Esc}")
w::Send("{Home}")
e::Send("{PgUp}")
r::Send("#{Tab}")  ;-- win + tab
;t::
;y::
;u::
;i::
;o::
p::Send("{WheelUp}")
;@::
;[::

a::Send("{AppsKey}")
s::Send("{End}")
d::Send("{PgDn}")
;g::
h::Send("{Left}")
j::Send("{Down}")
k::Send("{Up}")
l::Send("{Right}")
vkBB::Send("{Enter}")         ;-- ※vkBBはセミコロン
;:::
;]::

z::Send("#1")
x::Send("#2")
c::Send("#3")
v::Send("#4")
b::Send("#5")
n::Send("{WheelDown}")
m::Send("{Enter}")
,::Click("D") ; 左クリック
.::Click("R") ; 右クリッ
;m::Home
;.::End

BackSpace::Send("{Delete}")

#HotIf

;vk1D::MsgBox("無変換キーが押されました") 
;vk1D & f::MsgBox("無変換キー+fが押されました") 
;vk1D Up::MsgBox("無変換キーが離されました")

global AltHold := false
SC07B & f:: {
	global AltHold
	if !AltHold {
		Send("{Alt Down}")
		AltHold := true
		;MsgBox("Alt Downされました")
	}
	Send("{Tab}")
}
SC07B Up:: {
	global AltHold
	if AltHold {
		AltHold := false
		Send("{Alt Up}")
		MsgBox("無変換が離されてAlt Upされました")
	}
}

^BackSpace::send("{Delete}")
+BackSpace::send("{Delete}")

