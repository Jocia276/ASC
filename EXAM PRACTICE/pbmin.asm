assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

	; a - 0101b + b
	a dw -10 ; FFF6
	b db -7 ; F9
	; in memorie F6 FF F9
	
	; codul complementar pentru a determina valoarea lui -10 si valoarea lui -7
	
	; in situatia numerelor intregi (cu semn)


data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code
	; a - 0101b
	mov ax, a ; ax = fff6
	sub ax, 0101b ; ax = -5
	; a - 0101b + b
	
	;salvare ax in cx
	mov cx, ax ; pt ca ax sa fie liber pentru a face conversia
				; cx=-5
	
	; convert b de la byte la word
	mov al, b ; -7
	cbw
	add cx, ax ; cx = -5 + (-7) = -12 = fff4
	




; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start