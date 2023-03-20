;5.  Se da un sir de octeti S de lungime l. Sa se construiasca sirul D de lungime l-1 astfel incat elementele din D 
;sa reprezinte diferenta dintre fiecare 2 elemente consecutive din S. 
;Exemplu:
;S: 1, 2, 4, 6, 10, 20, 25
;D: 1, 2, 2, 4, 10, 5



assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s db 1,2,4,6,10,20,25
ls equ($-s)
d db ls-1 dup(?)

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov cx, ls-1
	mov si, 1
	mov di, 0
	repeta:
		mov al, byte ptr s[si]
		mov bl, byte ptr s[si-1]
		sub al, bl
		mov byte ptr d[di], al
		add si, 1
		add di, 1
	loop repeta



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start