;12. Se dau 2 siruri de octeti A si B. Sa se construiasca sirul R care sa contina doar elementele pare si negative 
;din cele 2 siruri. 
;Exemplu:
;A: 2, 1, 3, -3, -4, 2, -6
;B: 4, 5, -5, 7, -6, -2, 1
;R: -4, -6, -6, -2

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

a db 2,1,3,-3,-4,2,-6
la equ($-a)
b db 4,5,-5,7,-6,-2,1
lb equ($-b)
r db la+lb dup(?)

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
	repeta:
		mov al, byte ptr a[si]
		cmp al, 0
		JGE next
		JL adauga
		adauga:
			mov al, byte ptr a[si]
			cbw
			mov bl, 2
			idiv bl
			cmp ah, 0
			JE adauga1
			JNE next1
			adauga1:
				mov al, byte ptr a[si]
				mov byte ptr r[di], al
				add si, 1
				add di, 1
				jmp exit
			next1:
				add si,1
				jmp exit
		next:
			add si,1
			jmp exit
		exit:
	loop repeta
	
	mov cx, lb
	mov bp, 0
	repeta2:
		mov al, byte ptr b[bp]
		cmp al, 0
		JGE next12
		JL adauga12
		adauga12:
			mov al, byte ptr b[bp]
			cbw
			mov bl, 2
			idiv bl
			cmp ah, 0
			JE adauga111
			JNE next111
			adauga111:
				mov al, byte ptr b[bp]
				mov byte ptr r[di], al
				add bp, 1
				add di, 1
				jmp exit1
			next111:
				add bp,1
				jmp exit1
		next12:
			add bp,1
			jmp exit1
		exit1:
	loop repeta2
	


; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start