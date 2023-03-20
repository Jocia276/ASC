; Se citeste de la tastatura un numar. Sa se afiseze acest numar incrementat cu 1

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s db 8
zecew dw 10
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
	mov s,al
	
	mov ah,09h
	mov dx,offset newline
	int 21h
	
	mov al, s
	sub al, '0'
	mov bl,1
	add al, bl

mov s, al

mov cx, 0; aici vom numara cifrele din numar
	mov al, s
	mov ah, 0
	repeta:
		cwd
		idiv zecew ; ax -cat, dx-rest
		push dx
		inc cx
		cmp ax, 0
		JNE repeta  ; conditia de oprire, cand ajunge catul la valoarea 0
		; salvarea cifrelor pe stiva 4, 3, 2, 1
		
		; scoatere cifre de pe stiva
		;conversia cifrelor la caracter
		
		repetafis:
			pop dx
			add dl, '0' 
			mov ah, 02h
			int 21h 		
		loop repetafis ;
			;sub cx, 1
			;cmp cx, 0
			;jne repetafis



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start