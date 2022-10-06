.model
.stack 100
.data
    byteList db 3, 4, 5, 6
    message1 db ", $"
    result db ?

.code
main proc
	mov ax, @data
	mov ds, ax

    mov al, 31h ;al = 1

    mov ah, 02h
    mov dl, al
    int 21h

    ;display message1
    mov ah, 09h
    lea dx, message1
    int 21h

    mov ah, 02h
    mov dl, al
    int 21h

    ;display message1
    mov ah, 09h
    lea dx, message1
    int 21h

    mov cx, 4
    mov bx, 0
    mov si, 1

    nextFourLoop:
        ;do n = (n - 1) + (n - 2)

        mov bl, byteList[bx]
        ;;display result
        mov ah, 02h
        mov dl, bl
	add dl, 30h
        int 21h

        mov al,byteList[si]
        ;;display result
        mov ah, 02h
        mov dl, al
	add dl, 30h
        int 21h

        ;sub bl, 01h
        ;sub al, 02h
        ;add al, bl


        ;;display result
        ;mov ah, 02h
        ;mov dl, bl
	;add dl, 30h
        ;int 21h

        ;display message1
        mov ah, 09h
        lea dx, message1
        int 21h

        inc bx
	inc si
        loop nextFourLoop

	mov ah, 4ch
	int 21h

main endp
	end main