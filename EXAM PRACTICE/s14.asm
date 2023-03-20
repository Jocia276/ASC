;14. Se dau 2 siruri de octeti A si B. Sa se construiasca sirul R care sa contina elementele lui B in ordine inversa 
;urmate de elementele negative ale lui A. 
;Exemplu:
;A: 2, 1, -3, 3, -4, 2, 6
;B: 4, 5, 7, 6, 2, 1
;R: 1, 2, 6, 7, 5, 4, -3, -4

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

a db 2,1,-3,3,-4,2,6
la equ($-a)
b db 4,5,7,6,2,1
lb equ($-b)
r db la+lb dup(?)

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov cx, lb
	mov si, lb-1
	mov di, 0
	repeta:
		mov al, byte ptr b[si]
		mov byte ptr r[di], al
		sub si,1
		add di,1
	loop repeta
	
	mov cx, la
	mov si, 0
	repeta2:
		mov al, byte ptr a[si]
		cmp al, 0
		JGE next
		JL adauga
		adauga:
			mov al, byte ptr a[si]
			mov byte ptr r[di], al
			add si, 1
			add di,1
			jmp endd
		next:
			add si, 1
		endd:
	loop repeta2
		



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start