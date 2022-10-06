.model
.stack 100
.data

	message1 db "Green : 'G' $"
	message2 db "Red : 'R' $"
	message3 db "Blue : 'B' $"
	message4 db "Please enter G, B, or R for font's color : $"
	message5 db "You choose green color ! $"
	message6 db "You choose red color ! $"
	message7 db "You choose blue color ! $"
	ans db 100 dup('$')

.code
main proc
	mov ax, @data
	mov ds, ax

	;display message1
	mov ah, 09h
	lea dx, message1
	int 21h

	;new line
	mov dl,10
	mov ah,02h
	int 21h

	;display message2
	mov ah, 09h
	lea dx, message2
	int 21h

	;new line
	mov dl,10
	mov ah,02h
	int 21h

	;display message3
	mov ah, 09h
	lea dx, message3
	int 21h

	;new line
	mov dl,10
	mov ah,02h
	int 21h

	;display message4
	mov ah, 09h
	lea dx, message4
	int 21h

	;user input
	mov ah, 01h
	int 21h

	check:
		cmp al, 'G'
		je green

		cmp al, 'R'
		je red

		cmp al, 'B'
		je blue

	green:
		;new line
		mov dl,10
		mov ah,02h
		int 21h

		;display message5
		mov ah, 09h
		lea dx, message5
		int 21h
		jmp exit

	red
		;new line
		mov dl,10
		mov ah,02h
		int 21h
	
		;display message6
		mov ah, 09h
		lea dx, message6
		int 21h
		jmp exit

	blue:
		;new line
		mov dl,10
		mov ah,02h
		int 21h
	
		;display message7
		mov ah, 09h
		lea dx, message7
		int 21h
		jmp exit
		
exit:
	mov ah, 4ch
	int 21h

main endp
	end main