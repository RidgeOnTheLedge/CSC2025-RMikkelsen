.386P
.model flat

extern _ExitProcess@4:near
extern _GetStdHandle@4:near
extern _WriteConsoleA@20:near

.data

	msg			DB	'Hello World!', 0
	outhandle	DD	?
	written		DD	?


.code

main PROC near	
	           
	push	-11 ; STD_OUTPUT_HANDLE
	call	_GetStdHandle@4
	mov		outhandle, eax
	
	; WriteConsole(handle, &msg[0], 13, &written,0)	 
	push	0
	push	offset written
	push	12
	push	offset msg
	push	outhandle
	call	_WriteConsoleA@20

	push	0
	call	_ExitProcess@4
	 
main ENDP
 
END 