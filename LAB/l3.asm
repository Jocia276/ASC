;6. Se da un sir de octeti S. Sa se obtina sirul D1 ce contine toate numerele pare din S si sirul D2 ce contine toate numerele impare din S. 
;Exemplu:
;S: 1, 5, 3, 8, 2, 9
;D1: 8, 2
;D2: 1, 5, 3, 9

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s db 1,5,3,8,2,9
ls equ $-s
d1 db ls dup(?)
d2 db ls dup(?)

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
	mov bp, 0
	repeta:
		mov al, byte ptr s[si]
		cbw
		mov dl, al
		mov bl, 2
		idiv bl
		CMP ah, 0
		JE pare
		JNE impare
		pare:
			mov byte ptr d1[di], dl
			add di, 1
			add si, 1
			jmp endif1
		impare:
			mov byte ptr d2[bp], dl
			add bp, 1
			add si, 1
		endif1:
	loop repeta



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start