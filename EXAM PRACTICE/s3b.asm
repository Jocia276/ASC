;3.  Se da un sir A de cuvinte. Construiti doua siruri de octeti  
; - B1: contine ca elemente partea superioara a cuvintelor din A
; - B2: contine ca elemente partea inferioara a cuvintelor din A 

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

a dw 1234h, 5678h, 1A2Bh, 3C4Dh
la equ($-a)/2
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
	mov si, 1
	mov di, 0
	repeta:
		mov al, byte ptr a[si]
		mov byte ptr b1[di], al
		add si, 2
		add di,1
	loop repeta
	
	mov cx, la
	mov si, 0
	mov bp, 0
	repeta2:
		mov al, byte ptr a[si]
		mov byte ptr b2[bp], al
		add si, 2
		add bp, 1
	loop repeta2
		



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start