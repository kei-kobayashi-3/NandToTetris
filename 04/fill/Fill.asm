// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// 512*256
// 512/16=32 1row 32word * 256 = 8192 (8K)
// @SCREEN + 8192 - 1まで

@SCREEN
AD=A

@temp
M=D

(FILL_WHITE)

//if KBD==on goto FILL_BLACK
@KBD
D=M
@FILL_BLACK
D;JNE

//if temp==SCREEN goto FILL_WHITE and not change
@temp
D=M
@SCREEN
M=0
D=D-A
@FILL_WHITE
D;JEQ

//if temp>=SCREEN
@temp
M=M
@temp
AD=M
M=0
@temp
M=M-1
@KBD
D=M
@FILL_WHITE
D;JEQ

(FILL_BLACK)
//fill black
@temp
AD=M
M=-1

//next
@temp
M=M+1

//goto end
@24575
D=D-A
@END
D;JEQ

//if KBD is 0(not on) goto FILL_WHITE
@KBD
D=M
@FILL_WHITE
D;JEQ


@FILL_BLACK
0;JMP

(END)
0;JMP
