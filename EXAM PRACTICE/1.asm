;1. Se da un sir de octeti in segmentul de date. Sa se construiasca sirul D care sa contina diferenta elementelor consecutive 
;din sirul S si sa se afiseze acest sir pe ecran.
;Exemplu:
;S: 12, 6, 2, 1
;D: 6,4,1

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

s db 12,6,2,1
ls equ($-s)
d db ls-1 dup(?)
ld dw ?
aux dw ?
baza dw 10

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov cx, ls-1
	mov si, 0
	mov di, 0
	repeta:
		mov al, byte ptr  s[si]
		mov bl, byte ptr  s[si+1]
		sub al, bl
		mov byte ptr d[di], al
		inc si
		inc di
	loop repeta
	
	


mov aux, di
mov di, 0
repetaafis:
    mov al, d[di]
	mov ah, 0
    mov cx, 0
	repeta223:
		cwd
		idiv baza
		push dx
		inc cx
		cmp ax, 0
		JNE repeta223
	repetaa:
		pop dx
		add dl, '0'
		mov ah, 02h
		int 21h
	loop repetaa
    mov dl, ' '
    mov ah, 02h
    int 21h
    add di, 1
    cmp di, aux
    JNE repetaafis
	

; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start