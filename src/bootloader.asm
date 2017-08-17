	BITS 16			; Start in real mode (only supports 16-bit)
bootloader:
	jmp bootloader

	times 510-($-$$) db 0   ; Fill remaining space with 0s
	dw 0xAA55		; Standard bootloader signature

