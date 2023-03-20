;11.Se dau 2 siruri de octeti A si B. Sa se construiasca sirul R care sa contina 
;doar elementele impare si pozitive din cele 2 siruri. 
;Exemplu:
;A: 2, 1, 3, -3
;B: 4, 5, -5, 7
;R: 1, 3, 5, 7


assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

a db 2,1,3,-3
la equ($-a)
b db 4,5,-5,7
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
		mov bl, 0
		cmp al, bl
		JGE adauga11
		JL exit11
		adauga11:
			mov al, byte ptr a[si]
			cbw
			mov bl, 2
			idiv bl
			cmp ah, 0
			JNE adauga21
			JE exit21
			adauga21:
				mov al, byte ptr a[si]
				mov byte ptr r[di], al
				add si, 1
				add di, 1
				jmp exitt
			exit21:
				add si,1
				jmp exitt
		exit11:
			add si, 1
		exitt:
	loop repeta
	
	mov cx, lb
	mov si, 0
	repeta2:
		mov al, byte ptr b[si]
		mov bl, 0
		cmp al, bl
		JGE adauga1
		JL exit1
		adauga1:
			mov al, byte ptr b[si]
			cbw
			mov bl, 2
			idiv bl
			cmp ah, 0
			JNE adauga2
			JE exit2
			adauga2:
				mov al, byte ptr b[si]
				mov byte ptr r[di], al
				add si, 1
				add di, 1
				jmp exit
			exit2:
				add si,1
				jmp exit
		exit1:
			add si, 1
		exit:
	loop repeta2


; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start