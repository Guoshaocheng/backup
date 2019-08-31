;设置图标
;ifExist,script.ico
;{
;    Menu TRAY,icon,script.ico
;}


;#l:: run, C:\Program Files\Listary\Listary.exe
;#a:: run, C:\Program Files (x86)\ADM\ADM.exe
;#k:: run, C:\Program Files (x86)\Lingoes\Translator2\Lingoes.exe

#s:: run, C:\Program Files\Sublime Text 3\sublime_text.exe
#t:: run, C:\Program Files (x86)\Tencent\TIM\Bin\TIM.exe
#w:: run, C:\Program Files (x86)\Tencent\WeChat\WeChat.exe
#c:: run, C:\Users\MrGuo\AppData\Local\CentBrowser\Application\chrome.exe
#b:: run, C:\Users\MrGuo\.babun\cygwin\bin\mintty.exe
#v:: run, C:\Users\MrGuo\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Anaconda3 (64-bit)\IPython

!d:: run, D:\OneDrive
!w:: run, D:\下载
!n:: run, E:\Nut
!f:: run, F:\
!b:: run, E:\OneDrive - std.uestc.edu.cn\后端

::qm::616985418@qq.com
::wm::Ougsch@163.com
::gm::Ougsch@gmail.com
::mm::Ougsch@outlook.com
::az::mcsoc2
::sx::source .cshrc
::qw::exit


; Sends Esc if capslock is pressed alone
; Sends Ctrl+key if capslock is pressed with another key
; TODO: work with arrow keys and other modifiers (e.g. shift, control)

SetCapsLockState AlwaysOff
CapsLock::Send {esc}
CapsLock & a::Send ^a
CapsLock & b::Send ^b
CapsLock & c::Send ^c
CapsLock & d::Send ^d
CapsLock & e::Send ^e
CapsLock & f::Send ^f
CapsLock & g::Send ^g
CapsLock & h::Send ^h
CapsLock & i::Send ^i
CapsLock & j::Send ^j
CapsLock & k::Send ^k
CapsLock & l::Send ^l
CapsLock & m::Send ^m
CapsLock & n::Send ^n
CapsLock & o::Send ^o
CapsLock & p::Send ^p
CapsLock & q::Send ^q
CapsLock & r::Send ^r
CapsLock & s::Send ^s
CapsLock & t::Send ^t
CapsLock & u::Send ^u
CapsLock & v::Send ^v
CapsLock & w::Send ^w
CapsLock & x::Send ^x
CapsLock & y::Send ^y
CapsLock & z::Send ^z
CapsLock & 0::Send ^0
CapsLock & 1::Send ^1
CapsLock & 2::Send ^2
CapsLock & 3::Send ^3
CapsLock & 4::Send ^4
CapsLock & 5::Send ^5
CapsLock & 6::Send ^6
CapsLock & 7::Send ^7
CapsLock & 8::Send ^8
CapsLock & 9::Send ^9
; how to scape ` and ; ?
; CapsLock & `::Send ^`
; CapsLock & ; ::Send ^;
CapsLock & '::Send ^'
CapsLock & ,::Send ^,
CapsLock & .::Send ^.
CapsLock & /::Send ^/
CapsLock & -::Send ^-
CapsLock & =::Send ^=
CapsLock & [::Send ^[
CapsLock & ]::Send ^]