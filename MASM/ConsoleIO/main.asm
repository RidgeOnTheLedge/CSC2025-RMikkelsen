.386
.model flat, stdcall
option casemap:none

extern GetStdHandle@4:near
extern WriteConsoleA@20:near
extern ReadConsoleA@20:near
extern ExitProcess@4:near


.data
inputHandle     DD ?
outputHandle    DD ?
prompt          DB 'Type Something: ', 0
written         DD ?
numCharsRead    DD ?
numCharsToRead  DD 1024
readBuffer      DB 1024 DUP(00h)

.code
main PROC near
    ; Get stdin handle (-10)
    push -10
    call GetStdHandle@4
    mov inputHandle, eax        ; Save stdin handle!

    ; Get stdout handle (-11)
    push -11
    call GetStdHandle@4
    mov outputHandle, eax       ; Save stdout handle!

    ; Prompt user to write into console
    push 0
    push offset written
    push 17                     ; length of prompt string
    push offset prompt
    push outputHandle
    call WriteConsoleA@20

    ; Read what is written in console
    push 0
    push offset numCharsRead
    push numCharsToRead
    push offset readBuffer
    push inputHandle
    call ReadConsoleA@20

    ; Print out user text (load value of numCharsRead, not its address)
    mov eax, numCharsRead       ; Get the actual number of read characters
    push 0
    push offset written
    push eax                    ; Pass value, not offset
    push offset readBuffer
    push outputHandle
    call WriteConsoleA@20

    ; Exit program
    push 0
    call ExitProcess@4
main ENDP
END
