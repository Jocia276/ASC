; v/x + 2*y - 5/z

assume cs:code,ds:data
data segment
;aici vom declara datele
;zona de declaratii variabile

x db 2
y dw 3
z dw 5
v dd 8

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie cod

	; v/x -> doubleword / byte
	
		; transfer double word in dx:ax
		mov ax, word ptr v[0]
		mov dx, word ptr v[2]
	
		; transfer byte in bx
		mov bl, x
		mov bh, 0

		; realizez impartirea
		div bx
	
		; ax = 4
		; salvez ax in cx
	
		mov cx,ax  ; cx = v/x = 4
	
	; 2*y -> const * word
		mov ax, 2
		mul y ; dx:ax = 6
	
		;salvez ax in bx
		mov bx, ax ; bx = 2*y = 6
		mov cx, dx
	
	; 5/z -> const / word
	
		mov ax, 5
		mov dx, 0
		div z ; ax = 1
	
	; v/x + 2* y - 5/z
	; cx + bx - ax
	; word + word - word
	
	; cx + bx
	add bx, cx
	; bx = v/x + 2*y = 10 = 000Ah
	
	; bx - ax
	sub bx, ax
	; bx = 9
	
	; salvez pe bx in ax
	mov ax, bx

; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start