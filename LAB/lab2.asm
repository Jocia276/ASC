;PROBLEMA 7
;Dandu-se 4 octeti, sa se obtina in AX suma numerelor intregi cuprinse intre bitii 4-6 ai celor 4 octeti;

assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

a db 11111111b; a = FFh
b db 11111111b; b = FFh
c db 00000000b; c = 0h
d db 11111111b; d = FFh

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov al, a          ; al = 11111111b
	sar al, 4          ; al = 00001111b
	and al, 000000111b ; al = 00000111b
	cbw                ; ax = 0000.0000.0000.0111b = 0007h

	mov bl, b          ; bl = 1111.1111b = FFh
	sar bl, 4          ; bl = 0000.1111b = 0Fh
	and bl, 000000111b ; bl = 0000.0111b = 07h
	cbw                ; bx = 0000.0000.0000.0111b = 0007h

	add ax, bx         ; ax = 0000.0000.0000.1110b = 000Eh

	mov cx, ax         ; cx = 0000.0000.0000.1110b = 000Eh

	mov al, c          ; al =0000.0000b = 0h
	sar al, 4          ; al = oh
	and al, 00000111b  ; al =0h
	cbw                ; ax = 0h

	add ax, cx         ; ax = 000Eh

	mov dl, d          ; dl =FFh
	sar dl, 4          ; dl =0F h
	and dl, 00000111b  ; dl = 07h
	cbw                ; dx = 0007h 

	add ax, dx         ; ax = 0000.0000.0000.1110b + 0000.0000.0000.0111b = 0000.0000.0001.0101b = 15h


; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start