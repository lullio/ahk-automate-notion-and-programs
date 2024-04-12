#Include <Default_Settings>

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}


SetTitleMatchMode, 2
; Define the target window title (Google Chrome)
targetTitle := "Visual"

; Main loop
; Loop
; {
    ; Check if the active window matches the target title
    CapsLock & WheelDown::
    IfWinActive, %targetTitle%
    {
      ; msgbox hi
        ; Scroll down (you can adjust the number of lines scrolled)
      ;   Sleep, 1000
      ;   ControlClick, , {WheelDown}, ahk_class Notepad++
      ;   ControlSend, , {WheelDown}, ahk_class Notepad++
      ;   ControlSend, , WheelDown, ahk_class Notepad++
        ; ControlClick,Scintilla1, ahk_class Notepad++,,WheelDown

        ControlClick,Chrome_RenderWidgetHostHWND1, ahk_exe Notion.exe,,WheelDown
        ControlClick,Chrome_RenderWidgetHostHWND2, ahk_exe Notion.exe,,WheelDown

        ; ControlClick,Chrome_RenderWidgetHostHWND2, ahk_exe msedge.exe,,WheelDown
    }
    Return
    CapsLock & WheelUp::
    IfWinActive, %targetTitle%
    {
      ; msgbox hi
        ; Scroll down (you can adjust the number of lines scrolled)
      ;   Sleep, 1000
      ;   ControlClick, , {WheelDown}, ahk_class Notepad++
      ;   ControlSend, , {WheelDown}, ahk_class Notepad++
      ;   ControlSend, , WheelDown, ahk_class Notepad++
        ; ControlClick,Scintilla1, ahk_class Notepad++,,WheelUp

        ControlClick,Chrome_RenderWidgetHostHWND2, ahk_exe Notion.exe,,WheelUp
        ControlClick,Chrome_RenderWidgetHostHWND1, ahk_exe Notion.exe,,WheelUp
        ; ControlClick,Chrome_RenderWidgetHostHWND2, ahk_exe Notion.exe,,WheelUp
        
        SetKeyDelay, 10, 10
        ControlSend, Chrome_RenderWidgetHostHWND1, ^p, ahk_exe Notion.exe

    }
    Return
; }