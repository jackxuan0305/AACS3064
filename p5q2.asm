.model
.stack 100
.data

	message1 db "Enter secret word: $"
	message2 db "Enter encryption key (1-9): $"
	message3 db "The encrypted word is $"
	ans db 100 dup('$')

.code
main proc
	mov ax, @data
	mov ds, ax

	;display message1
	mov ah, 09h
	lea dx, message1
	int 21h


	lea si, ans
	input:
		
		;user input
		mov ah, 01h
		int 21h    

		cmp al, 0Dh
		je exit

		mov [si], al
		inc si

		jmp input

exit:

        ;display message2
	mov ah, 09h
	lea dx, message2
	int 21h

	;user input
	mov ah, 01h
	int 21h
	sub al, 30h

	lea si, ans

	encrypt:
		mov bl, [si]

		cmp bl, '$'
		je exit2

		add [si], al
		inc si
		jmp encrypt

exit2:
	;new line
	mov dl,10
	mov ah,02h
	int 21h

        ;display message3
	mov ah, 09h
	lea dx, message3
	int 21h

	mov ah, 09h
	lea dx, ans
	int 21h
		
	mov ah, 4ch
	int 21h

main endp
	end main