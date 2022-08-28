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

(GO_WHITE)
@SCREEN
D=A
@temp
M=D

(FILL_WHITE)

@KBD
D=M
@GO_BLACK
D;JNE

@temp
AD=M
M=0

@24575
D=A-D
@FILL_WHITE
D;JEQ

@temp
M=M+1

@FILL_WHITE
0;JMP


(GO_BLACK)
@SCREEN
D=A
@temp
M=D

(FILL_BLACK)

@KBD
D=M
@GO_WHITE
D;JEQ


@temp
AD=M
M=-1

@24575
D=A-D
@FILL_BLACK
D;JEQ

@temp
M=M+1

@FILL_BLACK
0;JMP
