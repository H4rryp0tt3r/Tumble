	BITS 16			; Start in real mode (only supports 16-bit)
bootloader:
	mov ax, 0x07C0		; 0x07C0 is where BIOS loads bootloader
	mov ds, ax		; Start data segment at 0x07C0
	add ax, 512		; Move 512 bytes from 0x07C0 as our bootloader will occupy that space
	mov ss, ax		; Start stack segment at ax (i.e 0x07C0 + 512)
	mov sp, 4096		; Start stack pointer at 4096 (4k stack) (as our stack decreases)

	mov si, our_text	; Put our string position into SI register
	call print_string

	jmp $			; Keep jumping infinitely! ¯\_(ツ)_/¯
	our_text db 'Hello!', 0	; Our dear string

print_string:
	mov ah, 0x0E		; Tell BIOS to print character to TTY

repeat:
	lodsb			; Load a single byte of the string at SI register
	cmp al, 0
	je done
	int 0x10		; Call BIOS built-in 'print char' routine
	jmp repeat
done:
	ret

	times 510-($-$$) db 0   ; Fill remaining space with 0s
	dw 0xAA55		; Standard bootloader signature

