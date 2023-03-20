;6.  Se da un sir S de dublucuvinte. 
;Sa se obtina sirul D format din octetii inferiori ai cuvintelor inferioare din elementele sirului de dublucuvinte, care sunt multiplii de 7. 
;Exemplu:
;s DD 12345607h, 1A2B3C15h, 13A33412h
;d DB 07h, 15h


assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s dd 12345607h, 1A2B3C15h, 13A33412h
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
	mov si, 0
	repeta:
		mov al, byte ptr s[si]
		cbw
		mov bl, 7
		idiv bl
		cmp ah, 0
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