.386P
.model flat

extern _ExitProcess@4: near
extern _fibrecurse: near

.data
n		    DD 20

.code
main PROC near
_main:

	
	push	n ; argument 
	call	_fibrecurse ; 
	add		esp, 4 ; remove the argument 


	push eax
	call _ExitProcess@4
main ENDP
END