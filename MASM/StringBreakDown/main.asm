.386
.model flat, stdcall
option casemap:none

extern GetStdHandle@4:near
extern WriteConsoleA@20:near
extern ExitProcess@4:near

.data
outputHandle    DD ?
msg             DB 'Hello', 0
written         DD ? 
newline         DB 0Dh, 0Ah

.code
main PROC near

    ; Get stdout handle (-11)
    push    -11
    call    GetStdHandle@4
    mov     outputHandle, eax       ; Save stdout handle

    ; Initialize ebx to point to the start of the string
    mov     ebx, offset msg
  
_loop_start:
    ; Read the byte at the address ebx points to into al
    mov     al, [ebx]
    
    ; Check for the null terminator (end of string)
    cmp     al, 0
    je      _loop_end
    
    ; Write the single character pointed to by ebx
    push    0
    push    offset written
    push    1                    ; length = 1 character
    push    ebx                  ; pointer to the character
    push    outputHandle
    call    WriteConsoleA@20

    ; Write the newline (carriage return + line feed)
    push    0
    push    offset written
    push    2                    ; length = 2 bytes (\r\n)
    push    offset newline       ; pointer to newline data
    push    outputHandle
    call    WriteConsoleA@20

    ; Move to the next character in the string
    inc     ebx
    jmp     _loop_start

_loop_end:

_exit:
    ; Exit program safely
    push    0
    call    ExitProcess@4
main ENDP
END
