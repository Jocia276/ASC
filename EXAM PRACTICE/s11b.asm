;11. Se da un sir de dublucuvinte. Sa se calculeze si sa se salveze in sirul D toti octetii superiori ai wordurilor superioare 
;care au ultima cifra egala cu 8.


assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s dd 08051234h, 08245165h, 43775588h
ls equ($-s)/4
d db ls dup(?)

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov cx, ls
	mov si, 3
	mov di, 0
	repeta:
		mov al, byte ptr s[si]
		cbw
		mov bl, 10
		idiv bl
		cmp ah, 8
		JE adauga
		JNE next
		adauga:
			mov al, byte ptr s[si]
			mov byte ptr d[di], al
			add si, 4
			add di, 1
			jmp exit
		next:
			add si, 4
		exit:
	loop repeta
	



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start