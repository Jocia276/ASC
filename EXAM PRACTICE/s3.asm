;3. Se dau doua siruri de octeti S1 si S2 de aceeasi lungime. Sa se construiasca sirul D astfel:
;fiecare element de pe pozitiile pare din D este suma elementelor de pe pozitiile corespunzatoare din S1 si S2, 
;iar fiecare element de pe pozitiile impare are ca si valoare diferenta elementelor de pe pozitiile corespunzatoare din S1 si S2. 
;Exemplu:
;S1: 1, 2, 3, 4
;S2: 5, 6, 7, 8
;D: 6, -4, 10, -4


assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s1 db 1,2,3,4
ls1 equ($-s1)
s2 db 5,6,7,8
ls2 equ($-s2)
d db ls1 dup(?)


data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov cx, ls1-2
	mov si, 0
	mov di, 0
	repeta:
		mov al, byte ptr s1[si]
		mov bl, byte ptr s2[si]
		add al, bl
		mov byte ptr d[di], al
		add si, 2
		add di, 2
	loop repeta
	
	mov cx, ls2 -2
	mov si, 1
	mov di, 1
	repeta2:
		mov al, byte ptr s1[si]
		mov bl, byte ptr s2[si]
		sub al, bl
		mov byte ptr d[di], al
		add si,2
		add di, 2
	loop repeta2



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start