includelib winmm.lib
INCLUDE Irvine32.inc
INCLUDE macros.inc
PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD

BUFFER_SIZE = 501

.data

ground BYTE "------------------------------------------------------------------------------------------------------------------------",0
pause1 db "  _____                                   ",0           
pause2 db " |  __ \                                  ",0
pause3 db " | |__) |    __ _    _   _    ___     ___ ",0
pause4 db " |  ___/    / _` |  | | | |  / __|   / _ \",0
pause5 db " | |       | (_| |  | |_| |  \__ \  |  __/",0
pause6 db " |_|        \__,_|   \__,_|  |___/   \___|",0
lives db 3

levelis db "Your Level is: ",0
ins1 db "The pacman moves with w (Up), a (Left), d (Right), s (Down).",0
ins2 db "You have to avoid the path of the ghost.",0
ins3 db "The pacman has three lives if you collide with the ghost one life reduces.",0
ins4 db "There are total 3 levels. You have to score at least 30 to move to the next stage."
gameOver1 db "   _____                         ____ ",0            
gameOver2 db "  / ____|                       / __ \                ",0
gameOver3 db " | |  __  __ _ _ __ ___   ___  | |  | |_   _____ _ __ ",0
gameOver4 db " | | |_ |/ _` | '_ ` _ \ / _ \ | |  | \ \ / / _ \ '__|",0
gameOver5 db " | |__| | (_| | | | | | |  __/ | |__| |\ V /  __/ |   ",0
gameOver6 db "  \_____|\__,_|_| |_| |_|\___|  \____/  \_/ \___|_|   ",0
welcome1 db " __        __   _                            _____       ____                        ",0          
welcome2 db " \ \      / /__| | ___ ___  _ __ ___   ___  |_   _|__   |  _ \ __ _  ___ _ __ ___   __ _ _ __  ",0
welcome3 db "  \ \ /\ / / _ \ |/ __/ _ \| '_ ` _ \ / _ \   | |/ _ \  | |_) / _` |/ __| '_ ` _ \ / _` | '_ \ ",0
welcome4 db "   \ V  V /  __/ | (_| (_) | | | | | |  __/   | | (_) | |  __/ (_| | (__| | | | | | (_| | | | |",0
welcome5 db "    \_/\_/ \___|_|\___\___/|_| |_| |_|\___|   |_|\___/  |_|   \__,_|\___|_| |_| |_|\__,_|_| |_|",0
                                                   
menu1 db "___  ___                           ",0                          
menu2 db "|  \/  |                          ",0
menu3 db "| .  . |    ___    _ __     _   _ ",0
menu4 db "| |\/| |   / _ \  | '_ \   | | | |",0
menu5 db "| |  | |  |  __/  | | | |  | |_| |",0
menu6 db "\_|  |_/   \___|  |_| |_|   \__,_|",0

movementSound db "cherry.wav",0
deviceConnect BYTE "DeviceConnect",0
SND_ALIAS    DWORD 00010000h
SND_RESOURCE DWORD 00040005h
SND_FILENAME DWORD 00020000h


scoreSound db "waka.wav",0
dot db ".",0
file BYTE "t.wav",0
beginning byte "pacman_beginning.wav",0
ending byte "pacman_death.wav",0

 level2maze1 byte " __________        __________        ____________        ______", 0
 level2maze2 byte "|          |      |          |      |     _      |      |      |", 0
 level2maze3 byte "|          |      |          |      |     _      |      |      |", 0
 level2maze4 byte "|          |      |          |      |     _      |      |      |", 0
 level2maze5 byte "|       ___|      |          |      |     _      |      |      |", 0
 level2maze6 byte "|      |          |          |      |     |      |      |      ___", 0
 level2maze7 byte "|      |          |          |      |     _      |      |         |", 0
 level2maze8 byte "|       ---|      |          |      |     _      |      |         |", 0
 level2maze9 byte "|          |      |          |      |     _      |      |         |", 0
level2maze10 byte "| ________ |      |__________|      |_____|______|      |_________|", 0

level3maze1 byte " __    __             ____            _                  ___              ___            ___",0
level3maze2 byte "|  |__|  |           /    |          | |                /  _]            /  _]          |   \",0  
level3maze3 byte "|  |  |  |          |  o  |          | |               /  [_            /  [_           |    \",0 
level3maze4 byte "|  |  |  |          |     |          | |___           |    _]          |    _]          |  D  |",0
level3maze5 byte "|  `  '  |          |  _  |          |     |          |   [_           |   [_           |     |",0
level3maze6 byte " \      /           |  |  |          |     |          |     |          |     |          |     |",0
level3maze7 byte "  \_/\_/            |__|__|          |_____|          |_____|          |_____|          |_____|",0
resume db "Resume",0
gameclose db "Exit",0
fruit db "O",0                      
ground1 BYTE "|",0ah,0
verticalLine BYTE "|", 0
welcomeMsg BYTE "||        ||", 0ah, "||  //\\  ||", 0ah, "|| //  \\ ||", 0ah, "--//    \\--", 0
startGame byte "Start Game",0
byeMsg byte "Thank you for your time. Bye have a great time. ",0
endGame byte "Exit",0
instructions Byte "Instructions",0
heart db "O",0
welcomeMsg2 byte "||",0
welcomeMsg3 byte "_____",0
welcomeMsg4 byte "||",0
welcomeMsg5 byte "________",0
welcomeMsg6 byte "_______",0
welcomeMsg9 byte "______",0
welcomeMsg10 byte "_____________",0
welcomeMsg7 byte "/",0
welcomeMsg8 byte "\",0
ground2 BYTE "|",0
buffer2 byte 256 dup(?)
EnterName byte "Enter your name: ",0
EnterName1  byte "Player Name: ",0
horizontalLine byte "-",0
horizontalLine1 byte "_",0
buffer BYTE BUFFER_SIZE DUP(?)
filename BYTE "output.txt",0
fileHandle HANDLE ?
stringLength DWORD ?
bytesWritten DWORD ?
str1 BYTE "Cannot create file",0dh,0ah,0
str2 BYTE "Bytes written to file [output.txt]:",0
str3 BYTE "Enter up to 500 characters and press"
 BYTE "[Enter]: ",0dh,0ah,0  
 ghost db ?
 ghost1 db ?
 temp1 byte 0
 xFruitPos db ?
 yFruitPos db ?
 xFruitPos1 db ?
 yFruitPos1 db ?
 xFruitPos2 db ?
 yFruitPos2 db ?
 liveString db "Your lives are: ",0
temp byte ?
strScore BYTE "Your score is: ",0

score BYTE 0
var1 byte 0
var2 byte 0
xPos BYTE 20
yPos BYTE 20

xPostGhost Byte 67
yPostGhost Byte 4

xPostGhost1 Byte 35
yPostGhost1 Byte 14

xPostGhost2 Byte 60
yPostGhost2 Byte 25

xPostGhost3 Byte 2
yPostGhost3 Byte 5

xPostGhost4 Byte 90
yPostGhost4 Byte 15

l2xPostGhost Byte 91
l2yPostGhost Byte 4

l2xPostGhost1 Byte 44
l2yPostGhost1 Byte 14

l2xPostGhost2 Byte 60
l2yPostGhost2 Byte 23

l2xPostGhost3 Byte 13
l2yPostGhost3 Byte 11

l2xPostGhost4 Byte 108
l2yPostGhost4 Byte 15

l3xPostGhost5 byte ?
l3yPostGhost5 byte ?

l3xPostGhost6 byte ?
l3yPostGhost6 byte ?

maxHeight byte 14

xCoinPos BYTE ?
yCoinPos BYTE ?
xCoinPos1 BYTE ?
yCoinPos1 BYTE ?
xCoinPos2 BYTE ?
yCoinPos2 BYTE ?
inputChar1 BYTE ?

inputChar BYTE ?

l2xCoinPos BYTE ?
l2yCoinPos BYTE ?
l2xCoinPos1 BYTE ?
l2yCoinPos1 BYTE ?
l2xCoinPos2 BYTE ?
l2yCoinPos2 BYTE ?
l2xCoinPos3 db ?
l2yCoinPos3 db ?
l2xCoinPos4 db ?
l2yCoinPos4 db ?
l2xCoinPos5 db ?
l2yCoinPos5 db ?
l3xCoinPos BYTE ?
l3yCoinPos BYTE ?
l3xCoinPos1 BYTE ?
l3yCoinPos1 BYTE ?
l3xCoinPos2 BYTE ?
l3yCoinPos2 BYTE ?
l3xCoinPos3 db ?
l3yCoinPos3 db ?
l3xCoinPos4 db ?
l3yCoinPos4 db ?
l3xCoinPos5 db ?
l3yCoinPos5 db ?
l2inputChar1 BYTE ?

l2inputChar BYTE ?
l3inputChar1 BYTE ?

l3inputChar BYTE ?


.code
createScreen proc 
call Clrscr
  ; draw ground at (0,29):
    mov eax,blue ;(black * 16)d45sa
    
    call SetTextColor
   
    
ret 
createScreen endP
createWelcomeScreen proc
mov eax,magenta ;(blue*16)
    call SetTextColor
      mov dl,5
      mov dh,2
    call Gotoxy
    mov edx,OFFSET welcome1
    call WriteString
    mov eax,blue ;(blue*16)
    call SetTextColor
      mov dl,5
      mov dh,3
    call Gotoxy
    mov edx,OFFSET welcome2
    call WriteString
    mov eax,brown ;(blue*16)
    call SetTextColor
      mov dl,5
      mov dh,4
    call Gotoxy
    mov edx,OFFSET welcome3
    call WriteString
    mov eax,green ;(blue*16)
    call SetTextColor
      mov dl,5
      mov dh,5
    call Gotoxy
    mov edx,OFFSET welcome4
    call WriteString
    mov eax,red ;(blue*16)
    call SetTextColor
      mov dl,5
      mov dh,6
    call Gotoxy
    mov edx,OFFSET welcome5
    call WriteString
    mov eax,brown ;(blue*16)
    call SetTextColor
     mov dl,36
    mov dh,15
       call Gotoxy
    mov edx,offset EnterName
    call WriteString

    ; Create a new text file.


   quit:
    mov edx, OFFSET buffer  ; Set the buffer address
    mov ecx, SIZEOF buffer  ; Set the buffer size
    call ReadString         ; Read a string from the console    

