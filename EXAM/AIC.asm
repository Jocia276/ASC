
assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s dw 118,34,56,27,38,28, 508, 218, 348, 908, 10008
ls equ($-s)/2
d dw ls dup(?)
baza dw 10
aux dw ?


data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov cx, ls
	mov si, 0
	mov di, 0
	repeta:
		mov ax, word ptr s[si]
		cwd
		mov bx, 10
		idiv bx
		cmp dx, 8
		JE adauga
		JNE next
		adauga:
			mov ax, word ptr s[si]
			mov d[di], ax
			add si, 2
			add di, 2
			jmp exit
		next:
			add si, 2
		exit:
	loop repeta
	
	
	mov aux, di
	mov di, 0
	repeta2:
		mov ax, d[di]
		mov cx, 0
		repeta3:
			cwd
			idiv baza
			push dx
			inc cx
			cmp ax, 0
			JNE repeta3
		afisare:
			pop dx
			add dl, '0'
			mov ah, 02h
			int 21h
		loop afisare
		
		mov dl, ' '
		mov ah, 02h
		int 21h
		
		add di, 2
		cmp di, aux
		JNE repeta2



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start