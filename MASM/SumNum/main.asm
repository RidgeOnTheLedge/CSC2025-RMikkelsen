.386P
.model flat

extern _ExitProcess@4: near

.data


num1		    DD	10
num2	        DD	5
.code

main PROC near

_main:

push	offset	num1
push	offset	num2
call	_addNums
add		esp,	4



; The function writes a line, the arugment is the pointer to the string
_addNums PROC
	; Subroutine Prologue
	push	ebp
	mov		ebp,	esp
	sub		esp,	4 ; make room for the value

	push	edi
	push	esi

	mov		eax,	[ebp+8]
	mov		esi,	[ebp+12]

	add		eax,	esi
	
	;	Subroutine	Epilouge

	pop	esi
	pop	edi
	mov	esp,	edp
	pop	edp
	
	ret	






	push 0
	call _ExitProcess@4
	
_addNums ENDP

main ENDP
END