ret 
createWelcomeScreen endP
createUpperWaliDewar proc


     mov eax,1010b ;(black * 16)
    call SetTextColor
    mov var1,7
    mov dh,10
    mov ecx,5
    loop22:
    mov dl,32
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop22
     mov var1,7
    mov dh,10
    mov ecx,5
    loop21:
    mov dl,34
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop21
     mov dl,33          ;horizontal
    mov dh,6           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
      mov dl,33          ;horizontal
    mov dh,11           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

    mov eax,0011b ;(black * 16)
    call SetTextColor
    mov var1,7
    mov dh,10
    mov ecx,5
    loop23:
    mov dl,72
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop23
     mov var1,7
    mov dh,10
    mov ecx,5
    loop24:
    mov dl,74
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop24
     mov dl,73          ;horizontal
    mov dh,6           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
      mov dl,73          ;horizontal
    mov dh,11           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

    mov eax,1011b ;(black * 16)
    call SetTextColor
    mov var1,7
    mov dh,10
    mov ecx,5
    loop32:
    mov dl,1
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop32
     mov var1,7
    mov dh,10
    mov ecx,5
    loop31:
    mov dl,3
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop31
     mov dl,2          ;horizontal
    mov dh,6           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
      mov dl,2         ;horizontal
    mov dh,11           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString


     mov eax,1011b ;(black * 16)
    call SetTextColor
    mov var1,7
    mov dh,10
    mov ecx,5
    loop25:
    mov dl,107
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop25
     mov var1,7
    mov dh,10
    mov ecx,5
    loop26:
    mov dl,109
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop26
     mov dl,108          ;horizontal
    mov dh,6           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
      mov dl,108          ;horizontal
    mov dh,11           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

    mov eax,0110b ;(black * 16)
    call SetTextColor
    mov dl,44          ;horizontal
    mov dh,7          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,48          ;horizontal
    mov dh,7          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,51          ;horizontal
    mov dh,7          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,54          ;horizontal
    mov dh,7          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,62          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    mov dl,44          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,48          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString 
     mov dl,51          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
      mov dl,54          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,43          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    
    mov eax,0100b ;(black * 16)
    call SetTextColor
    mov dl,44          ;horizontal
    mov dh,10          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,48          ;horizontal
    mov dh,10          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,51          ;horizontal
    mov dh,10          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,54          ;horizontal
    mov dh,10          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,62          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    mov dl,44          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,48          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString 
     mov dl,51          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
      mov dl,54          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,43          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString


    mov eax,1010b ;(black * 16)
    call SetTextColor
    mov dl,82          ;horizontal
    mov dh,10          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,86          ;horizontal
    mov dh,10          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,89          ;horizontal
    mov dh,10          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,92          ;horizontal
    mov dh,10          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,100          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    mov dl,82          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,86          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString 
     mov dl,89          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
      mov dl,92         ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,81          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    mov eax,1001b ;(black * 16)
    call SetTextColor
    mov dl,82          ;horizontal
    mov dh,7          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,86          ;horizontal
    mov dh,7          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,89          ;horizontal
    mov dh,7          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,92          ;horizontal
    mov dh,7          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,100          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    mov dl,82          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,86          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString 
     mov dl,89          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
      mov dl,92         ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,81          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

        mov eax,1100b ;(black * 16)
    call SetTextColor
    mov dl,8          ;horizontal
    mov dh,7          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,12          ;horizontal
    mov dh,7          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,15          ;horizontal
    mov dh,7          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,18          ;horizontal
    mov dh,7          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,26          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    mov dl,8          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,12          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString 
     mov dl,15          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
      mov dl,18         ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,7          ;horizontal
    mov dh,8          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

          mov eax,1011b ;(black * 16)
    call SetTextColor
    mov dl,8          ;horizontal
    mov dh,10          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,12          ;horizontal
    mov dh,10          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,15          ;horizontal
    mov dh,10          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,18          ;horizontal
    mov dh,10          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,26          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    mov dl,8          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,12          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString 
     mov dl,15          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
      mov dl,18         ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,7          ;horizontal
    mov dh,11          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString



    
ret
createUpperWaliDewar endP
createCoalWalls proc
    
    mov var1,10
    mov ecx,3
    loop33:
    mov dl,var1          ;horizontal
    mov dh,16          ;VERTICAL
    add var1,4
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    loop loop33

    mov var1,17
    mov ecx,7
    loop34:
    mov dl,9          ;horizontal
    mov dh,var1         ;VERTICAL
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    loop loop34

    mov var1,10
    mov ecx,3
    loop35:
    mov dl,var1          ;horizontal
    mov dh,23          ;VERTICAL
    add var1,4
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    loop loop35

    mov var1,14
    mov ecx,2
    loop36:
    mov dl,var1          ;horizontal
    mov dh,18          ;VERTICAL
    add var1,4
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    loop loop36

    mov var1,14
    mov ecx,2
    loop37:
    mov dl,var1          ;horizontal
    mov dh,21          ;VERTICAL
    add var1,4
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    loop loop37

    mov var1,19
    mov ecx,3
    loop38:
    mov dl,13          ;horizontal
    mov dh,var1         ;VERTICAL
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    loop loop38
    mov var1,17
    mov ecx,2
    loop39:
    mov dl,26          ;horizontal
    mov dh,var1         ;VERTICAL
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    loop loop39

    mov var1,22
    mov ecx,2
    loop40:
    mov dl,26          ;horizontal
    mov dh,var1         ;VERTICAL
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    loop loop40

    mov var1,20
    mov ecx,4
    loop41:
    mov dl,41          ;horizontal
    mov dh,var1         ;VERTICAL
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    loop loop41
    mov var1,20
    mov ecx,4
    loop42:
    mov dl,54          ;horizontal
    mov dh,var1         ;VERTICAL
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    loop loop42

      mov var1,21
    mov ecx,2
    loop43:
    mov dl,44          ;horizontal
    mov dh,var1         ;VERTICAL
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    loop loop43

    mov var1,21
    mov ecx,2
    loop44:
    mov dl,51          ;horizontal
    mov dh,var1         ;VERTICAL
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    loop loop44

    mov var1,42
    mov ecx,2
    loop45:
    mov dl,var1          ;horizontal
    mov dh,19          ;VERTICAL
    add var1,4
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    loop loop45

    
    mov var1,42
    mov ecx,2
    loop46:
    mov dl,var1          ;horizontal
    mov dh,23          ;VERTICAL
    add var1,4
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    loop loop46

     mov dl,45          ;horizontal
    mov dh,22          ;VERTICAL
    add var1,4
    call Gotoxy
    mov edx,OFFSET welcomeMsg9
    call WriteString

     mov dl,45          ;horizontal
    mov dh,20          ;VERTICAL
    add var1,4
    call Gotoxy
    mov edx,OFFSET welcomeMsg9
    call WriteString

      mov var1,22
    mov ecx,2
    loop47:
    mov dl,41          ;horizontal
    mov dh,var1         ;VERTICAL
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    loop loop47

    mov var1,20
    mov ecx,4
    loop48:
    mov dl,66          ;horizontal
    mov dh,var1         ;VERTICAL
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    loop loop48
    mov var1,20
    mov ecx,4
    loop49:
    mov dl,79          ;horizontal
    mov dh,var1         ;VERTICAL
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    loop loop49

      mov var1,21
    mov ecx,2
    loop50:
    mov dl,69         ;horizontal
    mov dh,var1         ;VERTICAL
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    loop loop50

    mov var1,21
    mov ecx,2
    loop52:
    mov dl,76          ;horizontal
    mov dh,var1         ;VERTICAL
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    loop loop52

    mov var1,67
    mov ecx,2
    loop51:
    mov dl,var1          ;horizontal
    mov dh,19          ;VERTICAL
    add var1,4
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    loop loop51

    
    mov var1,67
    mov ecx,2
    loop53:
    mov dl,var1          ;horizontal
    mov dh,23          ;VERTICAL
    add var1,4
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    loop loop53

     mov dl,70          ;horizontal
    mov dh,22          ;VERTICAL
    add var1,4
    call Gotoxy
    mov edx,OFFSET welcomeMsg9
    call WriteString

     mov dl,70          ;horizontal
    mov dh,20          ;VERTICAL
    add var1,4
    call Gotoxy
    mov edx,OFFSET welcomeMsg9
    call WriteString

    
    mov dl,80          ;horizontal
    mov dh,23          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
    mov dl,81          ;horizontal
    mov dh,23          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

    mov eax,1010b ;(black * 16)
    call SetTextColor
    mov var1,17
    mov dh,10
    mov ecx,7
    loop22:
    mov dl,95
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop22
     mov var1,17
    mov dh,10
    mov ecx,7
    loop21:
    mov dl,99
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop21
     mov dl,96          ;horizontal
    mov dh,16           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
     mov dl,97          ;horizontal
    mov dh,16           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
     mov dl,98          ;horizontal
    mov dh,16           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
      mov dl,96          ;horizontal
    mov dh,23           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
    mov dl,97          ;horizontal
    mov dh,23           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
      mov dl,98          ;horizontal
    mov dh,23           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

    mov dl,42          ;horizontal
    mov dh,15           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,50          ;horizontal
    mov dh,15           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString

     mov dl,42          ;horizontal
    mov dh,16           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,50          ;horizontal
    mov dh,16           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString

     mov dl,57          ;horizontal
    mov dh,15           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,65          ;horizontal
    mov dh,15           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,69          ;horizontal
    mov dh,15           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString

     mov dl,57          ;horizontal
    mov dh,16           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,65          ;horizontal
    mov dh,16           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,69          ;horizontal
    mov dh,16           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,77          ;horizontal
    mov dh,16           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    mov dl,41          ;horizontal
    mov dh,16           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    ;--
    mov dl,42          ;horizontal
    mov dh,27           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,50          ;horizontal
    mov dh,27           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString

     mov dl,42          ;horizontal
    mov dh,28           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,50          ;horizontal
    mov dh,28           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString

     mov dl,57          ;horizontal
    mov dh,27           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,65          ;horizontal
    mov dh,27           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,69          ;horizontal
    mov dh,27           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString

     mov dl,57          ;horizontal
    mov dh,28             ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,65          ;horizontal
    mov dh,28           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,69          ;horizontal
    mov dh,28           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,77          ;horizontal
    mov dh,28           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    mov dl,41          ;horizontal
    mov dh,28           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

        mov dl,57          ;horizontal
    mov dh,28             ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,65          ;horizontal
    mov dh,28           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,69          ;horizontal
    mov dh,28           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,77          ;horizontal
    mov dh,28           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    mov dl,41          ;horizontal
    mov dh,28           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

      mov dl,2          ;horizontal
    mov dh,2           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,17          ;horizontal
    mov dh,2           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString

     mov dl,2          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,17          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString

     mov dl,9          ;horizontal
    mov dh,2           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,22          ;horizontal
    mov dh,2           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,26          ;horizontal
    mov dh,2           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString

     mov dl,9          ;horizontal
    mov dh,3             ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,22          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,26          ;horizontal
    mov dh,2           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,30          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    mov dl,1          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

        mov dl,16          ;horizontal
    mov dh,3             ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,22          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,26          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,34          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    mov dl,1          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    ;--
    mov dl,75          ;horizontal
    mov dh,2           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,90          ;horizontal
    mov dh,2           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString

     mov dl,75          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,90          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString

     mov dl,82          ;horizontal
    mov dh,2           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,95          ;horizontal
    mov dh,2           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,99          ;horizontal
    mov dh,2           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString

     mov dl,82          ;horizontal
    mov dh,3             ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,95          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,99          ;horizontal
    mov dh,2           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,103          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    mov dl,74          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

        mov dl,89          ;horizontal
    mov dh,3             ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,95          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,99          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,107          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    mov dl,74          ;horizontal
    mov dh,3           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

  
     mov var1,15
  
    mov ecx,13
    loop200:
    mov dl,1
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop200

      mov var1,15
       mov ecx,13
    loop201:
    mov dl,3
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop201

    mov eax,red ;(black * 16)
    call SetTextColor
     mov var1,15
     mov ecx,13
    loop203:
    mov dl,107
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop203

   

     mov eax,red ;(black * 16)
    call SetTextColor
      mov var1,15
       mov ecx,13
    loop204:
    mov dl,109
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop204




