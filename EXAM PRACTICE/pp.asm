assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

x db 9
y dw 2
z dw 3
v dw 4
aux dd ?

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code
	; y*2 + z/x - 8/v
	; y*2 -> word * const
	mov ax,2
	mov dx, 0
	mul y
	; ax =4
	; salvare ax in cx
	mov cx, ax 
	; cx = 4
	; x/z -> byte / word
	mov al, x
	mov ah, 0
	div z 
	; ax = 3
	mov word ptr aux[0], ax
	mov word ptr aux[2], dx
	
	;aux = 3
	; 8/v -> const / doubleword
	
	mov ax, 8
	mov dx, 0
	div v
	
	; ax = catul = 2
	; aux = 3
	; cx = 4 
	
	; y*2 + z/x - 8/v
	; word + doubleword - word
	
	; cx -ax -> y*2 - 8/v
	sub cx, ax ; cx = 2
	
	; cx + aux
	; word + doubleword
	
	mov bx, 0
	add cx, word ptr aux[0]
	adc bx, word ptr aux[2]
	
	; rezultatul este in bx:cx
	

; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start
;C:\Users\casia\OneDrive\Desktop\ASC