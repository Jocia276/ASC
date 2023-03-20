;3. Sa dau doua sirurui de octeti A si B. Sa se construiasca sirul D1 care sa contina doar numerele impare si pozitive din A si B 
;si sirul D2 care sa contina numerele negative divizibile cu 5 din sirurile A si B. Sa se afiseze pe ecran sirurile rezultat.
;Exemplu:
;A: 2, 1, -3, 3, -5, 2, 6
;B: 4, 5, 7, -15, 2, 1
;D1: 1, 3, 5, 7, 1
;D2: -5, -15

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

a db 2, 1, -3, 3, -5, 2, 6
la equ($-a)
b db 4, 5, 7, -15, 2, 1
lb equ($-b)
d1 db la+lb dup(?)
d2 db la+lb dup(?)
aux dw ?
baza dw 10
newline db 10,13,'$'

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov cx, la
	mov si, 0
	mov di, 0
	mov bp, 0
	repeta1:
		mov al, byte ptr a[si]
		cmp al, 0
		JGE adauga
		JL next
		adauga: 
			mov al, byte ptr a[si]
			cbw
			mov bl, 2
			idiv bl
			cmp ah, 0
			JNE adauga2
			JE next2
			adauga2:
				mov al, byte ptr a[si]
				mov byte ptr d1[di], al
				inc si
				inc di
				JMP exit
			next2:
				inc si
				jmp exit
		next:
			mov al, byte ptr a[si]
			cbw
			mov bl,5
			idiv bl
			cmp ah, 0
			JE adauga3
			JNE next3
			adauga3:
				mov al, byte ptr a[si]
				mov byte ptr d2[bp], al
				inc si
				inc bp
				jmp exit
			next3:
				inc si
				jmp exit
		exit:
	loop repeta1
			
	mov cx, lb
	mov si, 0
	repeta2:
		mov al, byte ptr b[si]
		cmp al, 0
		JGE adaugaa
		JL nextt
		adaugaa: 
			mov al, byte ptr b[si]
			cbw
			mov bl, 2
			idiv bl
			cmp ah, 0
			JNE adaugaa2
			JE nextt2
			adaugaa2:
				mov al, byte ptr b[si]
				mov byte ptr d1[di], al
				inc si
				inc di
				jmp exit1
			nextt2:
				inc si
				jmp exit1
		nextt:
			mov al, byte ptr b[si]
			cbw
			mov bl,5
			idiv bl
			cmp ah, 0
			JE adaugaa3
			JNE nextt3
			adaugaa3:
				mov al, byte ptr b[si]
				mov byte ptr d2[bp], al
				inc si
				inc bp
				jmp exit1
			nextt3:
				inc si
				jmp exit1
		exit1:
	loop repeta2
	
	
	mov aux, di
	mov di, 0
	afis:
		mov al, d1[di]
		mov ah, 0
		mov cx, 0
		afis1:
			cwd
			idiv baza
			push dx
			inc cx
			cmp ax, 0
			JNE afis1
		afis2:
			pop dx
			add dl, '0'
			mov ah, 02h
			int 21h
		loop afis2
		
		mov dl, ' '
		mov ah, 02h
		int 21h
		
		add di, 1
		cmp di, aux
		JNE afis
		
		mov ah, 09h
		mov dx, offset newline
		int 21h
		
	mov aux, bp
	mov bp, 0
	afiss:
		mov al, d2[bp]
		mov ah, 0
		mov cx, 0
		afiss1:
			cwd
			idiv baza
			push dx
			inc cx
			cmp ax, 0
			JNE afiss1
		afiss2:
			pop dx
			add dl, '0'
			mov ah, 02h
			int 21h
		loop afiss2
		
		mov dl, ' '
		mov ah, 02h
		int 21h
		
		add bp, 1
		cmp bp, aux
		JNE afiss


; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start