ret
createCoalWalls endP
createMenuScreen proc
  
  mov eax,red ;(black * 16)
        call SetTextColor
    mov dl,40
    mov dh,2
    call Gotoxy
    mov edx,offset menu1
    call WriteString
    mov eax,green ;(black * 16)
        call SetTextColor
    mov dl,40
    mov dh,3
    call Gotoxy
    mov edx,offset menu2
    call WriteString
    mov eax,magenta ;(black * 16)
        call SetTextColor
    mov dl,40
    mov dh,4
    call Gotoxy
    mov edx,offset menu3
    call WriteString
    mov eax,brown ;(black * 16)
        call SetTextColor
    mov dl,40
    mov dh,5
    call Gotoxy
    mov edx,offset menu4
    call WriteString
    mov eax,white ;(black * 16)
        call SetTextColor
    mov dl,40
    mov dh,6
    call Gotoxy
    mov edx,offset menu5
    call WriteString
    mov eax,cyan ;(black * 16)
        call SetTextColor
    mov dl,40
    mov dh,7
    call Gotoxy
    mov edx,offset menu6
    call WriteString


    ;----------------Menu options-----------
    
        mov eax,red ;(black * 16)
        call SetTextColor
    mov dl,50
    mov dh,12
    call Gotoxy
    mov edx,offset welcomeMsg5
    call WriteString
       mov dl,55
    mov dh,12
    call Gotoxy
    mov edx,offset welcomeMsg5
    call WriteString
    mov dl,51
    mov dh,14
    call Gotoxy
    mov edx,offset startGame
    call WriteString
      mov dl,50
    mov dh,15
    call Gotoxy
    mov edx,offset welcomeMsg5
    call WriteString
      mov dl,55
    mov dh,15
    call Gotoxy
    mov edx,offset welcomeMsg5
    call WriteString
    mov var1,13
    mov ecx,3
    loop101:
         mov dl,49
    mov dh,var1
    inc var1
    call Gotoxy
    mov edx,offset verticalLine
    call WriteString
    loop loop101
      mov var1,13
    mov ecx,3
        loop102:
         mov dl,63
    mov dh,var1
    inc var1
    call Gotoxy
    mov edx,offset verticalLine
    call WriteString
    loop loop102

         mov eax,cyan ;(black * 16)
        call SetTextColor
    mov dl,50
    mov dh,17
    call Gotoxy
    mov edx,offset welcomeMsg5
    call WriteString
       mov dl,55
    mov dh,17
    call Gotoxy
    mov edx,offset welcomeMsg5
    call WriteString
    mov dl,51
    mov dh,19
    call Gotoxy
    mov edx,offset instructions
    call WriteString
      mov dl,50
    mov dh,20
    call Gotoxy
    mov edx,offset welcomeMsg5
    call WriteString
      mov dl,55
    mov dh,20
    call Gotoxy
    mov edx,offset welcomeMsg5
    call WriteString
    mov var1,18
    mov ecx,3
    loop103:
         mov dl,49
    mov dh,var1
    inc var1
    call Gotoxy
    mov edx,offset verticalLine
    call WriteString
    loop loop103
      mov var1,18
    mov ecx,3
        loop104:
         mov dl,63
    mov dh,var1
    inc var1
    call Gotoxy
    mov edx,offset verticalLine
    call WriteString
    loop loop104

         mov eax,green ;(black * 16)
        call SetTextColor
    mov dl,50
    mov dh,22
    call Gotoxy
    mov edx,offset welcomeMsg5
    call WriteString
       mov dl,55
    mov dh,22
    call Gotoxy
    mov edx,offset welcomeMsg5
    call WriteString
    mov dl,54
    mov dh,24
    call Gotoxy
    mov edx,offset endGame
    call WriteString
      mov dl,50
    mov dh,25
    call Gotoxy
    mov edx,offset welcomeMsg5
    call WriteString
      mov dl,55
    mov dh,25
    call Gotoxy
    mov edx,offset welcomeMsg5
    call WriteString
    mov var1,23
    mov ecx,3
    loop105:
         mov dl,49
    mov dh,var1
    inc var1
    call Gotoxy
    mov edx,offset verticalLine
    call WriteString
    loop loop105
      mov var1,23
    mov ecx,3
        loop106:
         mov dl,63
    mov dh,var1
    inc var1
    call Gotoxy
    mov edx,offset verticalLine
    call WriteString
    loop loop106
    call ReadChar
    cmp al,"i"
    je createInstructionScreen 
    call ReadChar
    cmp al,"x"
    je createExitScreen
  
ret
createMenuScreen endP

createExitScreen proc

         mov dl,49
    mov dh,7
    call Gotoxy
    mov edx,offset byeMsg
    call WriteString
   
ret
createExitScreen endP       
createInstructionScreen proc
call createScreen
call ReadChar 
ret
createInstructionScreen endP


main PROC
mov temp,0
    mov temp1,0

  call createScreen
  call createWelcomeScreen
 
  call createScreen
  call createMenuScreen
      
  call DrawGhost
 
 ; Restore the original text color (default: white on black)
 resumeGame:
    mov eax, red
    call SetTextColor

    call createScreen
    call createUpperWaliDewar
    call createCoalWalls
        INVOKE PlaySound, OFFSET beginning, NULL, SND_FILENAME
    ;-------------------------------------------------------------------------------------------------------
   
    call DrawCoin
    call DrawPlayer
    call DrawGhost
    call CreateRandomCoin

        mov eax,white + (red * 16) ;(black * 16)
        call SetTextColor
        mov dh,0
        mov dl,114
    ;call Randomize
     mov dl,100
        mov dh,0
        call Gotoxy
        mov edx,OFFSET liveString
        call WriteString
          mov al,lives
        call WriteInt
       
        mov ecx,30
        mov xCoinPos,40
        mov yCoinPos,14
      
mov al,xCoinPos
mov bl,yCoinPos
mov var1,al
mov var2,bl

    CoinCreation:
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,var1
    mov dh,yCoinPos
    add var1,1
    call Gotoxy
    mov al,"."
    call WriteChar  
    inc var1
    mov dl,var1
    mov dh,yCoinPos
    call Gotoxy
    mov al," "
    call WriteChar
    loop CoinCreation

      mov xCoinPos1,30
        mov yCoinPos1,5
    mov al,xCoinPos1
mov bl,yCoinPos1
mov var1,al
mov var2,bl
mov ecx,40 
    CoinCreation1:
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,var1
    mov dh,yCoinPos1
    add var1,1
    call Gotoxy
    mov al,"."
    call WriteChar  
    inc var1
    mov dl,var1
    mov dh,yCoinPos1
    call Gotoxy
    mov al," "
    call WriteChar
    loop CoinCreation1

    gameLoop:
    cmp score,10
    jg createLevel2
  
    cmp lives,0
     jl exitGame
    ;INVOKE PlaySound, OFFSET movementSound, NULL, SND_ALIAS
  
 mov ecx,10
 UprJa:
 mov eax,15
 call Delay
 call UpdateGhost
        inc yPostGhost
        inc yPostGhost1
        inc xPostGhost2
        inc xPostGhost3
        inc yPostGhost4
        call DrawGhost  
 loop UprJa
  mov ecx,10
 NecheJa:
 mov eax,15
 call Delay
 call UpdateGhost
        dec yPostGhost
        dec yPostGhost1
        dec xPostGhost2
        dec xPostGhost3
        dec yPostGhost4
        call DrawGhost  
 loop NecheJa

 mov al,yPos
 cmp al,yPostGhost
 je LifeDown
  mov al,yPos
 cmp al,yPostGhost1
 je LifeDown
 mov al,yPos
 cmp al,yPostGhost2
 je LifeDown
 mov al,yPos
 cmp al,yPostGhost3
 je LifeDown
 mov al,yPos
 cmp al,yPostGhost4
 je LifeDown
 jmp Notdown
 LifeDown:
 mov bl,xPostGhost
 cmp bl,xPos
 je LifeDown1
 mov bl,xPostGhost1
 cmp bl,xPos
 je LifeDown1
 mov bl,xPostGhost2
 cmp bl,xPos
 je LifeDown1
 mov bl,xPostGhost3
 cmp bl,xPos
 je LifeDown1
 mov bl,xPostGhost4
 cmp bl,xPos
 je LifeDown1
 jmp Notdown
 LifeDown1:
        dec lives
