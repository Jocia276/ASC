;4. Se da un sir A de dublucuvinte. Construiti doua siruri de octeti  
;- B1: contine ca elemente partea superioara a cuvintelor superioare din A
;- B2: contine ca elemente partea inferioara a cuvintelor inferioare din A 

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

a dd 12345678h, 1A2B3C4Dh, 5C6D8A9Dh
la equ($-a)/4
b1 db la dup(?)
b2 db la dup(?)

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
		mov byte ptr b2[di], al
		add di,1
		add si,4
	loop repeta
	
	mov cx, la
	mov si, 3
	mov di, 0
	repeta2:
		mov al, byte ptr a[si]
		mov byte ptr b1[di], al
		add di,1
		add si,4
	loop repeta2


; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start