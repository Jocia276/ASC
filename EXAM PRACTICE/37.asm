;37. Sa se citeasca un sir de caractere si sa se afiseze cate spatii sunt in sir.
;Exemplu:
;S: "ana are mere"
;rezultat: 2


assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s db 20, ?, 20 dup(?)
ls dw ?
rez db ?
baza dw 10
sep db ' '
newline db 10,13,'$'

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	;citire sir de la tastatura
mov ah, 0ah
mov dx, offset s
int 21h

;identificare lungime efectiva sir citit (caractere introduse)
mov bl, byte ptr s[1]
mov bh, 0
mov ls, bx ; lungimea efectiva
add ls, 2 ; pentru a se prelucra si ultimul separator s

mov ah,09h
	mov dx,offset newline
	int 21h

	mov rez, 0
	mov cx, ls
	mov si, 0
	repeta1:
		mov al, byte ptr s[si]
		cmp al, sep
		JE aduna
		JNE next
		aduna:
			inc rez
			inc si
			jmp exit
		next:
			inc si
		exit:
	loop repeta1
	
	mov cx, 0
	mov al, rez
	mov ah, 0
	repeta:
		cwd
		idiv baza
		push dx
		inc cx
		cmp ax, 0
		JNE repeta
	repeta2:
		pop dx
		add dl, '0'
		mov ah, 02h
		int 21h


; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start