Notdown:

        mov bl,xPos
        cmp bl,xCoinPos
        jne bhag
        mov bl,yPos
        cmp bl,yCoinPos
        jne bhag
        cmp temp1,30
        jl increase
        jmp bhag
        increase:
          inc xCoinPos
          inc xCoinPos
        inc score
           INVOKE PlaySound, OFFSET scoreSound, NULL, SND_ALIAS     
        inc temp1
        ; player is intersecting coin:
    
        bhag:
        mov bl,xPos
        cmp bl,xCoinPos1
        jne bhag1
        mov bl,yPos
        cmp bl,yCoinPos1
        jne bhag1
        cmp temp1,70
        jl increase1
        jmp bhag1
        increase1:
          inc xCoinPos1
          inc xCoinPos1
        inc score
        inc temp1
    
      bhag1:  
       ; call DrawCoin
        ; getting points:
       ; mov bl,xPos
      ;  cmp bl,xCoinPos
      ;  jne notCollecting
       ; mov bl,yPos
        ;cmp bl,yCoinPos
        ;jne notCollecting
        ; player is intersecting coin:
       ; inc score


        ;call CreateRandomCoin
        
      ;  notCollecting:

        mov eax,white (black * 16)
        call SetTextColor

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteInt
         mov dl,100
        mov dh,0
        call Gotoxy
        mov edx,OFFSET liveString
        call WriteString
          mov al,lives
        call WriteInt
       

       

        mov eax,white;
        call SetTextColor

        ; gravity logic:
        gravity:
        cmp yPos,0
        jg onGround
        ; make player fall:
        call UpdatePlayer
        inc yPos                
        call DrawPlayer
        mov eax,80
        ;call Delay
        jmp gravity
        onGround:

        ; get user key input:
        call ReadChar
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame
        
        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight

        cmp inputChar,"p"
        je  pauseScreen

        cmp inputChar,"i"
        je instructionScreen

        moveUp:
        mov dl,10
        mov dh,10
        ; allow player to jump:
        mov ecx,1
        
        jumpLoop:
            call UpdatePlayer
            sub yPos,1
            
            call DrawPlayer
            ;mov eax,70
            ;call Delay
        loop jumpLoop
        jmp gameLoop
        moveDown:
        call UpdatePlayer
        add yPos,1
        call DrawPlayer
        jmp gameLoop
        moveLeft:
        call UpdatePlayer
        sub xPos,1
        call DrawPlayer

        jmp gameLoop
        
        moveRight:
        call UpdatePlayer
        add xPos,1
        call DrawPlayer

        jmp gameLoop

    jmp gameLoop
    pauseScreen:
    call Clrscr

    mov eax,brown (black * 16)
        call SetTextColor
        mov dh,2
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause1
        call WriteString
        mov eax,brown (black * 16)
        call SetTextColor
        mov dh,3
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause2
        call WriteString
        mov eax,cyan (black * 16)
        call SetTextColor
        mov dh,4
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause3
        call WriteString
        mov eax,blue (black * 16)
        call SetTextColor
        mov dh,5
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause4
        call WriteString
        mov eax,red (black * 16)
        call SetTextColor
        mov dh,6
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause5
        call WriteString
        mov eax,green (black * 16)
        call SetTextColor
        mov dh,7
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause6
        call WriteString

    mov eax,brown ;(black * 16)
    call SetTextColor
    mov dl,50
    mov dh,10
    call Gotoxy
    mov edx,OFFSET resume
    call WriteString
     mov dl,50
    mov dh,12
    call Gotoxy
    mov edx,OFFSET gameclose
    call WriteString
    checkPauseAgain:
       call ReadChar
        mov inputChar,al
    cmp inputChar,"r"
    je resumeGame
    cmp inputChar,"x"
    je exitGame
    jmp checkPauseAgain
    instructionScreen:
     call Clrscr
    mov eax,brown ;(black * 16)
    call SetTextColor
    mov dl,10
    mov dh,10
    call Gotoxy
    mov edx,OFFSET ins1
    call WriteString
     mov dl,10
    mov dh,12
    call Gotoxy
    mov edx,OFFSET ins2
    call WriteString
     mov dl,10
    mov dh,14
    call Gotoxy
    mov edx,OFFSET ins3
    call WriteString
     mov dl,10
    mov dh,16
    call Gotoxy
    mov edx,OFFSET ins4
    call WriteString
    instructionScreen1:
       call ReadChar
        mov inputChar,al
    cmp inputChar,"i"
    je resumeGame
    cmp inputChar,"x"
    je exitGame
    jmp instructionScreen1 
    exitGame:
    call CreateScreen
      INVOKE PlaySound, OFFSET ending, NULL, SND_FILENAME
       mov eax,yellow ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,2
    call Gotoxy
    mov edx,OFFSET gameOver1
    call WriteString
    mov eax,red ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,3
    call Gotoxy
    mov edx,OFFSET gameOver2
    call WriteString
    mov eax,blue ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,4
    call Gotoxy
    mov edx,OFFSET gameOver3
    call WriteString
    mov eax,white ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,5
    call Gotoxy
    mov edx,OFFSET gameOver4
    call WriteString
    mov eax,cyan ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,6
    call Gotoxy
    mov edx,OFFSET gameOver5
    call WriteString
    mov eax,magenta ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,7
    call Gotoxy
    mov edx,OFFSET gameOver6
    call WriteString
      mov eax,brown ;(blue*16)
    call SetTextColor
          mov dl, 34
      mov dh, 13
      call Gotoxy
    mov edx, offset EnterName1
    call WriteString
    mov dl, 48
      mov dh, 13
      call Gotoxy
    mov edx, offset buffer  ; Set the buffer address for the entered string
    call WriteString    
     mov dl,34
        mov dh,15
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteInt
        mov dl,34
        mov dh,17
        call Gotoxy
        mov edx,OFFSET levelis
        call WriteString
        mov al,1
        call WriteInt
   

    exit
main ENDP

DrawPlayer PROC
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al,"X"
    call WriteChar
    ret
DrawPlayer ENDP

DrawGhost proc

; draw player at (xPos,yPos):
    mov eax,green ;(blue*16)
    call SetTextColor
    mov dl,xPostGhost
    mov dh,yPostGhost
    call Gotoxy
    mov al,"Y"
    call WriteChar

     mov eax,cyan ;(blue*16)
    call SetTextColor
    mov dl,xPostGhost1
    mov dh,yPostGhost1
    call Gotoxy
    mov al,"Z"
    call WriteChar

    mov eax,white ;(blue*16)
    call SetTextColor
    mov dl,xPostGhost2
    mov dh,yPostGhost2
    call Gotoxy
    mov al,"L"
    call WriteChar

     mov eax,red ;(blue*16)
    call SetTextColor
    mov dl,xPostGhost3
    mov dh,yPostGhost3
    call Gotoxy
    mov al,"M"
    call WriteChar

    ;call Delay
     mov eax,white ;(blue*16)
    call SetTextColor
    mov dl,xPostGhost4
    mov dh,yPostGhost4
    call Gotoxy
    mov al,"C"
    call WriteChar

    
ret
DrawGhost endP


DrawGhost2 proc
; draw player at (xPos,yPos):
    mov eax,green ;(blue*16)
    call SetTextColor
    mov dl,l3xPostGhost5
    mov dh,l3yPostGhost5
    call Gotoxy
    mov al,"F"
    call WriteChar

     mov eax,cyan ;(blue*16)
    call SetTextColor
    mov dl,l3xPostGhost6
    mov dh,l3yPostGhost6
    call Gotoxy
    mov al,"B"
    call WriteChar


ret
DrawGhost2 endP

DrawGhost1  proc

; draw player at (xPos,yPos):
    mov eax,green ;(blue*16)
    call SetTextColor
    mov dl,l2xPostGhost
    mov dh,l2yPostGhost
    call Gotoxy
    mov al,"Y"
    call WriteChar

     mov eax,cyan ;(blue*16)
    call SetTextColor
    mov dl,l2xPostGhost1
    mov dh,l2yPostGhost1
    call Gotoxy
    mov al,"Z"
    call WriteChar

    mov eax,white ;(blue*16)
    call SetTextColor
    mov dl,l2xPostGhost2
    mov dh,l2yPostGhost2
    call Gotoxy
    mov al,"L"
    call WriteChar

     mov eax,red ;(blue*16)
    call SetTextColor
    mov dl,l2xPostGhost3
    mov dh,l2yPostGhost3
    call Gotoxy
    mov al,"M"
    call WriteChar

    ;call Delay
     mov eax,white ;(blue*16)
    call SetTextColor
    mov dl,l2xPostGhost4
    mov dh,l2yPostGhost4
    call Gotoxy
    mov al,"C"
    call WriteChar

    
ret
DrawGhost1 endP

UpdateGhost PROC
    mov dl,xPostGhost
    mov dh,yPostGhost
    call Gotoxy
    mov al," "
    call WriteChar
    mov dl,xPostGhost1
    mov dh,yPostGhost1
    call Gotoxy
    mov al," "
    call WriteChar
    mov dl,xPostGhost2
    mov dh,yPostGhost2
    call Gotoxy
    mov al," "
    call WriteChar
     mov dl,xPostGhost3
    mov dh,yPostGhost3
    call Gotoxy
    mov al," "
    call WriteChar
    mov dl,xPostGhost4
    mov dh,yPostGhost4
    call Gotoxy
    mov al," "
    call WriteChar
    ret
UpdateGhost ENDP

UpdateGhost2 proc

    mov dl,l3xPostGhost5
    mov dh,l3yPostGhost5
    call Gotoxy
    mov al," "
    call WriteChar
    mov dl,l3xPostGhost6
    mov dh,l3yPostGhost6
    call Gotoxy
    mov al," "
    call WriteChar
ret
UpdateGhost2 endP

UpdateGhost1 PROC
    mov dl,l2xPostGhost
    mov dh,l2yPostGhost
    call Gotoxy
    mov al," "
    call WriteChar
    mov dl,l2xPostGhost1
    mov dh,l2yPostGhost1
    call Gotoxy
    mov al," "
    call WriteChar
    mov dl,l2xPostGhost2
    mov dh,l2yPostGhost2
    call Gotoxy
    mov al," "
    call WriteChar
     mov dl,l2xPostGhost3
    mov dh,l2yPostGhost3
    call Gotoxy
    mov al," "
    call WriteChar
    mov dl,l2xPostGhost4
    mov dh,l2yPostGhost4
    call Gotoxy
    mov al," "
    call WriteChar
    ret
