; Sa se citeasca de la tastatura un sir de nr. Sa se afiseze pe ecran suma lor in baza 2

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s db 3,2,4
ls equ($-s)
d db ?
baza dw 2

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov cx, ls
	mov si, 0
	repeta1:
		mov al, byte ptr s[si]
		mov bl, byte ptr s[si+1]
		add al, bl
		mov byte ptr s[si+1], al
	loop repeta1
	mov d, al
	
	mov cx, 0
	mov al, d
	mov ah, 0
	
	
	repeta:
		cwd
		idiv baza
		push dx
		inc cx
		cmp ax, 0
		JNE repeta
		
	repetaafis:
		pop dx
		add dl, '0'
		mov ah, 02h
		int 21h
	loop repetaafis
		



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start