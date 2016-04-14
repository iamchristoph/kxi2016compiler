Start MOV R1 SP ;  Frame main backpatched to M201 backpatched to N105 Frame M201 
ADI R1 -69 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R3 N105 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M201 ; call 
TRP 0 
X104 ADI SP -4 
LDR R3 N105 
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
M107 ADI SP -28 
LDR R3 N108 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
CMP R3 R4 
BRZ R3 Z430 
SUB R3 R3 
JMP Z431 
Z430 SUB R3 R3 
ADI R3 1 
Z431 MOV R2 FP 
ADI R2 -16 
STR R3 R2 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
BRZ R3 skipif209 
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
JMP skipelse210 ;  Jump skipelse210 
skipif209 LDR R3 N109 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
CMP R3 R4 
BRZ R3 Z432 
SUB R3 R3 
JMP Z433 
Z432 SUB R3 R3 
ADI R3 1 
Z433 MOV R2 FP 
ADI R2 -20 
STR R3 R2 
MOV R2 FP 
ADI R2 -20 
LDR R3 R2 
BRZ R3 skipif212 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
LDR R3 N109 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
JMP skipelse210 ;  Jump skipelse213 backpatched to skipelse210 
skipif212 LDR R3 N109 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
SUB R3 R4 
MOV R2 FP 
ADI R2 -24 
STR R3 R2 
MOV R1 SP ;  fib(['P106']) Frame M107 
ADI R1 -44 
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
MOV R0 SP ; Push T214 size: 4 type: int offset: -12 
MOV R2 FP 
ADI R2 -24 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M107 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -28 
STR R1 R2 
LDR R3 N110 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
SUB R3 R4 
MOV R2 FP 
ADI R2 -32 
STR R3 R2 
MOV R1 SP ;  fib(['P106']) Frame M107 
ADI R1 -44 
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
MOV R0 SP ; Push T216 size: 4 type: int offset: -20 
MOV R2 FP 
ADI R2 -32 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M107 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -36 
STR R1 R2 
MOV R2 FP 
ADI R2 -36 
LDR R3 R2 
MOV R4 R3 
MOV R2 FP 
ADI R2 -28 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -40 
STR R3 R2 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
MOV R2 FP 
ADI R2 -40 
LDR R3 R2 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
skipelse210 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M112 ADI SP -16 
LDR R3 N105 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
CMP R3 R4 
BRZ R3 Z434 
SUB R3 R3 
JMP Z435 
Z434 SUB R3 R3 
ADI R3 1 
Z435 MOV R2 FP 
ADI R2 -13 
STR R3 R2 
MOV R2 FP 
ADI R2 -13 
LDR R3 R2 
BRZ R3 skipif220 
MOV R0 SL ; start NEWI 
ADI R1 13 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -17 
MOV R3 SL 
STR R3 R2 
ADI SL 13 ; end NEWI 
MOV R1 SP ;  static initializer for class iNode backpatched to S268 Frame S268 
ADI R1 -24 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -17 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S268 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -17 
STR R1 R2 
MOV R1 SP ;  iNode iNode(['P133']) Frame X134 
ADI R1 -18 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -17 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push P111 size: 1 type: char offset: 0 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X134 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -17 
STR R1 R2 
MOV R2 FP 
ADI R2 -17 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
STR R3 R2 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
LDR R3 B113 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
JMP skipelse223 ;  Jump skipelse223 
skipif220 MOV R1 SP ;  insert(['P114', 'P115']) Frame M116 
ADI R1 -93 
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
MOV R0 SP ; Push P111 size: 1 type: char offset: 0 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
STB R3 R0 
ADI SP -1 
MOV R0 SP ; Push I102 size: 4 type: iNode offset: 0 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M116 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -25 
STR R1 R2 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
MOV R2 FP 
ADI R2 -25 
LDR R3 R2 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
skipelse223 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M116 ADI SP -76 
MOV R2 FP  ; start REF 
ADI R2 -13 
LDR R3 R2 
ADI R3 12 
MOV R2 FP 
ADI R2 -17 
STR R3 R2  ; end REF 
MOV R2 FP 
ADI R2 -17 
LDR R1 R2 
LDB R3 R1 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
CMP R3 R4 
BLT R3 Z436 
SUB R3 R3 
JMP Z437 
Z436 SUB R3 R3 
ADI R3 1 
Z437 MOV R2 FP 
ADI R2 -21 
STR R3 R2 
MOV R2 FP 
ADI R2 -21 
LDR R3 R2 
BRZ R3 skipif227 
MOV R2 FP  ; start REF 
ADI R2 -13 
LDR R3 R2 
ADI R3 4 
MOV R2 FP 
ADI R2 -25 
STR R3 R2  ; end REF 
LDR R3 N105 
MOV R4 R3 
MOV R2 FP 
ADI R2 -25 
LDR R1 R2 
LDR R3 R1 
CMP R3 R4 
BRZ R3 Z438 
SUB R3 R3 
JMP Z439 
Z438 SUB R3 R3 
ADI R3 1 
Z439 MOV R2 FP 
ADI R2 -29 
STR R3 R2 
MOV R2 FP 
ADI R2 -29 
LDR R3 R2 
BRZ R3 skipif230 
MOV R2 FP  ; start REF 
ADI R2 -13 
LDR R3 R2 
ADI R3 4 
MOV R2 FP 
ADI R2 -33 
STR R3 R2  ; end REF 
MOV R0 SL ; start NEWI 
ADI R1 13 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -37 
MOV R3 SL 
STR R3 R2 
ADI SL 13 ; end NEWI 
MOV R1 SP ;  static initializer for class iNode backpatched to S268 Frame S268 
ADI R1 -24 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -37 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S268 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -37 
STR R1 R2 
MOV R1 SP ;  iNode iNode(['P133']) Frame X134 
ADI R1 -18 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -37 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push P114 size: 1 type: char offset: 0 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X134 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -37 
STR R1 R2 
MOV R2 FP 
ADI R2 -37 
LDR R3 R2 
MOV R2 FP 
ADI R2 -33 
LDR R2 R2 
STR R3 R2 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
LDR R3 B113 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
JMP skipelse234 ;  Jump skipelse234 
skipif230 MOV R2 FP  ; start REF 
ADI R2 -13 
LDR R3 R2 
ADI R3 4 
MOV R2 FP 
ADI R2 -45 
STR R3 R2  ; end REF 
MOV R1 SP ;  insert(['P114', 'P115']) Frame M116 
ADI R1 -93 
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
MOV R0 SP ; Push P114 size: 1 type: char offset: 0 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
STB R3 R0 
ADI SP -1 
MOV R0 SP ; Push R235 size: 4 type: iNode offset: -33 
MOV R2 FP 
ADI R2 -45 
LDR R1 R2 
LDR R3 R1 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M116 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -49 
STR R1 R2 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
MOV R2 FP 
ADI R2 -49 
LDR R3 R2 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
skipelse234 JMP skipelse237 ;  Jump skipelse237 
skipif227 MOV R2 FP  ; start REF 
ADI R2 -13 
LDR R3 R2 
ADI R3 12 
MOV R2 FP 
ADI R2 -53 
STR R3 R2  ; end REF 
MOV R2 FP 
ADI R2 -53 
LDR R1 R2 
LDB R3 R1 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
CMP R3 R4 
BGT R3 Z440 
SUB R3 R3 
JMP Z441 
Z440 SUB R3 R3 
ADI R3 1 
Z441 MOV R2 FP 
ADI R2 -57 
STR R3 R2 
MOV R2 FP 
ADI R2 -57 
LDR R3 R2 
BRZ R3 skipif240 
MOV R2 FP  ; start REF 
ADI R2 -13 
LDR R3 R2 
ADI R3 0 
MOV R2 FP 
ADI R2 -61 
STR R3 R2  ; end REF 
LDR R3 N105 
MOV R4 R3 
MOV R2 FP 
ADI R2 -61 
LDR R1 R2 
LDR R3 R1 
CMP R3 R4 
BRZ R3 Z442 
SUB R3 R3 
JMP Z443 
Z442 SUB R3 R3 
ADI R3 1 
Z443 MOV R2 FP 
ADI R2 -65 
STR R3 R2 
MOV R2 FP 
ADI R2 -65 
LDR R3 R2 
BRZ R3 skipif243 
MOV R2 FP  ; start REF 
ADI R2 -13 
LDR R3 R2 
ADI R3 0 
MOV R2 FP 
ADI R2 -69 
STR R3 R2  ; end REF 
MOV R0 SL ; start NEWI 
ADI R1 13 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -73 
MOV R3 SL 
STR R3 R2 
ADI SL 13 ; end NEWI 
MOV R1 SP ;  static initializer for class iNode backpatched to S268 Frame S268 
ADI R1 -24 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -73 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S268 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -73 
STR R1 R2 
MOV R1 SP ;  iNode iNode(['P133']) Frame X134 
ADI R1 -18 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -73 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push P114 size: 1 type: char offset: 0 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X134 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -73 
STR R1 R2 
MOV R2 FP 
ADI R2 -73 
LDR R3 R2 
MOV R2 FP 
ADI R2 -69 
LDR R2 R2 
STR R3 R2 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
LDR R3 B113 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
JMP skipelse247 ;  Jump skipelse247 
skipif243 MOV R2 FP  ; start REF 
ADI R2 -13 
LDR R3 R2 
ADI R3 0 
MOV R2 FP 
ADI R2 -81 
STR R3 R2  ; end REF 
MOV R1 SP ;  insert(['P114', 'P115']) Frame M116 
ADI R1 -93 
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
MOV R0 SP ; Push P114 size: 1 type: char offset: 0 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
STB R3 R0 
ADI SP -1 
MOV R0 SP ; Push R248 size: 4 type: iNode offset: -69 
MOV R2 FP 
ADI R2 -81 
LDR R1 R2 
LDR R3 R1 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M116 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -85 
STR R1 R2 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
MOV R2 FP 
ADI R2 -85 
LDR R3 R2 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
skipelse247 JMP skipelse237 ;  Jump skipelse250 backpatched to skipelse237 
skipif240 MOV R1 SP ;  void inc([]) Frame M135 
ADI R1 -20 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -13 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M135 ; call 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R7 R0 ; get the previous frame pointer 
ADI R0 -4 ; get the return value 
LDR R3 B117 
LDR R2 FP 
STR R3 FP 
MOV SP FP 
MOV FP R7 
JMR R2 ; rtn 
skipelse237 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M118 ADI SP -8 
LDR R3 B113 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
STR R3 R2 
MOV R1 SP ;  inorder(['P120']) Frame M121 
ADI R1 -40 
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
MOV R0 SP ; Push I102 size: 4 type: iNode offset: 0 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M121 ; call 
LDB R3 H119 
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
M121 ADI SP -24 
LDR R3 N105 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
CMP R3 R4 
BRZ R3 Z444 
SUB R3 R3 
JMP Z445 
Z444 SUB R3 R3 
ADI R3 1 
Z445 MOV R2 FP 
ADI R2 -16 
STR R3 R2 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
BRZ R3 skipif255 
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
skipif255 MOV R2 FP  ; start REF 
ADI R2 -12 
LDR R3 R2 
ADI R3 4 
MOV R2 FP 
ADI R2 -20 
STR R3 R2  ; end REF 
MOV R1 SP ;  inorder(['P120']) Frame M121 
ADI R1 -40 
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
MOV R0 SP ; Push R256 size: 4 type: iNode offset: -8 
MOV R2 FP 
ADI R2 -20 
LDR R1 R2 
LDR R3 R1 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M121 ; call 
MOV R1 SP ;  visit(['P122']) Frame M123 
ADI R1 -36 
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
MOV R0 SP ; Push P120 size: 4 type: iNode offset: 0 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M123 ; call 
MOV R2 FP  ; start REF 
ADI R2 -12 
LDR R3 R2 
ADI R3 0 
MOV R2 FP 
ADI R2 -32 
STR R3 R2  ; end REF 
MOV R1 SP ;  inorder(['P120']) Frame M121 
ADI R1 -40 
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
MOV R0 SP ; Push R259 size: 4 type: iNode offset: -20 
MOV R2 FP 
ADI R2 -32 
LDR R1 R2 
LDR R3 R1 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M121 ; call 
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
M123 ADI SP -20 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
BRZ R3 skipif261 
LDR R3 B117 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
STR R3 R2 
LDB R3 H124 
TRP 3 ;  cout << ' '(char) 
JMP skipelse263 ;  Jump skipelse263 
skipif261 LDB R3 H125 
TRP 3 ;  cout << ','(char) 
skipelse263 MOV R2 FP  ; start REF 
ADI R2 -12 
LDR R3 R2 
ADI R3 12 
MOV R2 FP 
ADI R2 -20 
STR R3 R2  ; end REF 
MOV R2 FP 
ADI R2 -20 
LDR R1 R2 
LDB R3 R1 
TRP 3 ;  cout << R264(char) 
LDB R3 H126 
TRP 3 ;  cout << '('(char) 
MOV R2 FP  ; start REF 
ADI R2 -12 
LDR R3 R2 
ADI R3 8 
MOV R2 FP 
ADI R2 -24 
STR R3 R2  ; end REF 
MOV R2 FP 
ADI R2 -24 
LDR R1 R2 
LDR R3 R1 
TRP 1 ;  cout << R265(int) 
LDB R3 H125 
TRP 3 ;  cout << ','(char) 
MOV R2 FP  ; start REF 
ADI R2 -12 
LDR R3 R2 
ADI R3 8 
MOV R2 FP 
ADI R2 -28 
STR R3 R2  ; end REF 
MOV R1 SP ;  fib(['P106']) Frame M107 
ADI R1 -44 
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
MOV R0 SP ; Push R266 size: 4 type: int offset: -16 
MOV R2 FP 
ADI R2 -28 
LDR R1 R2 
LDR R3 R1 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M107 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -32 
STR R1 R2 
MOV R2 FP 
ADI R2 -32 
LDR R3 R2 
TRP 1 ;  cout << L267(int) 
LDB R3 H127 
TRP 3 ;  cout << ')'(char) 
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
X134 ADI SP -5 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 12 
STB R3 R2 
LDR R3 N109 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
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
M135 ADI SP -8 
LDR R3 N109 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -12 
STR R3 R2 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
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
X140 ADI SP -110 
MOV R0 SL ; start NEW 
LDR R3 N141 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
ADD R1 R4 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -12 
MOV R3 SL 
STR R3 R2 
ADD SL R4 ; end NEW 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
STR R3 R2 
LDR R3 N108  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -24 
STR R3 R2 
LDB R3 H142 
MOV R2 FP 
ADI R2 -24 
LDR R2 R2 
STB R3 R2 
LDR R3 N109  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -26 
STR R3 R2 
LDB R3 H143 
MOV R2 FP 
ADI R2 -26 
LDR R2 R2 
STB R3 R2 
LDR R3 N110  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -28 
STR R3 R2 
LDB R3 H143 
MOV R2 FP 
ADI R2 -28 
LDR R2 R2 
STB R3 R2 
LDR R3 N144  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -30 
STR R3 R2 
LDB R3 H145 
MOV R2 FP 
ADI R2 -30 
LDR R2 R2 
STB R3 R2 
LDR R3 N146  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -32 
STR R3 R2 
LDB R3 H143 
MOV R2 FP 
ADI R2 -32 
LDR R2 R2 
STB R3 R2 
LDR R3 N147  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -34 
STR R3 R2 
LDB R3 H124 
MOV R2 FP 
ADI R2 -34 
LDR R2 R2 
STB R3 R2 
LDR R3 N148  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -36 
STR R3 R2 
LDB R3 H149 
MOV R2 FP 
ADI R2 -36 
LDR R2 R2 
STB R3 R2 
LDR R3 N150  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -38 
STR R3 R2 
LDB R3 H151 
MOV R2 FP 
ADI R2 -38 
LDR R2 R2 
STB R3 R2 
LDR R3 N152  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -40 
STR R3 R2 
LDB R3 H145 
MOV R2 FP 
ADI R2 -40 
LDR R2 R2 
STB R3 R2 
LDR R3 N153  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -42 
STR R3 R2 
LDB R3 H154 
MOV R2 FP 
ADI R2 -42 
LDR R2 R2 
STB R3 R2 
LDR R3 N155  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -44 
STR R3 R2 
LDB R3 H145 
MOV R2 FP 
ADI R2 -44 
LDR R2 R2 
STB R3 R2 
LDR R3 N156  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -46 
STR R3 R2 
LDB R3 H157 
MOV R2 FP 
ADI R2 -46 
LDR R2 R2 
STB R3 R2 
LDR R3 N158  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -48 
STR R3 R2 
LDB R3 H159 
MOV R2 FP 
ADI R2 -48 
LDR R2 R2 
STB R3 R2 
LDR R3 N160  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -50 
STR R3 R2 
LDB R3 H161 
MOV R2 FP 
ADI R2 -50 
LDR R2 R2 
STB R3 R2 
LDR R3 N162 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
STR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -56 
STR R3 R2 
LDB R3 H163 
MOV R2 FP 
ADI R2 -56 
LDR R2 R2 
STB R3 R2 
LDR R3 N109 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -58 
STR R3 R2 
MOV R2 FP 
ADI R2 -58 
LDR R3 R2  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -62 
STR R3 R2 
LDB R3 H164 
MOV R2 FP 
ADI R2 -62 
LDR R2 R2 
STB R3 R2 
LDR R3 N110 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -64 
STR R3 R2 
MOV R2 FP 
ADI R2 -64 
LDR R3 R2  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -68 
STR R3 R2 
LDB R3 H165 
MOV R2 FP 
ADI R2 -68 
LDR R2 R2 
STB R3 R2 
LDR R3 N144 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -70 
STR R3 R2 
MOV R2 FP 
ADI R2 -70 
LDR R3 R2  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -74 
STR R3 R2 
LDB R3 H151 
MOV R2 FP 
ADI R2 -74 
LDR R2 R2 
STB R3 R2 
LDR R3 N146 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -76 
STR R3 R2 
MOV R2 FP 
ADI R2 -76 
LDR R3 R2  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -80 
STR R3 R2 
LDB R3 H166 
MOV R2 FP 
ADI R2 -80 
LDR R2 R2 
STB R3 R2 
LDR R3 N147 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -82 
STR R3 R2 
MOV R2 FP 
ADI R2 -82 
LDR R3 R2  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -86 
STR R3 R2 
LDB R3 H167 
MOV R2 FP 
ADI R2 -86 
LDR R2 R2 
STB R3 R2 
LDR R3 N148 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -88 
STR R3 R2 
MOV R2 FP 
ADI R2 -88 
LDR R3 R2  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -92 
STR R3 R2 
LDB R3 H168 
MOV R2 FP 
ADI R2 -92 
LDR R2 R2 
STB R3 R2 
LDR R3 N150 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -94 
STR R3 R2 
MOV R2 FP 
ADI R2 -94 
LDR R3 R2  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -98 
STR R3 R2 
LDB R3 H159 
MOV R2 FP 
ADI R2 -98 
LDR R2 R2 
STB R3 R2 
LDR R3 N152 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -100 
STR R3 R2 
MOV R2 FP 
ADI R2 -100 
LDR R3 R2  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -104 
STR R3 R2 
LDB R3 H145 
MOV R2 FP 
ADI R2 -104 
LDR R2 R2 
STB R3 R2 
LDR R3 N153 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -106 
STR R3 R2 
MOV R2 FP 
ADI R2 -106 
LDR R3 R2  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -110 
STR R3 R2 
LDB R3 H124 
MOV R2 FP 
ADI R2 -110 
LDR R2 R2 
STB R3 R2 
LDR R3 N169  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -112 
STR R3 R2 
LDB R3 H149 
MOV R2 FP 
ADI R2 -112 
LDR R2 R2 
STB R3 R2 
LDR R3 N170  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -114 
STR R3 R2 
LDB R3 H157 
MOV R2 FP 
ADI R2 -114 
LDR R2 R2 
STB R3 R2 
LDR R3 N171  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -116 
STR R3 R2 
LDB R3 H159 
MOV R2 FP 
ADI R2 -116 
LDR R2 R2 
STB R3 R2 
LDR R3 N172  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -118 
STR R3 R2 
LDB R3 H145 
MOV R2 FP 
ADI R2 -118 
LDR R2 R2 
STB R3 R2 
LDR R3 N173  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -120 
STR R3 R2 
LDB R3 H174 
MOV R2 FP 
ADI R2 -120 
LDR R2 R2 
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
M177 ADI SP -13 
begin348 MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
CMP R3 R4 
BLT R3 Z446 
BRZ R3 Z446 
SUB R3 R3 
JMP Z447 
Z446 SUB R3 R3 
ADI R3 1 
Z447 MOV R2 FP 
ADI R2 -20 
STR R3 R2 
MOV R2 FP 
ADI R2 -20 
LDR R3 R2 
BRZ R3 endwhile350 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -24 
STR R3 R2 
MOV R2 FP 
ADI R2 -24 
LDR R1 R2 
LDB R3 R1 
TRP 3 ;  cout << A351(char) 
LDR R3 N109 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -25 
STR R3 R2 
MOV R2 FP 
ADI R2 -25 
LDR R3 R2 
MOV R2 FP 
ADI R2 -12 
STR R3 R2 
JMP begin348 ;  Jump begin348 
endwhile350 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M179 ADI SP -4 
MOV R1 SP ;  print(['P175', 'P176']) Frame M177 
ADI R1 -33 
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
MOV R0 SP ; Push N108 size: 4 type: int offset: 0 
LDR R3 N108 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push N160 size: 4 type: int offset: 0 
LDR R3 N160 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M177 ; call 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
TRP 3 ;  cout << elm(char) 
LDB R3 H119 
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
M181 ADI SP -21 
LDR R3 N162 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
STR R3 R2 
LDR R3 N152 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -17 
STR R3 R2 
MOV R2 FP 
ADI R2 -17 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
STR R3 R2 
MOV R1 SP ;  print(['P175', 'P176']) Frame M177 
ADI R1 -33 
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
MOV R0 SP ; Push I138 size: 4 type: int offset: 8 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push I139 size: 4 type: int offset: 4 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M177 ; call 
LDR R3 N147  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 0 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -29 
STR R3 R2 
MOV R2 FP 
ADI R2 -29 
LDR R1 R2 
LDB R3 R1 
TRP 3 ;  cout << A359(char) 
MOV R1 SP ;  print(['P175', 'P176']) Frame M177 
ADI R1 -33 
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
MOV R0 SP ; Push N148 size: 4 type: int offset: 0 
LDR R3 N148 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push N160 size: 4 type: int offset: 0 
LDR R3 N160 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M177 ; call 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
TRP 3 ;  cout << elm(char) 
LDB R3 H119 
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
M182 ADI SP -16 
MOV R1 SP ;  print(['P175', 'P176']) Frame M177 
ADI R1 -33 
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
MOV R0 SP ; Push N169 size: 4 type: int offset: 0 
LDR R3 N169 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push N173 size: 4 type: int offset: 0 
LDR R3 N173 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M177 ; call 
LDR R3 N147 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
STR R3 R2 
MOV R1 SP ;  print(['P175', 'P176']) Frame M177 
ADI R1 -33 
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
MOV R0 SP ; Push I138 size: 4 type: int offset: 8 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push I138 size: 4 type: int offset: 8 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M177 ; call 
MOV R1 SP ;  print(['P175', 'P176']) Frame M177 
ADI R1 -33 
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
MOV R0 SP ; Push N148 size: 4 type: int offset: 0 
LDR R3 N148 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push N160 size: 4 type: int offset: 0 
LDR R3 N160 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M177 ; call 
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
X189 ADI SP -5 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
STR R3 R2 
MOV R2 FP 
ADI R2 -16 
LDB R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
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
M190 ADI SP -149 
MOV R0 SL ; start NEW 
LDR R3 N192 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
ADD R1 R4 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -16 
MOV R3 SL 
STR R3 R2 
ADD SL R4 ; end NEW 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
MOV R2 FP 
ADI R2 -12 
STR R3 R2 
MOV R0 SL ; start NEW 
LDR R3 N194 
SUB R4 R4 
ADI R4 4 
MUL R4 R3 
ADD R1 R4 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -32 
MOV R3 SL 
STR R3 R2 
ADD SL R4 ; end NEW 
MOV R2 FP 
ADI R2 -32 
LDR R3 R2 
MOV R2 FP 
ADI R2 -28 
STR R3 R2 
MOV R0 SL ; start NEW 
LDR R3 N196 
SUB R4 R4 
ADI R4 4 
MUL R4 R3 
ADD R1 R4 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -48 
MOV R3 SL 
STR R3 R2 
ADD SL R4 ; end NEW 
MOV R2 FP 
ADI R2 -48 
LDR R3 R2 
MOV R2 FP 
ADI R2 -44 
STR R3 R2 
LDR R3 N109  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -60 
STR R3 R2 
LDR R3 N110  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -61 
STR R3 R2 
MOV R2 FP 
ADI R2 -61 
LDR R1 R2 
LDB R3 R1 
MOV R2 FP 
ADI R2 -60 
LDR R2 R2 
STB R3 R2 
LDR R3 N197  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -63 
STR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDB R3 R2 
MOV R2 FP 
ADI R2 -63 
LDR R2 R2 
STB R3 R2 
LDR R3 N141  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -65 
STR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDB R3 R2 
MOV R2 FP 
ADI R2 -65 
LDR R2 R2 
STB R3 R2 
LDR R3 N155  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -67 
STR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDB R3 R2 
MOV R2 FP 
ADI R2 -67 
LDR R2 R2 
STB R3 R2 
MOV R2 FP 
ADI R2 -28 
LDR R3 R2 
MOV R2 FP 
ADI R2 -28 
STR R3 R2 
LDR R3 N146  ; start AEF 
SUB R4 R4 
ADI R4 4 
MUL R4 R3 
MOV R2 FP 
ADI R2 -28 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -73 
STR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
MOV R4 R3 
LDR R3 N147 
ADD R3 R4 
MOV R2 FP 
ADI R2 -77 
STR R3 R2 
MOV R2 FP 
ADI R2 -77 
LDR R3 R2 
MOV R2 FP 
ADI R2 -73 
LDR R2 R2 
STR R3 R2 
LDR R3 N198  ; start AEF 
SUB R4 R4 
ADI R4 4 
MUL R4 R3 
MOV R2 FP 
ADI R2 -28 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -85 
STR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
MOV R4 R3 
LDR R3 N147 
ADD R3 R4 
MOV R2 FP 
ADI R2 -89 
STR R3 R2 
MOV R2 FP 
ADI R2 -89 
LDR R3 R2 
MOV R2 FP 
ADI R2 -85 
LDR R2 R2 
STR R3 R2 
LDR R3 N108  ; start AEF 
SUB R4 R4 
ADI R4 4 
MUL R4 R3 
MOV R2 FP 
ADI R2 -28 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -97 
STR R3 R2 
MOV R2 FP 
ADI R2 -97 
LDR R1 R2 
LDR R3 R1 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
STR R3 R2 
LDR R3 N108  ; start AEF 
SUB R4 R4 
ADI R4 4 
MUL R4 R3 
MOV R2 FP 
ADI R2 -44 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -105 
STR R3 R2 
MOV R0 SL ; start NEWI 
ADI R1 9 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -109 
MOV R3 SL 
STR R3 R2 
ADI SL 9 ; end NEWI 
MOV R1 SP ;  static initializer for class Syntax backpatched to S365 Frame S365 
ADI R1 -21 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -109 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S365 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -109 
STR R1 R2 
MOV R1 SP ;  Syntax Syntax(['P187', 'P188']) Frame X189 
ADI R1 -22 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -109 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push N150 size: 4 type: int offset: 0 
LDR R3 N150 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push H167 size: 1 type: char offset: 0 
LDB R3 H167 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X189 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -109 
STR R1 R2 
MOV R2 FP 
ADI R2 -109 
LDR R3 R2 
MOV R2 FP 
ADI R2 -105 
LDR R2 R2 
STR R3 R2 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2  ; start AEF 
SUB R4 R4 
ADI R4 4 
MUL R4 R3 
MOV R2 FP 
ADI R2 -44 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -117 
STR R3 R2 
LDR R3 N109 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -121 
STR R3 R2 
MOV R2 FP 
ADI R2 -121 
LDR R3 R2  ; start AEF 
SUB R4 R4 
ADI R4 4 
MUL R4 R3 
MOV R2 FP 
ADI R2 -44 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -125 
STR R3 R2 
MOV R2 FP 
ADI R2 -125 
LDR R1 R2 
LDR R3 R1 
MOV R2 FP 
ADI R2 -117 
LDR R2 R2 
STR R3 R2 
LDR R3 N144 
MOV R4 R3 
LDR R3 N150 
DIV R3 R4 
MOV R2 FP 
ADI R2 -133 
STR R3 R2 
MOV R2 FP 
ADI R2 -133 
LDR R3 R2 
MOV R4 R3 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -137 
STR R3 R2 
MOV R2 FP 
ADI R2 -137 
LDR R3 R2  ; start AEF 
SUB R4 R4 
ADI R4 4 
MUL R4 R3 
MOV R2 FP 
ADI R2 -44 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -141 
STR R3 R2 
MOV R0 SL ; start NEWI 
ADI R1 9 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -145 
MOV R3 SL 
STR R3 R2 
ADI SL 9 ; end NEWI 
MOV R1 SP ;  static initializer for class Syntax backpatched to S365 Frame S365 
ADI R1 -21 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -145 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S365 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -145 
STR R1 R2 
MOV R1 SP ;  Syntax Syntax(['P187', 'P188']) Frame X189 
ADI R1 -22 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -145 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push I184 size: 4 type: int offset: 4 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push I185 size: 1 type: char offset: 8 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
LDB R3 R2 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X189 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -145 
STR R1 R2 
MOV R2 FP 
ADI R2 -145 
LDR R3 R2 
MOV R2 FP 
ADI R2 -141 
LDR R2 R2 
STR R3 R2 
LDR R3 N108  ; start AEF 
SUB R4 R4 
ADI R4 4 
MUL R4 R3 
MOV R2 FP 
ADI R2 -28 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -153 
STR R3 R2 
MOV R1 SP ;  which(['P199']) Frame M200 
ADI R1 -24 
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
MOV R0 SP ; Push A410 size: 4 type: int offset: -141 
MOV R2 FP 
ADI R2 -153 
LDR R1 R2 
LDR R3 R1 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M200 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -157 
STR R1 R2 
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
M200 ADI SP -8 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
MUL R3 R4 
MOV R2 FP 
ADI R2 -16 
STR R3 R2 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
MOV R2 FP 
ADI R2 -12 
STR R3 R2 
MOV R0 FP ; rtn 
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
M201 ADI SP -57 
MOV R0 SL ; start NEWI 
ADI R1 12 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -21 
MOV R3 SL 
STR R3 R2 
ADI SL 12 ; end NEWI 
MOV R1 SP ;  static initializer for class Message backpatched to S276 Frame S276 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -21 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S276 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -21 
STR R1 R2 
MOV R1 SP ;  Message Message([]) Frame X140 
ADI R1 -122 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -21 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X140 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -21 
STR R1 R2 
MOV R2 FP 
ADI R2 -21 
LDR R3 R2 
MOV R2 FP 
ADI R2 -17 
STR R3 R2 
MOV R0 SL ; start NEWI 
ADI R1 8 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -29 
MOV R3 SL 
STR R3 R2 
ADI SL 8 ; end NEWI 
MOV R1 SP ;  static initializer for class iTree backpatched to S206 Frame S206 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -29 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S206 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -29 
STR R1 R2 
MOV R1 SP ;  iTree iTree([]) Frame X104 
ADI R1 -16 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -29 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X104 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -29 
STR R1 R2 
MOV R2 FP 
ADI R2 -29 
LDR R3 R2 
MOV R2 FP 
ADI R2 -13 
STR R3 R2 
MOV R1 SP ;  void msg3([]) Frame M182 
ADI R1 -28 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -17 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M182 ; call 
MOV R2 FP 
ADI R2 -12 
TRP 4 ;  cin >> key(char) 
STB R3 R2 
LDB R3 H119 
TRP 3 ;  cout << '\n'(char) 
begin419 LDB R3 H205 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
CMP R3 R4 
BNZ R3 Z448 
SUB R3 R3 
JMP Z449 
Z448 SUB R3 R3 
ADI R3 1 
Z449 MOV R2 FP 
ADI R2 -41 
STR R3 R2 
MOV R2 FP 
ADI R2 -41 
LDR R3 R2 
BRZ R3 endwhile421 
MOV R1 SP ;  bool add(['P111']) Frame M112 
ADI R1 -29 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -13 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push L202 size: 1 type: char offset: 0 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M112 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -45 
STR R1 R2 
MOV R2 FP 
ADI R2 -45 
LDR R3 R2 
BRZ R3 skipif423 
MOV R1 SP ;  void msg1(['P178']) Frame M179 
ADI R1 -17 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -17 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push L202 size: 1 type: char offset: 0 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M179 ; call 
MOV R1 SP ;  void print([]) Frame M118 
ADI R1 -20 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -13 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M118 ; call 
JMP skipelse426 ;  Jump skipelse426 
skipif423 MOV R1 SP ;  void msg2(['P180']) Frame M181 
ADI R1 -34 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -17 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push L202 size: 1 type: char offset: 0 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M181 ; call 
MOV R1 SP ;  void print([]) Frame M118 
ADI R1 -20 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -13 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M118 ; call 
skipelse426 MOV R1 SP ;  void msg3([]) Frame M182 
ADI R1 -28 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -17 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M182 ; call 
MOV R2 FP 
ADI R2 -12 
TRP 4 ;  cin >> key(char) 
STB R3 R2 
LDB R3 H119 
TRP 3 ;  cout << '\n'(char) 
JMP begin419 ;  Jump begin419 
endwhile421 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
S276 ADI SP 0 
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
S206 ADI SP 0 
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
S365 ADI SP -9 
LDR R3 N150 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
STR R3 R2 
LDB R3 H168 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
STB R3 R2 
LDR R3 B117 
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
S268 ADI SP -12 
LDR R3 N108 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 8 
STR R3 R2 
LDR R3 N105 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 4 
STR R3 R2 
LDR R3 N105 
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
N172 .INT 27 
N173 .INT 28 
N170 .INT 25 
N171 .INT 26 
B113 .INT 1 
B117 .INT 0 
H149 .BYT 69 
H143 .BYT 100 
H142 .BYT 65 
H145 .BYT 101 
N160 .INT 13 
N162 .INT 14 
N169 .INT 24 
N198 .INT 5000 
N194 .INT 512 
N196 .INT 256 
N197 .INT 31 
N192 .INT 1000 
N110 .INT 2 
H205 .BYT 33 
H127 .BYT 41 
H126 .BYT 40 
H125 .BYT 44 
H124 .BYT 32 
N105 .INT 0 
N109 .INT 1 
N108 .INT 0 
H119 .BYT 10 
N148 .INT 6 
N141 .INT 100 
N144 .INT 3 
H174 .BYT 114 
N158 .INT 12 
H163 .BYT 68 
H161 .BYT 58 
H167 .BYT 99 
H166 .BYT 105 
H165 .BYT 112 
H164 .BYT 117 
N150 .INT 7 
N152 .INT 8 
H168 .BYT 97 
N155 .INT 10 
N156 .INT 11 
N153 .INT 9 
H159 .BYT 116 
H157 .BYT 110 
H154 .BYT 109 
N147 .INT 5 
N146 .INT 4 
H151 .BYT 108 
End TRP 0 
