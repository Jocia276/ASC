;15. Se da un sir de dublucuvinte. Sa se salveze in sirul D in ordine inversa toate cuvintele din sirul initial.


assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s dd 12345678h, 1A2B3C4Dh, 11223344h
ls equ($-s)/4
d dw ls*2 dup(?)

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov cx, ls*2
	mov si, 10
	mov di, 0
	repeta: 
		mov ax, word ptr s[si]
		mov word ptr d[di], ax
		sub si, 2
		add di, 2
	loop repeta

; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start