;12. Se da un sir de dublucuvinte. Sa se calculeze si sa se salveze in sirul D toti octetii inferiori ai wordurilor inferioare 
;care au ultima cifra divizibila cu 5.


assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s dd 1234564Bh, 1A2B3C07h, 12233405h
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
	mov si, 0
	mov di, 0
	repeta:
		mov al, byte ptr s[si]
		cbw
		mov bl, 10
		idiv bl
		mov dl, ah
		mov al, dl
		cbw
		mov bl, 5
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