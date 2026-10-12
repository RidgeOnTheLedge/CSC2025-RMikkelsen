.386P
.model flat

extern _ExitProcess@4:near
extern _WriteConsoleA@20:near
extern _GetStdHandle@4:near


.data


outputHandle    DD ?
msg				DB	'Hello World!', 0
written         DD ? 


.code

main PROC near


push	offset msg
call	_writeLine
add		esp,	4

push 0
call _ExitProcess@4

main ENDP

; The function writes a line, the arugment is the pointer to the string
_writeLine PROC

	; Subroutine Prologue
	push	ebp
	mov		ebp,	esp
	sub		esp,	4 ; make room for the value
	push	edi
	push	esi


	; Get stdout handle (-11)
    push    -11
    call    _GetStdHandle@4
    mov     outputHandle, eax       ; Save stdout handle

	;	Subroutine Body
	mov		eax,	[ebp+8] ; Move paramter 1 (msg) into EAX

    mov     ebx, eax


	_loop_start:
        ; Read the byte at the address ebx points to into al
        mov     al, [ebx]
    
        ; Check for the null terminator (end of string)
        cmp     al, 0
        je      _loop_end

      
	    ; Write the single character pointed to by ebx
        push    0
        push    offset written
        push    1                   ; length = 1 character
        push    ebx                  ; pointer to the character
        push    outputHandle
        call    _WriteConsoleA@20


        ; Move to the next character in the string
        inc     ebx
        jmp     _loop_start

    _loop_end:

	mov		[ebp-12],	edi
	add		eax,		[ebp-12]


	pop		esi
	pop		edi
	mov	    esp,	ebp
	pop		ebp
	ret

_writeLine ENDP

END