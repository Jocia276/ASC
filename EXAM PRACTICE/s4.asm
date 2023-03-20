;4.  Se da un sir de octeti S. Sa se construiasca sirul D astfel: sa se puna mai intai elementele de pe pozitiile pare din S 
;iar apoi elementele de pe pozitiile impare din S. 
;Exemplu:
;S: 1, 2, 3, 4, 5, 6, 7, 8
;D: 1, 3, 5, 7, 2, 4, 6, 8



assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s db 1,2,3,4,5,6,7,8
ls equ($-s)
d db ls dup(?)

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov cx, ls-4
	mov si, 0
	mov di, 0
	repeta:
		mov al, byte ptr s[si]
		mov bl, al
		mov byte ptr d[di], bl
		add si, 2
		add di, 1
	loop repeta
	
	mov cx, ls-4
	mov si, 1
	repeta2:
		mov al, byte ptr s[si]
		mov bl, al
		mov byte ptr d[di], bl
		add si, 2
		add di, 1
	loop repeta2



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start