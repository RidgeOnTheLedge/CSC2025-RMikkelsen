.386P
.model flat

extern _ExitProcess@4: near

.data

number1		    DD	10
number2	        DD	20
number3		    DD	30
number4	        DD	40

.code

main PROC near
_main:

		
	mov eax, [number1]
	mov ebx, [number4]

	mov [number1], ebx
	mov [number4], eax

	mov eax, [number2]
	mov ebx, [number3]

	mov [number2], ebx
	mov [number3], eax

	push 0
	call _ExitProcess@4

main ENDP
END