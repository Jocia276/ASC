;15. Se dau 2 siruri de octeti S1 si S2 de aceeasi lungime. Sa se construiasca sirul D astfel incat fiecare element din D 
;sa reprezinte minumul dintre elementele de pe pozitiile corespunzatoare din S1 si S2. 
;Exemplu:
;S1: 1, 3, 6, 2, 3, 7
;S2: 6, 3, 8, 1, 2, 5
;D: 1, 3, 6, 1, 2, 5

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s1 db 1,3,6,2,3,7
ls1 equ($-s1)
s2 db 6,3,8,1,2,5
ls2 equ($-s2)
d db ls1 dup(?) 

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov cx, ls1
	mov di, 0
	mov si, 0
	repeta:
		mov al, byte ptr s1[si]
		mov bl, byte ptr s2[si]
		cmp al, bl
		JL adaugal
		JGE adaugabl
		adaugal:
			mov al, byte ptr s1[si]
			mov byte ptr d[di], al
			add di,1
			add si,1
			jmp exit
		adaugabl:
			mov bl, byte ptr s2[si]
			mov byte ptr d[di], bl
			add di,1
			add si,1
		exit:
	loop repeta


; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start