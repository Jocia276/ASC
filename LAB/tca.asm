; Se citeste de la tastatura o litera L. Se da un sir de caractere in data segment.
; Sa se inlocuiasca fiecare aparatie a lui L in sirul din data segment cu litera X. 
; Sa se afiseze acest sir nou rezultat pe ecran.


assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

aux dw ?
lit db ?
s db 'L', 'a', 'b', 'L', 'L', 'c', 'a'
ls equ $-s 
d db ls dup(?) ; d = 'XabXXc'
newline db 10, 13, '$'
data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov ah,01h    ;initializare AH cu codul functiei
	int 21h        ;apel rutina
	mov lit,al
	
	mov ah,09h
	mov dx,offset newline
	int 21h
	
	mov cx, ls
	mov si, 0 ; pt s
	mov di, 0 ; pt d
	repeta:
		mov al, byte ptr s[si]
		mov dl, al
		cmp al, lit
		JE salveaza
		JNE next
		next:
			mov byte ptr d[di], dl
			add di, 1
			add si, 1
			jmp endd
		salveaza:
			mov dl, 'X'
			mov byte ptr d[di], dl
			add di, 1
			add si, 1
			jmp end2
	endd:
	end2:
	loop repeta
	
	; afisarea sirului d
	afisaresir:
		mov al, '$'
		mov byte ptr d[di], al
		mov ah, 09h
		mov dx, offset d
		int 21h
	
; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start