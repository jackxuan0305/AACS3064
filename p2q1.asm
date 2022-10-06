.model
.stack 100
.data
	val1 DB 6
	val2 DB 3
	val3 DB 4
	result DB ?
.code
main proc
	mov ax, @data
	mov ds, ax

	mov al, val2
	add al, 5
	sub al, val1
	add al, val3

	add al, 30h
	mov result, al

	mov ah, 02h
	mov dl, result
	int 21h

	mov ah, 4ch
	int 21h

main endp
	end main