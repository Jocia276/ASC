;9. Se da un sir de dublucuvinte. Sa se calculeze si sa se salveze in sirul D toti octetii inferiori ai wordurilor superioare 
;care au valoare para si negativa.


assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s dd 12FE5678h, 1AFC3C4Dh, 11223344h
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
	mov di, 0
	mov si, 2
	repeta:
		mov al, byte ptr s[si]
		cmp al, 0
		JGE next
		JL adauga
		adauga: 
			mov al, byte ptr s[si]
			cbw
			mov bl, 2
			idiv bl
			cmp ah, 0
			JE adauga2
			JNE next2
			adauga2:
				mov al, byte ptr s[si]
				mov byte ptr d[di],al
				add si, 4
				add di,1
				jmp exit
			next2:
				add si, 4
				jmp exit
		next:
			add si, 4
			jmp exit
		exit:
	loop repeta


; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start