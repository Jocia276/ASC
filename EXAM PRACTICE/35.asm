;35. Se da un sir de octeti S in segmentul de date. Sa se afiseze pe ecran suma lor in baza 2.
;Exemplu:
;S: 1, 2, 3, 4
;rezultat: 1010


assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s db 1,2,3,4
ls equ($-s)
baza dw 2
suma db ?

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
		add al, bl
		mov byte ptr s[si+1], al
		add si, 1
	loop repeta1
	
	mov suma, al
	
	; afisare suma
	
	mov cx, 0; aici vom numara cifrele din numar
	mov al, suma
	mov ah, 0
	repeta:
		cwd
		idiv baza ; ax -cat, dx-rest
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