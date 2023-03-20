;9. Se dau 2 siruri de octeti A si B. 
;   Sa se construiasca sirul R care sa contina elementele lui B in ordine inversa
;   urmate de elementele impare ale lui A. 
;Exemplu:
;A: 2, 1, 3, 3, 4, 2, 6
;B: 4, 5, 7, 6, 2, 1
;R: 1, 2, 6, 7, 5, 4, 1, 3, 3

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

a db 2,1,3,3,4,2,6
lsa equ $-a

b db 4,5,7,6,2,1
lsb equ $-b

r db lsb+lsa dup(?)


data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code
	mov cx, lsb
	mov si, 0
	add si, lsb-1
	mov di, 0
	repeta:
		mov al, byte ptr b[si]
		mov dl, al
		mov byte ptr r[di],dl
		sub si,1
		add di,1
	loop repeta
	
	mov cx, lsa
	mov si, 0
	repeta2:
		mov al, byte ptr a[si]
		cbw
		mov dl, al 
		mov bl, 2
		idiv bl
		CMP ah, 0
		JE next
		JNE adauga
		adauga:
			mov byte ptr r[di], dl
			add di, 1
		next:
			add si, 1
	loop repeta2
		


; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start