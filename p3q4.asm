.model
.stack 100
.data
    byteList db 2, 4, 6, 8, 10, 12
    message1 db "Sum: $"
.code
main proc
	mov ax, @data
	mov ds, ax

    mov al, 0    ;initialize al = 0
    mov cx, 6
    mov bx, 0

    ;add all the elements of the array
    startLoop:
        add al, byteList[bx]
        inc bx
        loop startLoop

    ;display message1
	mov ah, 09h
	lea dx, message1
	int 21h

    ;display sum
    mov ah, 0     ;ax: ah = 00, al = sum
    mov dh, 10
    div dh
    mov ch, ah    ;store second digit of result in ch
    mov cl, al    ;store first digit of result in cl

    ;display the 1st digit of result
    mov ah, 02h
    mov dl, cl
    add dl, 30h   ;add 30h to get the ASCII value
    int 21h

    ;display the 2nd digit of result
    mov ah, 02h
    mov dl, ch
    add dl, 30h   ;add 30h to get the ASCII value
    int 21h

	mov ah, 4ch
	int 21h

main endp
	end main