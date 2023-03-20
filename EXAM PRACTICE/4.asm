;4. Se da un numar n (0<n<256) in segmentul de date. Sa se genereze si sa se afiseze pe ecran secventa 3, 6, 9, ..., 3n-3, 3n.
;Exemplu:
;n = 6
;rezultat: 3, 6, 9, 12, 15, 18

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

n db 6
d db 10 dup(?)
aux db ?

aux2 dw ?
baza dw 10

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code
	
	mov cl, n
	mov aux, cl
	mov cl, 0
	mov di, 0
	repeta:
		mov al, 3
		mul cl ; ax : 3*1
		mov bx, 3
		add ax, bx
		mov byte ptr d[di], al
		inc di
		inc cl
		cmp aux, cl
		JNE repeta
		
	mov aux2, di
	mov di, 0
	repeta1:
		mov al, d[di]
		mov ah, 0
		mov cx, 0
		afis:
			cwd
			idiv baza
			push dx
			inc cx
			cmp ax, 0
			JNE afis
		afiss:
			pop dx
			add dl, '0'
			mov ah, 02h
			int 21h
		loop afiss
		
		mov dl, ' '
		mov ah, 02h
		int 21h
		
		add di,1
		cmp aux2, di
		JNE repeta1
		



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start