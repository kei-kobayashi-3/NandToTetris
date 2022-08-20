// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// R2 = left * right
// while(right > 0){
//   R2 += left;
//   right--;
// }

  @R2
  M=0

(LOOP)
  @R0
  D=M //D=right
  @END
  D;JEQ //もしright=0ならばENDへ移動

  @R1
  D=M
  @END
  D;JEQ //もしleft=0ならばENDへ移動

  @R2
  M=M+D //sum = sum + left

  @R0
  D=M //D =right
  @R0
  M=D-1 //right = right -1

  @LOOP
  0;JMP  //LOOPへ移動

(END)
  @END
  0;JMP
