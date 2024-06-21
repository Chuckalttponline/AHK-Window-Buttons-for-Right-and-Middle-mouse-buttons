;---------------------------------------------------------------------------------------------
; You know, performance stuff... Nothing to see here
;---------------------------------------------------------------------------------------------
#NoEnv
SendMode Input
CoordMode, Mouse, Screen
SetMouseDelay, -1   ; no pause after mouse clicks
SetKeyDelay, -1     ; no pause after keys sent
SetWinDelay, -1     ; no pause after window stuff
SetBatchLines, -1
Listlines, off
Return
;---------------------------------------------------------------------------------------------

/*
Thanks to the people at https://www.autohotkey.com/board/topic/45629-detect-when-the-close-button-is-clicked-upon-for-any-window/ who figured this cool Errorlevel send message thing about ahk on windows

Customize as you wish!
These are the   [If ( ErrorLevel = 20 )] if statement Numbers, the number will trigger accordingly with the part of the window you are on when you Right click


--------------------------------------
Main 3 Buttons most all windows have "Close, Minimize and Maximize":

HTCLOSE (20): In a Close button.
HTMAXBUTTON (9): In a Maximize button.
HTMINBUTTON (8): In a Minimize button.
--------------------------------------

--------------------------------------
All resize points of a window:

HTLEFT (10): In the left border of a resizable window.
HTRIGHT (11): In the right border of a resizable window.
HTBOTTOMLEFT (16): In the lower-left corner of a border of a resizable window.
HTBOTTOMRIGHT (17): In the lower-right corner of a border of a resizable window.
HTTOPRIGHT (14): In the upper-right corner of a window border.
HTTOPLEFT (13): In the upper-left corner of a window border.
HTBOTTOM (15): In the lower-horizontal border of a resizable window.
HTTOP (12): In the upper-horizontal border of a window.

The odd brothers of these:
HTBORDER (18): In the border of a window that does not have a sizing border.
HTSIZE (4): In a size box. ;what ever that means XD
--------------------------------------

--------------------------------------
Other common widows controls:

HTHELP (21): In a Help button.
HTMENU (5): In a menu.   Or as I like to call it the "Alt Menu" as you can always access it by pressing the Alt key
HTHSCROLL (6): In a horizontal scroll bar.
HTVSCROLL (7). In a vertical scroll bar.
HTSYSMENU (3): In a window menu or in a Close button in a child window.
--------------------------------------

--------------------------------------
Odd ones out I'll call this the in a Area section: 

HTCAPTION (2): In a title bar.
HTCLIENT (1): In a client area.
HTERROR (-2): On the screen background or on a dividing line between windows.
HTNOWHERE (0): On the screen background or on a dividing line between windows.
HTTRANSPARENT (-1): In a window currently covered by another window in the same thread.
--------------------------------------
*/


; But I have to warn you not all windows will work with these as some devs don't use normal window controls and make there own boarderless windows that only look like there a boarded window, using custom controls for actions like Minimize close and maximize Such as "WPS office", "MS office" or "WinX Ripper" dvd backup maker
; Also a thing to note I don't know why but Notepad++ and I don't know for sure but probably others to will call the Maximize button the Minimize button and not call the Minimize button any thing. The close button seems to work always though
;---------------------------------------------------------------------------------------------




$*~RButton::
  MouseGetPos, ClickX, ClickY, WindowUnderMouseID
  WinActivate, ahk_id %WindowUnderMouseID%
  SendMessage, 0x84,, ( ClickY << 16 )|ClickX,, ahk_id %WindowUnderMouseID% 
  If ( ErrorLevel = 20 )
Msgbox, Close button
;here's an Idea on what to use this command for `WinSet, AlwaysOnTop, Toggle, A` always on top when you right click. Cool hhu' 
If ( ErrorLevel = 9 )
msgbox, Maximize button
If ( ErrorLevel = 8 )
msgbox, Minimize button
Return
