.386P
.model flat

extern _ExitProcess@4:near
extern _WriteConsoleA@20:near
extern _GetStdHandle@4:near


.data

; Numbers for condition
num		        DD	0
condition       DD  5 ; n
increment       DD  1
i               DD  0


; Output for each condition
msgNeg	        DB	"Negitive Num", 0
msgPos	        DB	"looped", 0 



; Write to console
written         DD  ?
outputHandle    DD  ?

.code

main PROC near

_main:

    ; Get stdout handle (-11)
    push -11
    call _GetStdHandle@4
    mov  outputHandle, eax      ; Save stdout handle!

    mov ebx, num
    mov esi, condition
    mov edx, increment
    mov ecx, i


    ; Write prompt to console
 ;   push 0
 ;   push offset written
 ;   push 8                   ; length of prompt string
 ;   push offset msgPos
 ;   push outputHandle
 ;   call _WriteConsoleA@20



_loop:
    ; Compare number to condition
    cmp ecx, esi 
    
    ;if num < condition
    jl  _sum

    ;else
    jmp _outcome


_sum:        
    add ebx, ecx
    inc ecx
    jmp _loop
     

_outcome:
    cmp ebx, 10
    je  _loop_ran
    jmp _loop_failed


_loop_ran:
    jmp _exit


  
_loop_failed: ; loop forever
    jmp _outcome


_exit:

	push 0
	call _ExitProcess@4

main ENDP
END