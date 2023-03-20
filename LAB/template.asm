assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab



data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code





; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start