.model
.stack 100
.data
	val1 DB 41h
	result DB ?
.code
main proc
	mov ax, @data
	mov ds, ax

	mov al, val1
	add al, 20h

	mov result, al

	mov ah, 02h
	mov dl, result
	int 21h

	mov ah, 4ch
	int 21h

main endp
	end main