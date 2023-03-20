;8. Se da un sir de octeti S. Sa se construiasca un sir D1 care sa contina toate numerele pozitive si 
;un sir D2 care sa contina toate numerele negative din S. 
;Exemplu:
;S: 1, 3, -2, -5, 3, -8, 5, 0
;D1: 1, 3, 3, 5, 0
;D2: -2, -5, -8

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s db 1,3,-2,-5,3,-8,5,0
ls equ($-s)
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
		mov dl, al
		mov bl, 0
		cmp al, bl
		JGE adaugad1
		JL adaugad2
		adaugad1:
			mov byte ptr d1[di], dl
			add di, 1
			add si,1
			jmp exit
		adaugad2:
			mov byte ptr d2[bp], dl
			add bp, 1
			add si,1
		exit:
	loop repeta


; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start