UpdateGhost1 ENDP

UpdatePlayer PROC
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al," "
    call WriteChar
    ret
UpdatePlayer ENDP

DrawCoin PROC
mov ecx,10
mov al,xCoinPos
mov bl,yCoinPos
mov var1,al
mov var2,bl
    CoinCreation:
    
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,var1
    mov dh,yCoinPos
    add var1,1
    call Gotoxy
    mov al,"."
    call WriteChar

        mov bl,xPos
        cmp bl,var1
        jne bhag
        mov bl,yPos
        cmp bl,yCoinPos
  
        jne bhag
        
        ; player is intersecting coin:
    inc score
    
        bhag:
    loop CoinCreation
     cmp score,12
    ;jg createLevel2

    ret
DrawCoin ENDP

CreateRandomCoin PROC
    
    mov eax, 55
    inc eax
    call RandomRange
    mov xCoinPos, al 

    mov eax, 27
    inc eax
    call RandomRange
    mov yCoinPos, al 

    ret ; return from the procedure
CreateRandomCoin ENDP
 createLevel2 proc
 ;call Level3
 mov lives,3
 mov score,0
call createScreen
        

        mov eax,white (black * 16)
        call SetTextColor
   mov dh,1
        mov dl,20
         call Gotoxy
        mov edx,OFFSET level2maze1
        call WriteString
        
        mov eax,red (black * 16)
        call SetTextColor
         mov dh,2
        mov dl,20
         call Gotoxy
        mov edx,OFFSET level2maze2
        call WriteString
        
        mov eax,green (black * 16)
        call SetTextColor
        mov dh,3
        mov dl,20
         call Gotoxy
        mov edx,OFFSET level2maze3
        call WriteString
        
        mov eax,cyan (black * 16)
        call SetTextColor
         mov dh,4
        mov dl,20
         call Gotoxy
        mov edx,OFFSET level2maze4
        call WriteString
         mov dh,5
        mov dl,20
         call Gotoxy
        mov edx,OFFSET level2maze5
        call WriteString
        
        mov eax,brown (black * 16)
        call SetTextColor
        mov dh,6
        mov dl,20
         call Gotoxy
        mov edx,OFFSET level2maze6
        call WriteString
        
        mov eax,yellow (black * 16)
        call SetTextColor
          mov dh,7
        mov dl,20
         call Gotoxy
        mov edx,OFFSET level2maze7
        call WriteString
        
        mov eax,green (black * 16)
        call SetTextColor
         mov dh,8
        mov dl,20
         call Gotoxy
        mov edx,OFFSET level2maze8
        call WriteString
        
        mov eax,1001b (black * 16)
        call SetTextColor
         mov dh,9
        mov dl,20
         call Gotoxy
        mov edx,OFFSET level2maze9
        call WriteString
        
        mov eax,magenta (black * 16)
        call SetTextColor
         mov dh,9
        mov dl,20
         call Gotoxy
        mov edx,OFFSET level2maze10
        call WriteString

        


     mov eax,white ;(black * 16)
    call SetTextColor
    mov var1,17
    mov dh,10
    mov ecx,5
    loop255:
    mov dl,111
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop255
     mov var1,17
    mov dh,10
    mov ecx,5
    loop266:
    mov dl,113
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop266
     mov dl,112          ;horizontal
    mov dh,16           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
      mov dl,112          ;horizontal
    mov dh,21           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

    mov eax,0110b ;(black * 16)
    call SetTextColor
    mov dl,48          ;horizontal
    mov dh,17          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,52          ;horizontal
    mov dh,17          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,55          ;horizontal
    mov dh,17          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,58          ;horizontal
    mov dh,17          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,66          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    mov dl,48          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,52          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString 
     mov dl,55          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
      mov dl,58          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,47          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    
    mov eax,0100b ;(black * 16)
    call SetTextColor
    mov dl,48          ;horizontal
    mov dh,20          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,52          ;horizontal
    mov dh,20          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,55          ;horizontal
    mov dh,20          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,58          ;horizontal
    mov dh,20          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,66          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    mov dl,48          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,52          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString 
     mov dl,55          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
      mov dl,58          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,47          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString


    mov eax,1010b ;(black * 16)
    call SetTextColor
    mov dl,86          ;horizontal
    mov dh,20          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,90          ;horizontal
    mov dh,20          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,93          ;horizontal
    mov dh,20          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,96          ;horizontal
    mov dh,20          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,104          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    mov dl,86          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,90          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString 
     mov dl,93          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
      mov dl,96         ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,85          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    mov eax,1001b ;(black * 16)
    call SetTextColor
    mov dl,86          ;horizontal
    mov dh,17          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,90          ;horizontal
    mov dh,17          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,93          ;horizontal
    mov dh,17          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,96          ;horizontal
    mov dh,17          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,104          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    mov dl,86          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,90          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString 
     mov dl,93          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
      mov dl,96         ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,85          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

        mov eax,1100b ;(black * 16)
    call SetTextColor
    mov dl,12          ;horizontal
    mov dh,17          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,16          ;horizontal
    mov dh,17          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,19          ;horizontal
    mov dh,17          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,22          ;horizontal
    mov dh,17          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,30          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    mov dl,12          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,16          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString 
     mov dl,19          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
      mov dl,22         ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,11          ;horizontal
    mov dh,18          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

          mov eax,1011b ;(black * 16)
    call SetTextColor
    mov dl,12          ;horizontal
    mov dh,20          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,16          ;horizontal
    mov dh,20          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
     mov dl,19          ;horizontal
    mov dh,20          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,22          ;horizontal
    mov dh,20          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,30          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString

    mov dl,12          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,16          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString 
     mov dl,19          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
      mov dl,22         ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET welcomeMsg5
    call WriteString
    mov dl,11          ;horizontal
    mov dh,21          ;VERTICAL
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString
    
        mov eax,white (black * 16)
        call SetTextColor
      mov var1,6
    mov ecx,9
     Level2Walls2:   
     mov dl,var1          ;horizontal
    add var1,12
    mov dh,27           ;VERTICAL
    ;add dl,5
    call Gotoxy
    mov edx,OFFSET welcomeMsg10
    call WriteString
    loop Level2Walls2
    mov var1,6
    mov ecx,9
     Level2Walls1:   
     mov dl,var1          ;horizontal
    add var1,12
    mov dh,28           ;VERTICAL
    ;add dl,5
    call Gotoxy
    mov edx,OFFSET welcomeMsg10
    call WriteString
    loop Level2Walls1
 
        mov dl,3          ;horizontal 
    mov dh,28           ;VERTICAL

    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
           mov dl,4         ;horizontal 
    mov dh,28           ;VERTICAL

    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
          mov dl,5         ;horizontal 
    mov dh,28           ;VERTICAL

    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
      mov dl,4         ;horizontal 
    mov dh,28           ;VERTICAL

    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

          mov dl,115        ;horizontal 
    mov dh,28           ;VERTICAL

    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
 
     

        mov dl,116        ;horizontal 
    mov dh,27           ;VERTICAL

    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

     mov var1,1
    mov ecx,28
        Level2Walls3:
         mov dl,2
    mov dh,var1
    inc var1
    call Gotoxy
    mov edx,offset verticalLine
    call WriteString
    loop Level2Walls3
      
      mov var1,1
    mov ecx,27
        Level2Walls4:


         mov dl,4
    mov dh,var1
    inc var1
    call Gotoxy
    mov edx,offset verticalLine
    call WriteString
    loop Level2Walls4
        
           mov var1,1
    mov ecx,28
        Level2Walls5:
         mov dl,117
    mov dh,var1
    inc var1
    call Gotoxy
    mov edx,offset verticalLine
    call WriteString
    loop Level2Walls5
        
               mov var1,1
    mov ecx,27
        Level2Walls6:
         mov dl,115
    mov dh,var1
    inc var1
    call Gotoxy
    mov edx,offset verticalLine
    call WriteString
    loop Level2Walls6
      
    
   mov eax,WHITE ;(black * 16)
    call SetTextColor
    mov var1,2
    mov dh,9
    mov ecx,8
    loop222:
    mov dl,7
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop222
    call SetTextColor
    mov var1,2
    mov dh,8
    mov ecx,8
    loop223:
    mov dl,9
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop223    

    mov dl,8
    mov dh,9
    add var1,1
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

    mov dl,8
    mov dh,1
    add var1,1
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

     mov dl,96
    mov dh,9
    add var1,1
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

    mov dl,96
    mov dh,1
    add var1,1
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

     mov dl,106
    mov dh,9
    add var1,1
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

    mov dl,106
    mov dh,1
    add var1,1
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString


      mov var1,2
    mov dh,9
    mov ecx,8
    loop228:
    mov dl,105
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop228
    call SetTextColor
    mov var1,2
    mov dh,8
    mov ecx,8
    loop227:
    mov dl,107
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop227    


    mov var1,2
    mov dh,9
    mov ecx,8
    loop224:
    mov dl,95
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop224
    call SetTextColor
    mov var1,2
    mov dh,8
    mov ecx,8
    loop225:
    mov dl,97
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop225



     mov eax,1010b ;(black * 16)
    call SetTextColor
    mov var1,17
    mov dh,10
    mov ecx,5
    loop221:
    mov dl,36
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop221
     mov var1,17
    mov dh,10
    mov ecx,5
    loop212:
    mov dl,38
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop212
     mov dl,37          ;horizontal
    mov dh,16           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
      mov dl,37          ;horizontal
    mov dh,21           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

    mov eax,0011b ;(black * 16)
    call SetTextColor
    mov var1,17
    mov dh,10
    mov ecx,5
    loop232:
    mov dl,76
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop232
     mov var1,17
    mov dh,10
    mov ecx,5
    loop242:
    mov dl,78
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop242
     mov dl,77          ;horizontal
    mov dh,16           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
      mov dl,77          ;horizontal
    mov dh,21           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

    mov eax,1011b ;(black * 16)
    call SetTextColor
    mov var1,17
    mov dh,10
    mov ecx,5
    loop322:
    mov dl,5
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop322
     mov var1,17
    mov dh,10
    mov ecx,5
    loop311:
    mov dl,7
    mov dh,var1
    add var1,1
    call Gotoxy
    mov edx,OFFSET verticalLine
    call WriteString    
    loop loop311
     mov dl,6          ;horizontal
    mov dh,16           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString
      mov dl,6         ;horizontal
    mov dh,21           ;VERTICAL
    call Gotoxy
    mov edx,OFFSET horizontalLine1
    call WriteString

    call DrawGhost1 
    call CoinCreateLeve2
    call ReadChar

