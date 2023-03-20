;1. Se da un sir de octeti S de lungime l. Sa se construiasca sirul D de lungime l-1 astfel incat elementele din D sa reprezinte produsul dintre fiecare 2 elemente consecutive S(i) si S(i+1) din S. 
;Exemplu:
;S: 1, 2, 3, 4
;D: 2, 6, 12

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s db 1,2,3,4
ls equ $-s
r db ls-1 dup(?)


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
		mov bl, byte ptr s[si+1]
		mul bl
		mov dl, al
		mov byte ptr r[di], dl
		add si, 1
		add di,1
	loop repeta



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start