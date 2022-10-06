.model
.stack
.data
	msg db "Do you want to continue printing (y/n)? $"
	msg1 db "Please enter y or n only $"
	

.code
main proc

	mov ax,@data
	mov ds,ax

	mov bl, 41h
	mov ah, 02h
	mov dl, bl
	int 21h

	
lop:	
	
	;new line
	mov dl, 10
	mov ah, 02h
	int 21h
	
	mov ah, 09h
	lea dx, msg
	int 21h

	mov ah, 01h
	int 21h
	
	cmp al, 'y'
	je yes

	cmp al,'n'
	je no

re:	
	;new line
	mov dl, 10
	mov ah, 02h
	int 21h
	mov ah,09h
	lea dx, msg1
	int 21h
	jmp lop
	


yes:	;new line
	mov dl, 10
	mov ah, 02h
	int 21h

	inc bl

	mov ah, 02h
	mov dl, bl
	int 21h

	

	jmp lop

no:
	mov ah,4ch
	int 21h

main endp
	end main