ret
createLevel2 endP
CoinCreateLeve2 proc
mov l2xCoinPos,10
mov l2yCoinPos,25
mov al,l2xCoinPos
mov bl,l2yCoinPos
mov var1,al
mov var2,bl
mov ecx,50
    CoinCreation:
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,var1
    mov dh,l2yCoinPos
    add var1,1
    call Gotoxy
    mov al,"."
    call WriteChar  
    inc var1
    mov dl,var1
    mov dh,l2yCoinPos
    call Gotoxy
    mov al," "
    call WriteChar
    loop CoinCreation

      mov l2xCoinPos1,10
        mov l2yCoinPos1,14
    mov al,l2xCoinPos1
mov bl,l2yCoinPos1
mov var1,al
mov var2,bl
mov ecx,50 
    CoinCreation1:
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,var1 
    mov dh,l2yCoinPos1
    add var1,1
    call Gotoxy
    mov al,"."
    call WriteChar  
    inc var1
    mov dl,var1
    mov dh,l2yCoinPos1
    call Gotoxy
    mov al," "
    call WriteChar
    loop CoinCreation1

          mov l2xCoinPos3,33
        mov l2yCoinPos3,14
    mov al,l2xCoinPos3
mov bl,l2yCoinPos3
mov var1,al
mov var2,bl
mov ecx,6 
    CoinCreation2:
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,l2xCoinPos3 
    mov dh,var2
    add var2,1  
    call Gotoxy
    mov al,"."
    call WriteChar  
    inc var2
    mov dl,l2xCoinPos3
    mov dh,var2
    call Gotoxy
    mov al," "
    call WriteChar
    loop CoinCreation2

      mov l2xCoinPos3,42
        mov l2yCoinPos3,14
    mov al,l2xCoinPos3
mov bl,l2yCoinPos3
mov var1,al
mov var2,bl
mov ecx,6 
    CoinCreation3:
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,l2xCoinPos3 
    mov dh,var2
    add var2,1  
    call Gotoxy
    mov al,"."
    call WriteChar  
    inc var2
    mov dl,l2xCoinPos3
    mov dh,var2
    call Gotoxy
    mov al," "
    call WriteChar
    loop CoinCreation3

    ;---------------------------Draw Fruits-------------------
     mov eax,yellow+(red*16) ;(red * 16)
    call SetTextColor
    mov xFruitPos,35
    mov yFruitPos,8
    mov dl,xFruitPos
    mov dh,yFruitPos
    call Gotoxy
    mov edx,OFFSET fruit
    call WriteString

      mov eax,blue+(brown*16) ;(red * 16)
    call SetTextColor
    call SetTextColor
    mov xFruitPos1,70
    mov yFruitPos1,18
    mov dl,xFruitPos1
    mov dh,yFruitPos1
    call Gotoxy
    mov edx,OFFSET fruit
    call WriteString

         mov eax,green+(white*16) ;(red * 16)
    call SetTextColor
    call SetTextColor
    mov xFruitPos2,110
    mov yFruitPos2,15
    mov dl,xFruitPos2
    mov dh,yFruitPos2
    call Gotoxy
    mov edx,OFFSET fruit
    call WriteString


     mov score,0
     mov lives,3
 call DrawPlayer
    l2gameLoop:
   
        cmp score,10
        jg Level3
      cmp lives,0
    jl exitGame
     mov ecx,10
 UprJa:
 mov eax,15
 ;call Delay
 call UpdateGhost1
        inc l2yPostGhost
        inc l2yPostGhost1
        inc l2xPostGhost2
        inc l2xPostGhost3
        inc l2yPostGhost4
        call DrawGhost1  
 loop UprJa
  mov ecx,10
 NecheJa:
 mov eax,15
 ;call Delay
 call UpdateGhost1
        dec l2yPostGhost
        dec l2yPostGhost1
        dec l2xPostGhost2
        dec l2xPostGhost3
        dec l2yPostGhost4
        call DrawGhost1  
 loop NecheJa
 jmp l2PlayerLoop
; loop l2gameLoop
 l2PlayerLoop:
  mov al,yPos
 cmp al,l2yPostGhost
 je LifeDown
  mov al,yPos
 cmp al,l2yPostGhost1
 je LifeDown
 mov al,yPos
 cmp al,l2yPostGhost2
 je LifeDown
 mov al,yPos
 cmp al,l2yPostGhost3
 je LifeDown
 mov al,yPos
 cmp al,l2yPostGhost4
 je LifeDown
 jmp Notdown
 LifeDown:
 mov bl,l2xPostGhost
 cmp bl,xPos
 je LifeDown1
 mov bl,l2xPostGhost1
 cmp bl,xPos
 je LifeDown1
 mov bl,l2xPostGhost2
 cmp bl,xPos
 je LifeDown1
 mov bl,l2xPostGhost3
 cmp bl,xPos
 je LifeDown1
 mov bl,l2xPostGhost4
 cmp bl,xPos
 je LifeDown1
 jmp Notdown
 LifeDown1:
        dec lives
Notdown:
 ;INVOKE PlaySound, OFFSET movementSound, NULL, SND_ALIAS
  mov bl,xPos
        cmp bl,l2xCoinPos
        jne bhag
        mov bl,yPos
        cmp bl,l2yCoinPos
        jne bhag
        inc score
        cmp temp1,30
        jl increase
        jmp bhag
        increase:
          inc l2xCoinPos
          inc l2xCoinPos
        inc score
         INVOKE PlaySound, OFFSET scoreSound, NULL, SND_ALIAS   
        inc temp1
        ; player is intersecting coin:
    
        bhag:
        mov bl,xPos
        cmp bl,l2xCoinPos1
        jne bhag1
        mov bl,yPos
        cmp bl,l2yCoinPos1
        jne bhag1
        cmp temp1,70
        jl increase1
        jmp bhag1
        increase1:
          inc l2xCoinPos1
          inc l2xCoinPos1
        inc score
        INVOKE PlaySound, OFFSET scoreSound, NULL, SND_ALIAS
        inc temp1
    

       
   
       ; call DrawCoin
        ; getting points:
       ; mov bl,xPos
      ;  cmp bl,xCoinPos
      ;  jne notCollecting
       ; mov bl,yPos
        ;cmp bl,yCoinPos
        ;jne notCollecting
        ; player is intersecting coin:
       ; inc score



       bhag1: 

       mov al,"X"
       mov bl,"."
       cmp al,bl
       je addScore

          mov bl,xPos
      cmp bl,xFruitPos
      je FruitInc
      cmp bl,xFruitPos1
      je FruitInc
      cmp bl,xFruitPos2
      je FruitInc
      jmp bhag2
      FruitInc:
       mov bl,yPos
      cmp bl,yFruitPos
      je FruitInc1
      cmp bl,yFruitPos1
      je FruitInc1
      cmp bl,yFruitPos2
      je FruitInc1
       jmp bhag2
      FruitInc1:
      add score,5
       INVOKE PlaySound, OFFSET file, NULL, SND_ALIAS
       addScore:
       inc score


      bhag2:
        ;call CreateRandomCoin
        
      ;  notCollecting:

        mov eax,white (black * 16)
        call SetTextColor

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteInt

       
       mov eax,white + (red * 16) ;(black * 16)
        call SetTextColor
        mov dh,0
        mov dl,114
    ;call Randomize
     mov dl,100
        mov dh,0
        call Gotoxy
        mov edx,OFFSET liveString
        call WriteString
          mov al,lives
        call WriteInt

        mov eax,white;
        call SetTextColor

        ; gravity logic:
        gravity:
        cmp yPos,0
        jg onGround
        ; make player fall:
        call UpdatePlayer
        inc yPos                
        call DrawPlayer
        mov eax,80
        ;call Delay
        jmp gravity
        onGround:

        ; get user key input:
        call ReadChar
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame
        
        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight

        cmp inputChar,"p"
        je  pauseScreen

        moveUp:
        mov dl,10
        mov dh,10
        ; allow player to jump:
        mov ecx,1
        
        jumpLoop:
            call UpdatePlayer
            sub yPos,1
            
            call DrawPlayer
            ;mov eax,70
            ;call Delay
        loop jumpLoop
        jmp l2gameLoop
        jmp l2PlayerLoop
         
        moveDown:
        call UpdatePlayer
        add yPos,1
        call DrawPlayer
        jmp l2gameLoop
        jmp l2PlayerLoop
         jmp l2gameLoop
        moveLeft:
        call UpdatePlayer
        sub xPos,1
        call DrawPlayer
        jmp l2gameLoop
        jmp l2PlayerLoop
         jmp l2gameLoop
        
        moveRight:
        call UpdatePlayer
        add xPos,1
        call DrawPlayer
        jmp l2gameLoop
        jmp l2PlayerLoop


  
 jmp l2gameLoop

    pauseScreen:
    call Clrscr
      mov eax,brown (black * 16)
        call SetTextColor
        mov dh,2
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause1
        call WriteString
        mov eax,brown (black * 16)
        call SetTextColor
        mov dh,3
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause2
        call WriteString
        mov eax,cyan (black * 16)
        call SetTextColor
        mov dh,4
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause3
        call WriteString
        mov eax,blue (black * 16)
        call SetTextColor
        mov dh,5
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause4
        call WriteString
        mov eax,red (black * 16)
        call SetTextColor
        mov dh,6
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause5
        call WriteString
        mov eax,green (black * 16)
        call SetTextColor
        mov dh,7
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause6
        call WriteString
    mov eax,brown ;(black * 16)
    call SetTextColor
    mov dl,50
    mov dh,10
    call Gotoxy
    mov edx,OFFSET resume
    call WriteString
     mov dl,50
    mov dh,12
    call Gotoxy
    mov edx,OFFSET gameclose
    call WriteString
    checkPauseAgain:
       call ReadChar
        mov inputChar,al
    ;cmp inputChar,"r"
    ;je resumeGame
    cmp inputChar,"x"
    je exitGame
    jmp checkPauseAgain

    exitGame:
     call CreateScreen
      INVOKE PlaySound, OFFSET ending, NULL, SND_FILENAME
    mov eax,yellow ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,2
    call Gotoxy
    mov edx,OFFSET gameOver1
    call WriteString
    mov eax,red ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,3
    call Gotoxy
    mov edx,OFFSET gameOver2
    call WriteString
    mov eax,blue ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,4
    call Gotoxy
    mov edx,OFFSET gameOver3
    call WriteString
    mov eax,white ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,5
    call Gotoxy
    mov edx,OFFSET gameOver4
    call WriteString
    mov eax,cyan ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,6
    call Gotoxy
    mov edx,OFFSET gameOver5
    call WriteString
    mov eax,magenta ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,7
    call Gotoxy
    mov edx,OFFSET gameOver6
    call WriteString
      mov eax,brown ;(blue*16)
    call SetTextColor
          mov dl, 34
      mov dh, 13
      call Gotoxy
    mov edx, offset EnterName1
    call WriteString
    mov dl, 48
      mov dh, 13
      call Gotoxy
    mov edx, offset buffer  ; Set the buffer address for the entered string
    call WriteString    
     mov dl,34
        mov dh,15
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteInt

    mov dl,34
        mov dh,17
        call Gotoxy
        mov edx,OFFSET levelis
        call WriteString
        mov al,2
        call WriteInt
        ;call Level3
      
    exit

    ret
