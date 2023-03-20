;Se da un sir de dublucuvinte. 
;Sa se calculeze si sa se salveze in sirul D toti octetii inferiori ai wordurilor superioare 
;care au valoare para si negativa.

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s dd 0000FA03h, 02FFFCFFh, 02020202h, 05505789h, 0000FEFEh 
ls equ($-s)/4
d db ls dup(?) ; d: FA, FC, FE

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov si, 1
	mov di, 0
	mov cx, ls
	repeta:
		mov al, byte ptr s[si]
		mov dl, al
		cbw
		mov bl, 2
	    idiv bl
		cmp ah, 0
		JE next
		JNE exit
		next:
			cmp dl, 0
			JGE exit2
			JL adauga
			adauga:
				mov byte ptr d[di], dl
				add di, 1
				add si, 4
				jmp endd
			exit2:
		exit:
		add si, 4
		endd:
	loop repeta
			



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start