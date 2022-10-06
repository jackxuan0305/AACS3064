.model
.stack 100
.data

	message1 db "Enter a word: $"
	message2 db "The second character is $"
	ans db 100 dup('$')

.code
main proc
	mov ax, @data
	mov ds, ax

	;display message
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

	mov si, 1

	mov ah, 02h
	mov dl, [ans + si]
	int 21h
		
	mov ah, 4ch
	int 21h

main endp
	end main