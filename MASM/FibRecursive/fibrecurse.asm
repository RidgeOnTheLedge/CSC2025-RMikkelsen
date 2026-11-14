.386P
.model flat

extern _ExitProcess@4: near

.data
n		    DD 5

.code
_fibrecurse PROC near

	; prologue 
	push	ebp ; save poipnter to stack frame on the stack
	mov		ebp, esp ; 
	sub		esp, 4 ; make room for local var
	
	mov		eax, [ebp+8] ; argument 1 n 
	
	; if eax <= 1 return n
	cmp		eax, 1
	jle		_done
	
	; fib(n - 1)
	dec		eax ; (n - 1)
	push	eax ; arg 1
	call	_fibrecurse ; fib()
	add		esp, 4 ; remove the argument 
	mov [ebp-4], eax ; go -4 memory pointer store eax there

	; fib(n - 2)
	mov		eax, [ebp+8] ; refresh eax with n which was replaced in fib(n - 1)
	sub		eax, 2 ; (n - 2)
	push	eax  ; arg 1
	call	_fibrecurse ; fib()
	add		esp, 4

	; fib(n-1) + fib(n-2)
	add eax, [ebp-4] ; add eax, and memory pointer which stored fib(n-1)
	
_done:
	mov esp, ebp ; epilogue
	pop ebp
	ret
_fibrecurse		ENDP	
END