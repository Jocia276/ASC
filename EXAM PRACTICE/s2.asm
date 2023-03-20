;2. Se dau doua siruri de octeti S1 si S2. Sa se construiasca sirul D prin concatenarea elementelor din sirul 
;S1 1uate de la stanga spre dreapta si a elementelor din sirul S2 luate de la dreapta spre stanga. 
;Exemplu:
;S1: 1, 2, 3, 4
;S2: 5, 6, 7
;D: 1, 2, 3, 4, 7, 6, 5


assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s1 db 1,2,3,4
ls1 equ($-s1)
s2 db 5,6,7
ls2 equ($-s2)
d db ls1+ls2 dup(?)


data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov cx, ls1
	mov si, 0
	mov di, 0
	repeta:
		mov al, byte ptr s1[si]
		mov bl, al
		mov byte ptr d[di], bl
		add si, 1
		add di, 1
	loop repeta
	
	mov cx, ls2
	mov bp, 2
	repeta2:
		mov al, byte ptr s2[bp]
		mov bl, al
		mov byte ptr d[di], bl
		sub bp, 1
		add di, 1
	loop repeta2


; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start