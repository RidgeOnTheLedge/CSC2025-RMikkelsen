.386P
.model flat

extern _ExitProcess@4: near

.data
n		    DD 5

.code
main PROC near
_main:

	mov eax, 1 ; previous
	mov	ebx, 1 ; current
	mov	ecx, 0 ; next

	mov edx, 3 ; condition
	
_loop:  
    cmp     edx, n
    jg      _loop_end
	
	mov ecx, ebx
	add ecx, eax
	mov eax, ebx
	mov ebx, ecx

	inc edx
	jmp _loop

_loop_end:
	push 0
	call _ExitProcess@4

main ENDP
END