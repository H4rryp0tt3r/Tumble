section .text
	global _start
_start:
	mov ecx, len
	mov edx, message
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov eax, 1
	int 0x80
section .data
	message db "Hello, world!", 0xa
	len equ $ - message

