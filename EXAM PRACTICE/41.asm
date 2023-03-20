;41. Se da un sir de dublucuvinte. Sa se genereze sirul D care sa contina toti octetii superiori ai word-urilor inferioare care au valoare para 
;si divizibila cu 3.
;Exemplu:
;S: 12344878h, ABCD42ABh, C5F3B1E5h 
;D: 48h, 42h



assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s dd 12344878h, 1BCD42ABh, 55F3B1E5h
ls equ($-s)/4
d db ls dup(?)
aux2 dw ?
baza dw 2
sase dw 16


data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code


	mov cx, ls
	mov si, 1
	mov di, 0
	repeta:
		mov al, byte ptr s[si]
		cbw
		mov bx, 2
		idiv bx
		cmp ah, 0
		JE adauga
		JNE next
		next:
			add si,4
			jmp exit
		adauga:
			mov al, byte ptr s[si]
			cbw
			mov bx, 3
			idiv bx
			cmp ah, 0
			JE adauga2
			JNE next
			adauga2:
				mov al, byte ptr s[si]
				mov byte ptr d[di], al
				inc di
				add si,4
		exit:
	loop repeta
	


; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start