CoinCreateLeve2 endP
Level3 proc
mov lives,3
 mov score,0

    
   mov l3xPostGhost5,30
  mov l3yPostGhost5,5
  mov l3xPostGhost6,63
  mov l3yPostGhost6,6
    mov l2xPostGhost3,8
    mov l2yPostGhost3,13
       mov l2xPostGhost1,63
    mov l2yPostGhost1,14
       mov l2xPostGhost,105
    mov l2yPostGhost,5
       mov l2xPostGhost4,115
    mov l2yPostGhost4,5
      mov l2xPostGhost2,40
    mov l2yPostGhost2,2

     
mov score,0
   call createScreen
        mov xPos,10
        mov yPos,14
        call createUpperWaliDewar

         mov eax,white (black * 16)
         mov ecx,10
         mov var1,5
        level3Dewar1:
        call SetTextColor
        mov dh,15
        mov dl,var1
        add var1,5
         call Gotoxy
        mov edx,OFFSET welcomeMsg5
        call WriteString
        loop level3Dewar1
         mov ecx,10
        mov var1,5
        level3Dewar2:
        mov dh,16
       
        mov dl,var1
        add var1,5
         call Gotoxy
        mov edx,OFFSET welcomeMsg5
        call WriteString
        loop level3Dewar2
        mov dh,16
        mov dl,4
         call Gotoxy
        mov edx,OFFSET verticalLine
        call WriteString
          mov dh,16
        mov dl,58
         call Gotoxy
        mov edx,OFFSET verticalLine
        call WriteString

          mov dh,16
        mov dl,69
         call Gotoxy
        mov edx,OFFSET verticalLine
        call WriteString

         mov dh,1
        mov dl,120
         call Gotoxy
        mov edx,OFFSET verticalLine
        call WriteString

        mov ecx,9
         mov var1,70
             level3Dewar3:
        mov dh,15
        mov dl,var1
        add var1,5
         call Gotoxy
        mov edx,OFFSET welcomeMsg5
        call WriteString
        loop level3Dewar3
       mov ecx,9
         mov var1,70
             level3Dewar4:
        mov dh,16
        mov dl,var1
        add var1,5
         call Gotoxy
        mov edx,OFFSET welcomeMsg5
        call WriteString
        loop level3Dewar4

        mov var1,19
        mov ecx,5
        level3Dewar5:
        mov dh,var1
        mov dl,2
        add var1,1
        call Gotoxy
        mov edx,OFFSET verticalLine
        call WriteString
        loop level3Dewar5

        mov var1,19
        mov ecx,5
        level3Dewar6:
        mov dh,var1
        mov dl,4
        add var1,1
        call Gotoxy
        mov edx,OFFSET verticalLine
        call WriteString
        loop level3Dewar6

        
 
        mov var1,19
        mov ecx,5
        level3Dewar7:
        mov dh,var1
        mov dl,117
        add var1,1
        call Gotoxy
        mov edx,OFFSET verticalLine
        call WriteString
        loop level3Dewar7

          mov var1,19
        mov ecx,5
        level3Dewar8:
        mov dh,var1
        mov dl,115
        add var1,1
        call Gotoxy
        mov edx,OFFSET verticalLine
        call WriteString
        loop level3Dewar8


          mov ecx,10
         mov var1,5
        level3Dewar9:
        call SetTextColor
        mov dh,3
        mov dl,var1
        add var1,5
         call Gotoxy
        mov edx,OFFSET welcomeMsg5
        call WriteString
        loop level3Dewar9
         mov ecx,10
        mov var1,5
        level3Dewar10:
        mov dh,4
       
        mov dl,var1
        add var1,5
         call Gotoxy
        mov edx,OFFSET welcomeMsg5
        call WriteString
        loop level3Dewar10
        mov dh,4
        mov dl,4
         call Gotoxy
        mov edx,OFFSET verticalLine
        call WriteString
          mov dh,4
        mov dl,58
         call Gotoxy
        mov edx,OFFSET verticalLine
        call WriteString

          mov dh,4
        mov dl,69
         call Gotoxy
        mov edx,OFFSET verticalLine
        call WriteString

         mov dh,1
        mov dl,120
         call Gotoxy
        mov edx,OFFSET verticalLine
        call WriteString

        mov ecx,9
         mov var1,70
             level3Dewar11:
        mov dh,3
        mov dl,var1
        add var1,5
         call Gotoxy
        mov edx,OFFSET welcomeMsg5
        call WriteString
        loop level3Dewar11
       mov ecx,9
         mov var1,70
             level3Dewar12:
        mov dh,4
        mov dl,var1
        add var1,5
         call Gotoxy
        mov edx,OFFSET welcomeMsg5
        call WriteString
        loop level3Dewar12

        

        mov eax,white (black * 16)
        call SetTextColor
        mov dh,18
        mov dl,15
         call Gotoxy
        mov edx,OFFSET level3maze1
        call WriteString
        
        mov eax,red (black * 16)
        call SetTextColor
         mov dh,19
        mov dl,15
         call Gotoxy
        mov edx,OFFSET level3maze2
        call WriteString
        
        mov eax,green (black * 16)
        call SetTextColor
        mov dh,20
        mov dl,15
         call Gotoxy
        mov edx,OFFSET level3maze3
        call WriteString
        
        mov eax,cyan (black * 16)
        call SetTextColor
         mov dh,21
        mov dl,15
         call Gotoxy
        mov edx,OFFSET level3maze4
        call WriteString
         mov dh,22
        mov dl,15
         call Gotoxy
        mov edx,OFFSET level3maze5
        call WriteString
        
        mov eax,brown (black * 16)
        call SetTextColor
        mov dh,23
        mov dl,15
         call Gotoxy
        mov edx,OFFSET level3maze6
        call WriteString
        
        mov eax,yellow (black * 16)
        call SetTextColor
          mov dh,24
        mov dl,15
         call Gotoxy
        mov edx,OFFSET level3maze7
        call WriteString

        mov l3xCoinPos,10
mov l3yCoinPos,2
mov al,l3xCoinPos
mov bl,l3yCoinPos
mov var1,al
mov var2,bl
mov ecx,50
    CoinCreation:
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,var1
    mov dh,l3yCoinPos
    add var1,1
    call Gotoxy
    mov al,"."
    call WriteChar  
    inc var1
    mov dl,var1
    mov dh,l3yCoinPos
    call Gotoxy
    mov al," "
    call WriteChar
    loop CoinCreation

      mov l3xCoinPos1,10
        mov l3yCoinPos1,14
    mov al,l3xCoinPos1
mov bl,l3yCoinPos1
mov var1,al
mov var2,bl
mov ecx,50 
    CoinCreation1:
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,var1 
    mov dh,l3yCoinPos1
    add var1,1
    call Gotoxy
    mov al,"."
    call WriteChar  
    inc var1
    mov dl,var1
    mov dh,l3yCoinPos1
    call Gotoxy
    mov al," "
    call WriteChar
    loop CoinCreation1

          mov l3xCoinPos3,64
        mov l3yCoinPos3,14
    mov al,l3xCoinPos3
mov bl,l3yCoinPos3
mov var1,al
mov var2,bl
mov ecx,6 
    CoinCreation2:
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,l3xCoinPos3 
    mov dh,var2
    add var2,1  
    call Gotoxy
    mov al,"."
    call WriteChar  
    inc var2
    mov dl,l3xCoinPos3
    mov dh,var2
    call Gotoxy
    mov al," "
    call WriteChar
    loop CoinCreation2

      mov l3xCoinPos3,64
        mov l3yCoinPos3,3
    mov al,l3xCoinPos3
mov bl,l3yCoinPos3
mov var1,al
mov var2,bl
mov ecx,6 
    CoinCreation3:
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,l3xCoinPos3 
    mov dh,var2
    add var2,1  
    call Gotoxy
    mov al,"."
    call WriteChar  
    inc var2
    mov dl,l3xCoinPos3
    mov dh,var2
    call Gotoxy
    mov al," "
    call WriteChar
    loop CoinCreation3

    mov l3xCoinPos4,115
        mov l3yCoinPos4,6
    mov al,l3xCoinPos4
