.model
.stack 100
.data

    data1 db "MILK $"
    data2 db 4 dup ('*'), "$"
    before db "Initial content $"
    after db "After replacement $"
    reserved db "After reversed $"
    lowerCase db "After changed case $"
    message1 db "data1: $"
    message2 db "data2: $"

.code
main proc
	mov ax, @data
	mov ds, ax

    ;display initial content
	mov ah, 09h
	lea dx, before
	int 21h

    ;new line
    mov dl,10
    mov ah,02h
    int 21h

    ;display message1
	mov ah, 09h
	lea dx, message1
	int 21h

    ;display data 1
	mov ah, 09h
	lea dx, data1
	int 21h

    ;new line
    mov dl,10
    mov ah,02h
    int 21h

    ;display message2
	mov ah, 09h
	lea dx, message2
	int 21h

    ;display data 2
	mov ah, 09h
	lea dx, data2
	int 21h

    ;new line
    mov dl,10
    mov ah,02h
    int 21h

    ;new line
    mov dl,10
    mov ah,02h
    int 21h

    ;display after
	mov ah, 09h
	lea dx, after
	int 21h

    ;new line
    mov dl,10
    mov ah,02h
    int 21h

    ;display message1
	mov ah, 09h
	lea dx, message1
	int 21h

    ;display data 1
	mov ah, 09h
	lea dx, data1
	int 21h

    ;new line
    mov dl,10
    mov ah,02h
    int 21h

    ;display message2
	mov ah, 09h
	lea dx, message2
	int 21h

    ;copy data 1 to data 2 using looping
    mov cx, 4
    mov bx, 0
    startLoop:
        mov al, data1[bx]
        mov data2[bx], al
        inc bx
        loop startLoop

    ;this can open changed the first character
    ;mov al, data1
    ;mov data2, al

    ;display data 2 after changed
	mov ah, 09h
	lea dx, data2
	int 21h

    ;new line
    mov dl,10
    mov ah,02h
    int 21h

    ;new line
    mov dl,10
    mov ah,02h
    int 21h

    ;display reserved
	mov ah, 09h
	lea dx, reserved
	int 21h

    ;new line
    mov dl,10
    mov ah,02h
    int 21h

    ;display message1
	mov ah, 09h
	lea dx, message1
	int 21h

    ;display data 1
	mov ah, 09h
	lea dx, data1
	int 21h

    ;new line
    mov dl,10
    mov ah,02h
    int 21h

    ;display message2
	mov ah, 09h
	lea dx, message2
	int 21h

    ;reverse by using looping
    mov cx, 4 ;run loop 4 times
    mov si, 3 ;start from 3rd character
    mov di, 0 ;start from first character
    reserveLoop:
        mov al, [data1 + si]
        mov [data2 + di], al
        dec si
        inc di
        loop reserveLoop

    ;display data 2 after changed
	mov ah, 09h
	lea dx, data2
	int 21h

    ;new line
    mov dl,10
    mov ah,02h
    int 21h

    ;new line
    mov dl,10
    mov ah,02h
    int 21h

    ;display lowercase
	mov ah, 09h
	lea dx, lowerCase
	int 21h

    ;new line
    mov dl,10
    mov ah,02h
    int 21h

    ;display message1
	mov ah, 09h
	lea dx, message1
	int 21h

    ;display data 1
	mov ah, 09h
	lea dx, data1
	int 21h

    ;new line
    mov dl,10
    mov ah,02h
    int 21h

    ;display message2
	mov ah, 09h
	lea dx, message2
	int 21h

    ;copy back data 1 to data 2 and make it lowercase by using looping
    mov cx, 4
    mov bx, 0
    backLoop:
        mov al, data1[bx]
        mov data2[bx], al
        add data2[bx], 20h ;add 20h to make it lowercase
        inc bx
        loop backLoop

    ;display data 2 after changed
    mov ah, 09h
    lea dx, data2
    int 21h

	mov ah, 4ch
	int 21h

main endp
	end main