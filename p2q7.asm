.model
.stack 100
.data
	message1 db "Dividend : $"
	message2 db "Divisor : $"
	message3 db "Quotient : $"
	message4 db "Remainder : $"
	var1 db ?
	var2 db ?
	quotient db ?
	remainder db ?

.code
main proc
	mov ax, @data
	mov ds, ax

	;display message1
	mov ah, 09h
	lea dx, message1
	int 21h

	;user input
	mov ah, 01h
	int 21h       

	;store input to var1
	mov var1, al
	sub al, 30h

	;new line
    	mov dl,10
    	mov ah,02h
    	int 21h

	;display message2
	mov ah, 09h
	lea dx, message2
	int 21h

	;another user input
	mov ah, 01h
	int 21h

	;store input to var2
	mov var2, al
	sub al, 30h

	;new line
    	mov dl,10
    	mov ah,02h
    	int 21h

	;display message3
	mov ah, 09h
	lea dx, message3
	int 21h

	;process
	and ax, 0ffh        ;change ax to al
	mov al, var1
	mov bl, var2
	div bl
	mov quotient, al
	mov remainder, ah

	;display quotient
	mov dl, quotient
	add dl, 48
	mov ah, 02h
	int 21h

	;new line
    	mov dl,10
    	mov ah,02h
    	int 21h

	;display message4
	mov ah, 09h
	lea dx, message4
	int 21h

	;display remainder
	mov dl, remainder
	add dl, 48
	mov ah, 02h
	int 21h

	mov ah, 4ch
	int 21h

main endp
	end main