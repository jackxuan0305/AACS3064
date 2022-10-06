.model
.stack 100
.data

	message1 db "1. x AND y $"
	message2 db "2. x OR y $"
	message3 db "3. NOT x $"
	message4 db "4. x XOR y $"
	message5 db "5. Exit program $"
	message6 db "Please enter your choice: $"
	message7 db "Invalid choice. Please enter a number between 1 and 5 $"
	message8 db "Please enter x: $"
	message9 db "Please enter y: $"
	truemessage db "true $"
	falsemessage db "false $"

	selection db 0
	x db 0
	y db 0

.code
main proc
	mov ax, @data
	mov ds, ax

	;display message1
	mov ah, 09h
	lea dx, message1
	int 21h

	;new line
	mov dl, 10
	mov ah, 02h
	int 21h
    mov dl, 13
	int 21h

	;display message2
	mov ah, 09h
	lea dx, message2
	int 21h

	;new line
	mov dl, 10
	mov ah, 02h
	int 21h
    mov dl, 13
	int 21h

	;display message3
	mov ah, 09h
	lea dx, message3
	int 21h

	;new line
	mov dl, 10
	mov ah, 02h
	int 21h
    mov dl, 13
	int 21h

	;display message4
	mov ah, 09h
	lea dx, message4
	int 21h

	;new line
	mov dl, 10
	mov ah, 02h
	int 21h
    mov dl, 13
	int 21h

	;display message5
	mov ah, 09h
	lea dx, message5
	int 21h

	;new line
	mov dl, 10
	mov ah, 02h
	int 21h
    mov dl, 13
	int 21h

	;display message6
	mov ah, 09h
	lea dx, message6
	int 21h

	;user input
	mov ah, 01h
	int 21h
	mov selection, al

	;new line
	mov dl, 10
	mov ah, 02h
	int 21h
	mov dl, 13
	int 21h

	;new line
	mov dl, 10
	mov ah, 02h
	int 21h
    mov dl, 13
	int 21h

	;display message8
	mov ah, 09h
	lea dx, message8
	int 21h

	;user input
	mov ah, 01h
	int 21h
	mov x, al

	;new line
	mov dl, 10
	mov ah, 02h
	int 21h
	mov dl, 13
	int 21h

	;display message9
	mov ah, 09h
	lea dx, message9
	int 21h

	;user input
	mov ah, 01h
	int 21h
	mov y, al

	;new line
	mov dl, 10
	mov ah, 02h
	int 21h
	mov dl, 13
	int 21h

	check:
		mov al, x
		mov bl, y
		mov dl, selection

		cmp dl, 1
		je xandy

		cmp dl, 2
		je xory

		cmp dl, 3
		je notx

		cmp dl, 4
		je xxory

		cmp dl, 5
		je exit

	xandy:
		cmp al, bl
		je true
		jmp false

	xory:
		cmp al, bl
		jne true
		jmp false

	notx:
		cmp al, 0
		jne true
		jmp false

	xxory:
		cmp al, bl
		jne true
		jmp false

	true:
		mov ah, 09h
		lea dx, truemessage
		int 21h
		jmp exit

	false:
		mov ah, 09h
		lea dx, falsemessage
		int 21h
		jmp exit

exit:
	mov ah, 4ch
	int 21h

main endp
	end main