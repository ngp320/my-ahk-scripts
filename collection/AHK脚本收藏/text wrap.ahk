/*
[script info]
version     = 2.4
description = wrap selected text in %symbols%
author      = davebrny
source      = git.io/v1neW
*/

sendMode input
return ; end of auto-execute
;---------------------------

!R::
::w2R::
goTo, wrap_R        ;   <font color=red>text<font>

!2::
::w2::
goTo, wrap_quote        ;   "text"

!'::
::w'::
goTo, wrap_apostrophe   ;   'text'

!`::
::w``::
goTo, wrap_grave        ;   `text`

!9::
::w9::
goTo, wrap_parenthesis  ;   (text)

![::
::w[::
goTo, wrap_bracket      ;   [text]

!]::
::w]::
goTo, wrap_brace        ;   {text}

!,::
::w,::
goTo, wrap_angle        ;   <text>

!5::
::w5::
goTo, wrap_percent      ;   %text%

!.::
::w.::
goTo, wrap_2_angle      ;  >>text<<

!8::
::w8::
goTo, wrap_asterisk     ;   *text*

+!8::
::w*::
goTo, wrap_2_asterisk   ;  **text**

+!#::
::w~::
goTo, wrap_tilde        ;  ~~text~~

!-::
::w-::
goTo, wrap_hyphen       ;   -text-

+!-::
::w_::
goTo, wrap_underscore   ;   _text_

!k::
::wkbd::
goTo, wrap_kbd          ;   <kbd>text</kbd>

!del::
::wdel::
goTo, wrap_delete       ;   _text_  --->  text




;-----------------------



wrap_R:
wrap_quote:
wrap_apostrophe:
wrap_grave:
wrap_parenthesis:
wrap_bracket:
wrap_brace:
wrap_angle:
wrap_percent:
wrap_2_angle:
wrap_asterisk:
wrap_2_asterisk:
wrap_tilde:
wrap_hyphen:
wrap_underscore:
wrap_kbd:
this_label := a_thisLabel
clipboard_text := get_clipboard()
for what, with in { "wrap_R"           : "<font color=red>" clipboard_text "</font>"
                  , "wrap_quote"       : """" clipboard_text """"
                  , "wrap_apostrophe"  :  "'" clipboard_text "'"
                  , "wrap_grave"       : "``" clipboard_text "``"
                  , "wrap_parenthesis" :  "(" clipboard_text ")"
                  , "wrap_bracket"     :  "[" clipboard_text "]"
                  , "wrap_brace"       :  "{" clipboard_text "}"
                  , "wrap_angle"       :  "<" clipboard_text ">"
                  , "wrap_percent"     :  "%" clipboard_text "%"
                  , "wrap_2_angle"     : ">>" clipboard_text "<<"
                  , "wrap_asterisk"    :  "*" clipboard_text "*"
                  , "wrap_2_asterisk"  : "**" clipboard_text "**"
                  , "wrap_tilde"       : "~~" clipboard_text "~~"
                  , "wrap_hyphen"      :  "-" clipboard_text "-"
                  , "wrap_underscore"  :  "_" clipboard_text "_"
                  , "wrap_kbd"         :  "<kbd>" clipboard_text "</kbd>" }
    stringReplace, this_label, this_label, % what, % with, all
new_text := this_label
goSub, send_wrap
return



wrap_delete:
clipboard_text := get_clipboard()
loop, 2
    {
    stringLeft, left_character, clipboard_text, 1
    stringRight, right_character, clipboard_text, 1
    if regExMatch(left_character, "[\Q'%*-_""~``([{><\E]")
        and if regExMatch(right_character, "[\Q'%*-_""~)``]}><\E]")  ; if  '%*-_"~`([{
        {
        stringTrimLeft, clipboard_text, clipboard_text, 1
        stringTrimRight, clipboard_text, clipboard_text, 1
        }
    else break
    }
new_text := clipboard_text
goSub, send_wrap
return



get_clipboard(){
    global
    if !inStr(a_thisHotkey, ":")    ; if hotkey was used
        {
        revert_clipboard := clipboardAll
        clipboard =
        send ^{c}
        clipWait, 0.3
        if clipboard is space
            clipboard =
        }

    return clipboard
}



send_wrap:
if !inStr(a_thisHotkey, ":") and if (clipboard = "")       ; if hotkey was used
     position := "{Left " round( strLen(new_text) / 2) "}" ; move cursor between symbols
else position := ""
clipboard := new_text
send % "^{v}" . position
sleep 50
clipboard := revert_clipboard
return