section .text
	global _start
_start:
	mov edx, len
	mov ecx, message
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov ebx, 0
	mov eax, 1
	int 0x80
section .data
	message db "Hello, world!", 0xa
	len equ $ - message

