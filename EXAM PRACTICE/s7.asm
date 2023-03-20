;7. Se da un sir de octeti S. Sa se construiasca sirul D1 ce contine elementele de pe pozitiile pare din S si 
;sirul D2 ce contine elementele de pe pozitiile impare din S. 
;Exemplu:
;S: 1, 5, 3, 8, 2, 9
;D1: 1, 3, 2
;D2: 5, 8, 9


assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s db 1,5,3,8,2,9
ls equ($-s)
d1 db ls dup(?)
d2 db ls dup(?)

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov cx, ls/2
	mov si, 0
	mov di, 0
	repeta:
		mov al, byte ptr s[si]
		mov bl, al
		mov byte ptr d1[di], bl
		add si, 2
		add di, 1
	loop repeta
	
	mov cx, ls/2
	mov si, 1
	mov bp, 0
	repeta2:
		mov al, byte ptr s[si]
		mov bl, al
		mov byte ptr d2[bp], bl
		add si, 2
		add bp, 1
	loop repeta2
	

; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start