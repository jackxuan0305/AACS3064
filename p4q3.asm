.model
.stack
.data
	message1 db "In english: You like english and espresso, excellent!$"
	ans db 100 dup ("$")

.code
main proc

	mov ax,@data
	mov ds,ax

	;display message1
	mov ah, 09h
	lea dx, message1
	int 21h

	;new line
	mov dl, 10
	mov ah, 02h
	int 21h

	lea si, message1
	lea di, ans

	mov bl, 0
lop:	

	mov al, [si]
	mov [di], al

	cmp al, '$'
	je exit

	inc si
	inc di

	cmp al, ' '
	je space

	cmp bl, 0
	je compare

	jmp lop

compare:
	cmp al, 'e'
	je egg

	mov bl, 1
	jmp lop

egg:
	mov al, 67h
	mov [di], al
	inc di

	mov [di], al
	inc di
	mov bl, 1

	jmp lop

space:
	mov bl, 0
	jmp lop

exit:
	mov ah, 09h
	lea dx, ans
	int 21h

	mov ah, 4ch
	int 21h

main endp
	end main