	BITS 16			; Start in real mode (only supports 16-bit)
bootloader:
	mov ax, 0x07C0		; 0x07C0 is where BIOS loads bootloader
	add ax, 288
	mov ss, ax
	mov sp, 4096

	mov ax, 0x07C0
	mov ds, ax

	mov si, our_text	; Put our string position into SI register

	mov ah, 0x0E		; Tell BIOS to print character to TTY
	lodsb			; Load a single byte of the string at SI register
	int 0x10		; Call BIOS built-in 'print char' routine

	our_text db 'H', 0	; Our dear string

	times 510-($-$$) db 0   ; Fill remaining space with 0s
	dw 0xAA55		; Standard bootloader signature

