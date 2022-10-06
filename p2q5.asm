.model
.stack 100
.data
	message1 db "Please enter a digit: $"
	message2 db " times $"
	message3 db " return $"
	result db ?
	var1 db ?

.code
main proc
	mov ax, @data
	mov ds, ax

	;display message
	mov ah, 09h
	lea dx, message1
	int 21h

	;user input
	mov ah, 01h
	int 21h       

	;store input to var1
	mov var1, al
	sub al, 30h

	;store result to variable result
	mov bl, al
	mul bl
	add al, 30h
	mov result, al

	;new line
	mov ah, 02h
	mov dl, 0dh
	int 21h
	mov dl, 0ah
	int 21h

	;display var1
	mov ah, 02h
	mov dl, var1
	int 21h

	mov ah, 09h
	lea dx, message2
	int 21h

	;display var1
	mov ah, 02h
	mov dl, var1
	int 21h

	mov ah, 09h
	lea dx, message3
	int 21h

	mov ah, 02h
	mov dl, result
	int 21h

	mov ah, 4ch
	int 21h

main endp
	end main