Start MOV R1 SP ;  Frame main backpatched to M141 backpatched to N108 Frame M141 
ADI R1 -192 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R3 N108 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M141 ; call 
TRP 0 
X107 ADI SP -9 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 5 
STR R3 R2 
MOV R2 FP 
ADI R2 -16 
LDB R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
STB R3 R2 
LDR R3 N108 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
STR R3 R2 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M109 ADI SP 0 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDB R3 R2 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M110 ADI SP 0 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 5 
LDR R3 R2 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M111 ADI SP -4 
LDR R3 N108 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
CMP R3 R4 
BRZ R3 Z287 
SUB R3 R3 
JMP Z288 
Z287 SUB R3 R3 
ADI R3 1 
Z288 MOV R2 FP 
ADI R2 -12 
STR R3 R2 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
BRZ R3 skipif172 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
LDR R3 N108 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
JMP skipelse173 ;  Jump skipelse173 
skipif172 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
skipelse173 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M113 ADI SP -1 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
STB R3 R2 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M115 ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 5 
STR R3 R2 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M117 ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
STR R3 R2 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
X122 ADI SP 0 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M124 ADI SP -28 
LDR R3 N108 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
CMP R3 R4 
BRZ R3 Z289 
SUB R3 R3 
JMP Z290 
Z289 SUB R3 R3 
ADI R3 1 
Z290 MOV R2 FP 
ADI R2 -16 
STR R3 R2 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
BRZ R3 skipif179 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
STR R3 R2 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
STR R3 R2 
JMP skipelse182 ;  Jump skipelse182 
skipif179 MOV R1 SP ;  void setNext(['P116']) Frame M117 
ADI R1 -20 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push P123 size: 4 type: Node offset: 0 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M117 ; call 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
STR R3 R2 
LDR R3 N125 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -36 
STR R3 R2 
MOV R2 FP 
ADI R2 -36 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
STR R3 R2 
skipelse182 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M127 ADI SP -44 
LDR R3 N108 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
CMP R3 R4 
BRZ R3 Z291 
SUB R3 R3 
JMP Z292 
Z291 SUB R3 R3 
ADI R3 1 
Z292 MOV R2 FP 
ADI R2 -20 
STR R3 R2 
MOV R2 FP 
ADI R2 -20 
LDR R3 R2 
BRZ R3 skipif188 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
STR R3 R2 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
STR R3 R2 
LDR R3 N125 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -32 
STR R3 R2 
MOV R2 FP 
ADI R2 -32 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
STR R3 R2 
JMP skipelse193 ;  Jump skipelse193 
skipif188 MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
MOV R2 FP 
ADI R2 -16 
STR R3 R2 
MOV R1 SP ;  void setNext(['P116']) Frame M117 
ADI R1 -20 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push L128 size: 4 type: Node offset: -4 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M117 ; call 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
STR R3 R2 
LDR R3 N125 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -52 
STR R3 R2 
MOV R2 FP 
ADI R2 -52 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
STR R3 R2 
skipelse193 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M129 ADI SP -64 
LDR R3 N108 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
CMP R3 R4 
BRZ R3 Z293 
SUB R3 R3 
JMP Z294 
Z293 SUB R3 R3 
ADI R3 1 
Z294 MOV R2 FP 
ADI R2 -16 
STR R3 R2 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
BRZ R3 skipif200 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
LDR R3 N108 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
JMP skipelse201 ;  Jump skipelse201 
skipif200 MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
MOV R2 FP 
ADI R2 -12 
STR R3 R2 
begin203 MOV R1 SP ;  Node getNext([]) Frame M111 
ADI R1 -16 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M111 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -24 
STR R1 R2 
MOV R1 SP ;  Node getNext([]) Frame M111 
ADI R1 -16 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -24 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M111 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -28 
STR R1 R2 
LDR R3 N108 
MOV R4 R3 
MOV R2 FP 
ADI R2 -28 
LDR R3 R2 
CMP R3 R4 
BNZ R3 Z295 
SUB R3 R3 
JMP Z296 
Z295 SUB R3 R3 
ADI R3 1 
Z296 MOV R2 FP 
ADI R2 -32 
STR R3 R2 
MOV R2 FP 
ADI R2 -32 
LDR R3 R2 
BRZ R3 endwhile207 
MOV R1 SP ;  Node getNext([]) Frame M111 
ADI R1 -16 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M111 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -36 
STR R1 R2 
MOV R2 FP 
ADI R2 -36 
LDR R3 R2 
MOV R2 FP 
ADI R2 -12 
STR R3 R2 
JMP begin203 ;  Jump begin203 
endwhile207 MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
STR R3 R2 
MOV R1 SP ;  Node getNext([]) Frame M111 
ADI R1 -16 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M111 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -48 
STR R1 R2 
MOV R2 FP 
ADI R2 -48 
LDR R3 R2 
MOV R2 FP 
ADI R2 -12 
STR R3 R2 
MOV R1 SP ;  void setNext(['P116']) Frame M117 
ADI R1 -20 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push N108 size: 4 type: null offset: 0 
LDR R3 N108 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M117 ; call 
LDR R3 N125 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
SUB R3 R4 
MOV R2 FP 
ADI R2 -60 
STR R3 R2 
MOV R2 FP 
ADI R2 -60 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
STR R3 R2 
LDR R3 N125 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
CMP R3 R4 
BRZ R3 Z297 
SUB R3 R3 
JMP Z298 
Z297 SUB R3 R3 
ADI R3 1 
Z298 MOV R2 FP 
ADI R2 -68 
STR R3 R2 
MOV R2 FP 
ADI R2 -68 
LDR R3 R2 
BRZ R3 skipif217 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
STR R3 R2 
skipif217 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
skipelse201 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M131 ADI SP -36 
LDR R3 N108 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
CMP R3 R4 
BRZ R3 Z299 
SUB R3 R3 
JMP Z300 
Z299 SUB R3 R3 
ADI R3 1 
Z300 MOV R2 FP 
ADI R2 -16 
STR R3 R2 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
BRZ R3 skipif220 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
LDR R3 N108 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
JMP skipelse221 ;  Jump skipelse221 
skipif220 MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
MOV R2 FP 
ADI R2 -12 
STR R3 R2 
MOV R1 SP ;  Node getNext([]) Frame M111 
ADI R1 -16 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M111 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -24 
STR R1 R2 
MOV R2 FP 
ADI R2 -24 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
STR R3 R2 
LDR R3 N125 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
SUB R3 R4 
MOV R2 FP 
ADI R2 -32 
STR R3 R2 
MOV R2 FP 
ADI R2 -32 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
STR R3 R2 
LDR R3 N125 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
CMP R3 R4 
BRZ R3 Z301 
SUB R3 R3 
JMP Z302 
Z301 SUB R3 R3 
ADI R3 1 
Z302 MOV R2 FP 
ADI R2 -40 
STR R3 R2 
MOV R2 FP 
ADI R2 -40 
LDR R3 R2 
BRZ R3 skipif228 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
STR R3 R2 
skipif228 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
skipelse221 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M133 ADI SP -4 
LDR R3 N108 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
CMP R3 R4 
BRZ R3 Z303 
SUB R3 R3 
JMP Z304 
Z303 SUB R3 R3 
ADI R3 1 
Z304 MOV R2 FP 
ADI R2 -12 
STR R3 R2 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
BRZ R3 skipif231 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
LDR R3 N108 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
JMP skipelse232 ;  Jump skipelse232 
skipif231 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
skipelse232 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M134 ADI SP -4 
LDR R3 N108 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
CMP R3 R4 
BRZ R3 Z305 
SUB R3 R3 
JMP Z306 
Z305 SUB R3 R3 
ADI R3 1 
Z306 MOV R2 FP 
ADI R2 -12 
STR R3 R2 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
BRZ R3 skipif234 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
LDR R3 N108 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
JMP skipelse235 ;  Jump skipelse235 
skipif234 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
skipelse235 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M135 ADI SP -44 
MOV R1 SP ;  getFirst([]) Frame M133 
ADI R1 -16 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -8 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M133 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -16 
STR R1 R2 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
MOV R2 FP 
ADI R2 -12 
STR R3 R2 
begin238 MOV R1 SP ;  Node getNext([]) Frame M111 
ADI R1 -16 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M111 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -24 
STR R1 R2 
LDR R3 N108 
MOV R4 R3 
MOV R2 FP 
ADI R2 -24 
LDR R3 R2 
CMP R3 R4 
BNZ R3 Z307 
SUB R3 R3 
JMP Z308 
Z307 SUB R3 R3 
ADI R3 1 
Z308 MOV R2 FP 
ADI R2 -28 
STR R3 R2 
MOV R2 FP 
ADI R2 -28 
LDR R3 R2 
BRZ R3 endwhile241 
MOV R1 SP ;  int getHowMany([]) Frame M110 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M110 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -32 
STR R1 R2 
MOV R2 FP 
ADI R2 -32 
LDR R3 R2 
TRP 1 ;  cout << L242(int) 
LDB R3 H137 
TRP 3 ;  cout << ' '(char) 
MOV R1 SP ;  char getItem([]) Frame M109 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M109 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -36 
STR R1 R2 
MOV R2 FP 
ADI R2 -36 
LDB R3 R2 
TRP 3 ;  cout << L243(char) 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
MOV R1 SP ;  Node getNext([]) Frame M111 
ADI R1 -16 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M111 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -40 
STR R1 R2 
MOV R2 FP 
ADI R2 -40 
LDR R3 R2 
MOV R2 FP 
ADI R2 -12 
STR R3 R2 
JMP begin238 ;  Jump begin238 
endwhile241 MOV R1 SP ;  int getHowMany([]) Frame M110 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M110 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -48 
STR R1 R2 
MOV R2 FP 
ADI R2 -48 
LDR R3 R2 
TRP 1 ;  cout << L246(int) 
LDB R3 H137 
TRP 3 ;  cout << ' '(char) 
MOV R1 SP ;  char getItem([]) Frame M109 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M109 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -52 
STR R1 R2 
MOV R2 FP 
ADI R2 -52 
LDB R3 R2 
TRP 3 ;  cout << L247(char) 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M139 ADI SP -20 
MOV R1 SP ;  getFirst([]) Frame M133 
ADI R1 -16 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -8 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M133 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -16 
STR R1 R2 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
MOV R2 FP 
ADI R2 -12 
STR R3 R2 
MOV R1 SP ;  int getHowMany([]) Frame M110 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M110 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -24 
STR R1 R2 
MOV R2 FP 
ADI R2 -24 
LDR R3 R2 
TRP 1 ;  cout << L250(int) 
LDB R3 H137 
TRP 3 ;  cout << ' '(char) 
MOV R1 SP ;  char getItem([]) Frame M109 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M109 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -28 
STR R1 R2 
MOV R2 FP 
ADI R2 -28 
LDB R3 R2 
TRP 3 ;  cout << L251(char) 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M141 ADI SP -180 
MOV R0 SL ; start NEWI 
ADI R1 9 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -20 
MOV R3 SL 
STR R3 R2 
ADI SL 9 ; end NEWI 
MOV R1 SP ;  static initializer for class Node backpatched to S167 Frame S167 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -20 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S167 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -20 
STR R1 R2 
MOV R1 SP ;  Node Node(['P105', 'P106']) Frame X107 
ADI R1 -26 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -20 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push N125 size: 4 type: int offset: 0 
LDR R3 N125 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push H144 size: 1 type: char offset: 0 
LDB R3 H144 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X107 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -20 
STR R1 R2 
MOV R2 FP 
ADI R2 -20 
LDR R3 R2 
MOV R2 FP 
ADI R2 -16 
STR R3 R2 
MOV R0 SL ; start NEWI 
ADI R1 9 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -32 
MOV R3 SL 
STR R3 R2 
ADI SL 9 ; end NEWI 
MOV R1 SP ;  static initializer for class Node backpatched to S167 Frame S167 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -32 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S167 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -32 
STR R1 R2 
MOV R1 SP ;  Node Node(['P105', 'P106']) Frame X107 
ADI R1 -26 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -32 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push N146 size: 4 type: int offset: 0 
LDR R3 N146 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push H147 size: 1 type: char offset: 0 
LDB R3 H147 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X107 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -32 
STR R1 R2 
MOV R2 FP 
ADI R2 -32 
LDR R3 R2 
MOV R2 FP 
ADI R2 -28 
STR R3 R2 
MOV R0 SL ; start NEWI 
ADI R1 9 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -44 
MOV R3 SL 
STR R3 R2 
ADI SL 9 ; end NEWI 
MOV R1 SP ;  static initializer for class Node backpatched to S167 Frame S167 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -44 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S167 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -44 
STR R1 R2 
MOV R1 SP ;  Node Node(['P105', 'P106']) Frame X107 
ADI R1 -26 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -44 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push N149 size: 4 type: int offset: 0 
LDR R3 N149 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push H150 size: 1 type: char offset: 0 
LDB R3 H150 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X107 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -44 
STR R1 R2 
MOV R2 FP 
ADI R2 -44 
LDR R3 R2 
MOV R2 FP 
ADI R2 -40 
STR R3 R2 
MOV R0 SL ; start NEWI 
ADI R1 9 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -56 
MOV R3 SL 
STR R3 R2 
ADI SL 9 ; end NEWI 
MOV R1 SP ;  static initializer for class Node backpatched to S167 Frame S167 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -56 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S167 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -56 
STR R1 R2 
MOV R1 SP ;  Node Node(['P105', 'P106']) Frame X107 
ADI R1 -26 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -56 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push N152 size: 4 type: int offset: 0 
LDR R3 N152 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push H153 size: 1 type: char offset: 0 
LDB R3 H153 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X107 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -56 
STR R1 R2 
MOV R2 FP 
ADI R2 -56 
LDR R3 R2 
MOV R2 FP 
ADI R2 -52 
STR R3 R2 
MOV R0 SL ; start NEWI 
ADI R1 9 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -68 
MOV R3 SL 
STR R3 R2 
ADI SL 9 ; end NEWI 
MOV R1 SP ;  static initializer for class Node backpatched to S167 Frame S167 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -68 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S167 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -68 
STR R1 R2 
MOV R1 SP ;  Node Node(['P105', 'P106']) Frame X107 
ADI R1 -26 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -68 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push N155 size: 4 type: int offset: 0 
LDR R3 N155 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push H156 size: 1 type: char offset: 0 
LDB R3 H156 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X107 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -68 
STR R1 R2 
MOV R2 FP 
ADI R2 -68 
LDR R3 R2 
MOV R2 FP 
ADI R2 -64 
STR R3 R2 
MOV R0 SL ; start NEWI 
ADI R1 9 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -80 
MOV R3 SL 
STR R3 R2 
ADI SL 9 ; end NEWI 
MOV R1 SP ;  static initializer for class Node backpatched to S167 Frame S167 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -80 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S167 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -80 
STR R1 R2 
MOV R1 SP ;  Node Node(['P105', 'P106']) Frame X107 
ADI R1 -26 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -80 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push N158 size: 4 type: int offset: 0 
LDR R3 N158 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push H159 size: 1 type: char offset: 0 
LDB R3 H159 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X107 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -80 
STR R1 R2 
MOV R2 FP 
ADI R2 -80 
LDR R3 R2 
MOV R2 FP 
ADI R2 -76 
STR R3 R2 
MOV R0 SL ; start NEWI 
ADI R1 9 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -92 
MOV R3 SL 
STR R3 R2 
ADI SL 9 ; end NEWI 
MOV R1 SP ;  static initializer for class Node backpatched to S167 Frame S167 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -92 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S167 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -92 
STR R1 R2 
MOV R1 SP ;  Node Node(['P105', 'P106']) Frame X107 
ADI R1 -26 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -92 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push N161 size: 4 type: int offset: 0 
LDR R3 N161 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push H162 size: 1 type: char offset: 0 
LDB R3 H162 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X107 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -92 
STR R1 R2 
MOV R2 FP 
ADI R2 -92 
LDR R3 R2 
MOV R2 FP 
ADI R2 -88 
STR R3 R2 
MOV R0 SL ; start NEWI 
ADI R1 9 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -104 
MOV R3 SL 
STR R3 R2 
ADI SL 9 ; end NEWI 
MOV R1 SP ;  static initializer for class Node backpatched to S167 Frame S167 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -104 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S167 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -104 
STR R1 R2 
MOV R1 SP ;  Node Node(['P105', 'P106']) Frame X107 
ADI R1 -26 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -104 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push N164 size: 4 type: int offset: 0 
LDR R3 N164 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push H165 size: 1 type: char offset: 0 
LDB R3 H165 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X107 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -104 
STR R1 R2 
MOV R2 FP 
ADI R2 -104 
LDR R3 R2 
MOV R2 FP 
ADI R2 -100 
STR R3 R2 
MOV R1 SP ;  void pushfront(['P126']) Frame M127 
ADI R1 -60 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push L143 size: 4 type: Node offset: -4 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M127 ; call 
MOV R1 SP ;  void pushfront(['P126']) Frame M127 
ADI R1 -60 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push L145 size: 4 type: Node offset: -16 
MOV R2 FP 
ADI R2 -28 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M127 ; call 
MOV R1 SP ;  void pushfront(['P126']) Frame M127 
ADI R1 -60 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push L148 size: 4 type: Node offset: -28 
MOV R2 FP 
ADI R2 -40 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M127 ; call 
MOV R1 SP ;  void pushfront(['P126']) Frame M127 
ADI R1 -60 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push L151 size: 4 type: Node offset: -40 
MOV R2 FP 
ADI R2 -52 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M127 ; call 
MOV R1 SP ;  void printList([]) Frame M135 
ADI R1 -56 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M135 ; call 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
MOV R1 SP ;  void pushfront(['P126']) Frame M127 
ADI R1 -60 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push L154 size: 4 type: Node offset: -52 
MOV R2 FP 
ADI R2 -64 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M127 ; call 
MOV R1 SP ;  void pushfront(['P126']) Frame M127 
ADI R1 -60 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push L157 size: 4 type: Node offset: -64 
MOV R2 FP 
ADI R2 -76 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M127 ; call 
MOV R1 SP ;  void printList([]) Frame M135 
ADI R1 -56 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M135 ; call 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
MOV R1 SP ;  Node popfront([]) Frame M131 
ADI R1 -48 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M131 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -148 
STR R1 R2 
MOV R2 FP 
ADI R2 -148 
LDR R3 R2 
MOV R2 FP 
ADI R2 -112 
STR R3 R2 
MOV R1 SP ;  char getItem([]) Frame M109 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -112 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M109 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -156 
STR R1 R2 
MOV R2 FP 
ADI R2 -156 
LDB R3 R2 
TRP 3 ;  cout << L278(char) 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
MOV R1 SP ;  void printList([]) Frame M135 
ADI R1 -56 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M135 ; call 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
MOV R1 SP ;  void pushback(['P123']) Frame M124 
ADI R1 -44 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push L160 size: 4 type: Node offset: -76 
MOV R2 FP 
ADI R2 -88 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M124 ; call 
MOV R1 SP ;  void pushback(['P123']) Frame M124 
ADI R1 -44 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push L163 size: 4 type: Node offset: -88 
MOV R2 FP 
ADI R2 -100 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M124 ; call 
MOV R1 SP ;  void printList([]) Frame M135 
ADI R1 -56 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M135 ; call 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
MOV R1 SP ;  Node popback([]) Frame M129 
ADI R1 -76 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M129 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -176 
STR R1 R2 
MOV R2 FP 
ADI R2 -176 
LDR R3 R2 
MOV R2 FP 
ADI R2 -112 
STR R3 R2 
MOV R1 SP ;  char getItem([]) Frame M109 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -112 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M109 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -184 
STR R1 R2 
MOV R2 FP 
ADI R2 -184 
LDB R3 R2 
TRP 3 ;  cout << L285(char) 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
MOV R1 SP ;  void printList([]) Frame M135 
ADI R1 -56 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M135 ; call 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
LDB R3 H138 
TRP 3 ;  cout << '\n'(char) 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
S167 ADI SP 0 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
S177 ADI SP 0 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
H144 .BYT 97 
H147 .BYT 98 
N161 .INT 7 
N164 .INT 8 
H138 .BYT 10 
H137 .BYT 32 
N108 .INT 0 
H153 .BYT 100 
N125 .INT 1 
N158 .INT 6 
H162 .BYT 103 
H165 .BYT 104 
N152 .INT 4 
N155 .INT 5 
N149 .INT 3 
H159 .BYT 102 
H156 .BYT 101 
N146 .INT 2 
H150 .BYT 99 
End TRP 0 
