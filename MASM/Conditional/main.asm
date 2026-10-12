.386P
.model flat

extern _ExitProcess@4:near
extern _WriteConsoleA@20:near
extern _GetStdHandle@4:near



.data

; Numbers for condition
num		        DD	50
condition       DD  0

; Output for each condition
msgNeg	        DB	"Negitive Num", 0
msgPos	        DB	"Positive Num", 0 


; Write to console
written         DD  ?
outputHandle    DD  ?

.code

main PROC near

_main:
    ; Get stdout handle (-11)
    push -11
    call _GetStdHandle@4
    mov  outputHandle, eax       ; Save stdout handle!

    mov ebx, num
    mov eax, condition

    ; Compare number to condition
    cmp ebx, eax 

    ;if num < 0
    js  _neg_condition

    ;else
    jmp _pos_condition

_neg_condition:
    ; Write prompt to console
    push 0
    push offset written
    push 13                   ; length of prompt string
    push offset msgNeg
    push outputHandle
    call _WriteConsoleA@20
    jmp _exit


_pos_condition:
    ; Write prompt to console
    push 0
    push offset written
    push 13                   ; length of prompt string
    push offset msgPos
    push outputHandle
    call _WriteConsoleA@20

    jmp _exit

_exit:   
    push 0
    call _ExitProcess@4


main ENDP
END