mov bl,l3yCoinPos4
mov var1,al
mov var2,bl
mov ecx,5
    CoinCreation4:
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,l3xCoinPos4 
    mov dh,var2
    add var2,1  
    call Gotoxy
    mov al,"."
    call WriteChar  
    inc var2
    mov dl,l3xCoinPos4
    mov dh,var2
    call Gotoxy
    mov al," "
    call WriteChar
    loop CoinCreation4

     ;---------------------------Draw Fruits-------------------
     mov eax,yellow+(red*16) ;(red * 16)
    call SetTextColor
    mov xFruitPos,52
    mov yFruitPos,10
    mov dl,xFruitPos
    mov dh,yFruitPos
    call Gotoxy
    mov edx,OFFSET fruit
    call WriteString

      mov eax,blue+(brown*16) ;(red * 16)
    call SetTextColor
    call SetTextColor
    mov xFruitPos1,90
    mov yFruitPos1,10
    mov dl,xFruitPos1
    mov dh,yFruitPos1
    call Gotoxy
    mov edx,OFFSET fruit
    call WriteString

         mov eax,green+(white*16) ;(red * 16)
    call SetTextColor
    call SetTextColor
    mov xFruitPos2,16
    mov yFruitPos2,10
    mov dl,xFruitPos2
    mov dh,yFruitPos2
    call Gotoxy
    mov edx,OFFSET fruit
    call WriteString

     call DrawPlayer
      l2gameLoop:
      cmp lives,0
      jl exitGame
     mov ecx,10
 UprJa:
 mov eax,15
 call Delay
 call UpdateGhost1
 call UpdateGhost2
        inc l2yPostGhost
        inc l2yPostGhost1
        inc l2xPostGhost2
        inc l2xPostGhost3
        inc l2yPostGhost4
          inc l3xPostGhost6
        inc l3yPostGhost5
        call DrawGhost1  
        call DrawGhost2
 loop UprJa
  mov ecx,10
 NecheJa:
 mov eax,15
 call Delay
 call UpdateGhost1
 call UpdateGhost2
        dec l2yPostGhost
        dec l2yPostGhost1
        dec l2xPostGhost2
        dec l2xPostGhost3
        dec l2yPostGhost4
         dec l3xPostGhost6
        dec l3yPostGhost5
        call DrawGhost1  
        call DrawGhost2
 loop NecheJa
 jmp l2PlayerLoop
; loop l2gameLoop
 l2PlayerLoop:
  mov al,yPos
 cmp al,l2yPostGhost
 je LifeDown
  mov al,yPos
 cmp al,l2yPostGhost1
 je LifeDown
 mov al,yPos
 cmp al,l2yPostGhost2
 je LifeDown
 mov al,yPos
 cmp al,l2yPostGhost3
 je LifeDown
 mov al,yPos
 cmp al,l2yPostGhost4
 je LifeDown
 mov al,yPos
 cmp al,l3yPostGhost5
 je LifeDown
 mov al,yPos
 cmp al,l3yPostGhost6
 je LifeDown
 jmp Notdown
 LifeDown:
 mov bl,l2xPostGhost
 cmp bl,xPos
 je LifeDown1
 mov bl,l2xPostGhost1
 cmp bl,xPos
 je LifeDown1
 mov bl,l2xPostGhost2
 cmp bl,xPos
 je LifeDown1
 mov bl,l2xPostGhost3
 cmp bl,xPos
 je LifeDown1
 mov bl,l2xPostGhost4
 cmp bl,xPos
 je LifeDown1
 mov bl,l3xPostGhost5
 cmp bl,xPos
 je LifeDown1       
  mov bl,l3xPostGhost6
 cmp bl,xPos
 je LifeDown1
 jmp Notdown
 LifeDown1:
        dec lives
        Notdown:
  ;INVOKE PlaySound, OFFSET movementSound, NULL, SND_ALIAS
 cmp xPos,11
 je Teleport
 cmp xPos,50
 je Teleport
 jmp cont
 Teleport:
 cmp yPos,14
 je Teleport1
 cmp yPos,14
 je Teleport1
 jmp cont
 Teleport1:
 call UpdatePlayer
 mov xPos,3
 mov yPos,5
 
 cont:
  mov bl,xPos
        cmp bl,l3xCoinPos
        jne bhag
        mov bl,yPos
        cmp bl,l3yCoinPos
        jne bhag
        ;inc score
        cmp temp1,30
        jl increase
        jmp bhag
        increase:
          inc l3xCoinPos
          inc l3xCoinPos
        inc score
         INVOKE PlaySound, OFFSET scoreSound, NULL, SND_ALIAS   
        inc temp1
        ; player is intersecting coin:
    
        bhag:
        mov bl,xPos
        cmp bl,l3xCoinPos1
        jne bhag1
        mov bl,yPos
        cmp bl,l3yCoinPos1
        jne bhag1
        cmp temp1,70
        jl increase1
        jmp bhag1
        increase1:
          inc l3xCoinPos1
          inc l3xCoinPos1
        inc score
        INVOKE PlaySound, OFFSET scoreSound, NULL, SND_ALIAS
        inc temp1
       bhag1: 
         mov bl,xPos
        cmp bl,l3xCoinPos3
        jne bhag3
        mov bl,yPos
        cmp bl,l3yCoinPos3
        jne bhag3
        cmp temp1,100
        jl increase2
        jmp bhag3
        increase2:
          inc l3yCoinPos3
          inc l3yCoinPos3
        inc score
        INVOKE PlaySound, OFFSET scoreSound, NULL, SND_ALIAS
        inc temp1
              bhag3: 
         mov bl,xPos
        cmp bl,l3xCoinPos4
        jne bhag4
        mov bl,yPos
        cmp bl,l3yCoinPos4
        jne bhag4
        cmp temp1,100
        jl increase3
        jmp bhag4
        increase3:
          inc l3yCoinPos4
          inc l3yCoinPos4
        inc score
        INVOKE PlaySound, OFFSET scoreSound, NULL, SND_ALIAS
        inc temp1
        bhag4:
          mov bl,xPos
      cmp bl,xFruitPos
      je FruitInc
      cmp bl,xFruitPos1
      je FruitInc
      cmp bl,xFruitPos2
      je FruitInc
      jmp bhag2
      FruitInc:
       mov bl,yPos
      cmp bl,yFruitPos
      je FruitInc1
      cmp bl,yFruitPos1
      je FruitInc1
      cmp bl,yFruitPos2
      je FruitInc1
       jmp bhag2
      FruitInc1:
      add score,5
       INVOKE PlaySound, OFFSET file, NULL, SND_ALIAS
      


      bhag2:
        ;call CreateRandomCoin
        
      ;  notCollecting:

        mov eax,white (black * 16)
        call SetTextColor

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteInt

        mov eax,white + (red * 16) ;(black * 16)
        call SetTextColor
        mov dh,0
        mov dl,114
    ;call Randomize
     mov dl,100
        mov dh,0
        call Gotoxy
        mov edx,OFFSET liveString
        call WriteString
          mov al,lives
        call WriteInt
       

        mov eax,white;
        call SetTextColor

        ; gravity logic:
        gravity:
        cmp yPos,0
        jg onGround
        ; make player fall:
        call UpdatePlayer
        inc yPos                
        call DrawPlayer
        mov eax,80
        ;call Delay
        jmp gravity
        onGround:

        ; get user key input:
        call ReadChar
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame
        
        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight

        cmp inputChar,"p"
        je  pauseScreen

        moveUp:
        mov dl,10
        mov dh,10
        ; allow player to jump:
        mov ecx,1
        
        jumpLoop:
            call UpdatePlayer
            sub yPos,1
            
            call DrawPlayer
            ;mov eax,70
            ;call Delay
        loop jumpLoop
        jmp l2gameLoop
        jmp l2PlayerLoop
         
        moveDown:
        call UpdatePlayer
        add yPos,1
        call DrawPlayer
        jmp l2gameLoop
        jmp l2PlayerLoop
         jmp l2gameLoop
        moveLeft:
        call UpdatePlayer
        sub xPos,1
        call DrawPlayer
        jmp l2gameLoop
        jmp l2PlayerLoop
         jmp l2gameLoop
        
        moveRight:
        call UpdatePlayer
        add xPos,1
        call DrawPlayer

        jmp l2gameLoop
        jmp l2PlayerLoop


  
 jmp l2gameLoop

    pauseScreen:
    call Clrscr
      mov eax,brown (black * 16)
        call SetTextColor
        mov dh,2
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause1
        call WriteString
        mov eax,brown (black * 16)
        call SetTextColor
        mov dh,3
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause2
        call WriteString
        mov eax,cyan (black * 16)
        call SetTextColor
        mov dh,4
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause3
        call WriteString
        mov eax,blue (black * 16)
        call SetTextColor
        mov dh,5
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause4
        call WriteString
        mov eax,red (black * 16)
        call SetTextColor
        mov dh,6
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause5
        call WriteString
        mov eax,green (black * 16)
        call SetTextColor
        mov dh,7
        mov dl,20
         call Gotoxy
        mov edx,OFFSET pause6
        call WriteString
    mov eax,brown ;(black * 16)
    call SetTextColor
    mov dl,50
    mov dh,10
    call Gotoxy
    mov edx,OFFSET resume
    call WriteString
     mov dl,50
    mov dh,12
    call Gotoxy
    mov edx,OFFSET gameclose
    call WriteString
    checkPauseAgain:
       call ReadChar
        mov inputChar,al
    ;cmp inputChar,"r"
    ;je resumeGame
    cmp inputChar,"x"
    je exitGame
    jmp checkPauseAgain

    exitGame:
     call CreateScreen
     INVOKE PlaySound, OFFSET ending, NULL, SND_FILENAME
                     
        mov eax,yellow ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,2
    call Gotoxy
    mov edx,OFFSET gameOver1
    call WriteString
    mov eax,red ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,3
    call Gotoxy
    mov edx,OFFSET gameOver2
    call WriteString
    mov eax,blue ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,4
    call Gotoxy
    mov edx,OFFSET gameOver3
    call WriteString
    mov eax,white ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,5
    call Gotoxy
    mov edx,OFFSET gameOver4
    call WriteString
    mov eax,cyan ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,6
    call Gotoxy
    mov edx,OFFSET gameOver5
    call WriteString
    mov eax,magenta ;(blue*16)
    call SetTextColor
      mov dl,30
    mov dh,7
    call Gotoxy
    mov edx,OFFSET gameOver6
    call WriteString
      mov eax,brown ;(blue*16)
    call SetTextColor
          mov dl, 34
      mov dh, 13
      call Gotoxy
    mov edx, offset EnterName1
    call WriteString
    mov dl, 48
      mov dh, 13
      call Gotoxy
    mov edx, offset buffer  ; Set the buffer address for the entered string
    call WriteString    
     mov dl,34
        mov dh,15
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteInt
   
      mov dl,34
        mov dh,17
        call Gotoxy
        mov edx,OFFSET levelis
        call WriteString
        mov al,3
        call WriteInt
    exit
        call ReadChar

ret
Level3 endP
END main