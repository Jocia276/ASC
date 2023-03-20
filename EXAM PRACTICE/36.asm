;36. Se da un sir de octeti S in segmentul de date. Sa se afiseze pe ecran diferenta lor.
;Exemplu:
;S: 12, 3, 4, 6
;rezultat: -1

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s db 12,3,4,6
ls equ($-s)
dif db ?
baza dw 10

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov cx, ls-1
	mov si, 0
	repeta1:
		mov al, byte ptr s[si]
		mov bl, byte ptr s[si+1]
		sub al, bl
		mov byte ptr s[si+1], al
		add si, 1
	loop repeta1
	mov dif, al
	
	;afisare diferenta
	
	mov cx, 0
	mov al, dif
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