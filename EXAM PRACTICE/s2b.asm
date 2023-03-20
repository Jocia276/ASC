;2. Se da un sir de dublucuvinte. Sa se obtina sirul format din octetii superiori ai 
;cuvitelor superioare din elementele sirului de dublucuvinte care sunt divizibili cu 3.
;Exemplu:
;Se da sirul de dublucuvinte: 
;s DD 12345678h, 1A2B3C4Dh, FE98DC76h
;Sa se obtina sirul 
;d DB 12h.

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s dd 12345678h, 1A2B3C4Dh, 1A98DC76h
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
		mov bl, 3
		idiv bl
		cmp ah, 0
		JE adauga
		JNE next
		adauga:
			mov al, byte ptr s[si]
			mov byte ptr d[di], al
			add si, 4
			add di,1
			jmp exit
		next:
			add si,4
		exit:
	loop repeta
		



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start
