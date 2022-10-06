.model small
.stack
.data

    var1 DB ?
    result DB ?
    msg1 DB "Enter the first digit :" , '$'
    times DB " times ", '$'
    return DB " return " ,'$'
    var2 DB ?
    var3 DB ?

.code
main proc

    mov ax,@data
    mov ds,ax

    ;display the val1
    lea dx,msg1
    mov ah,09h
    int 21h

    ;read the user prompt
    mov ah,01h
    int 21h

    ;multiple the input // for example input 4 
    ;4 x 4 = 16
    mov var1,al
    sub al,30h
    mov bl,al
    mul bl

    mov bl,10
    div bl
    add al,30h
    add ah,30h
    mov var2,al
    mov var3,ah
    ;after multiple add 30 so = 34
    ;34hex in character is 4


    ;nextLine
    mov ah,02h
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h


    mov dl,var1
    mov ah,02h
    int 21h

    mov ah,09h
    lea dx,times
    int 21h

    mov dl,var1
    mov ah,02h
    int 21h

    lea dx,return
    mov ah,09h
    int 21h

    mov dl,var2
    mov ah,02h
    int 21h

    mov dl,var3
    mov ah,02h
    int 21h


    mov ah,04ch
    int 21h

main endp
     end main