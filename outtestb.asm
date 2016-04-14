Start MOV R1 SP ;  Frame main backpatched to M133 backpatched to N213 Frame M133 
ADI R1 -91 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R3 N213 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M133 ; call 
TRP 0 
X107 ADI SP -32 
MOV R0 SL ; start NEW 
LDR R3 N108 
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
ADI R2 -24 
STR R3 R2 
LDB R3 H110 
MOV R2 FP 
ADI R2 -24 
LDR R2 R2 
STB R3 R2 
LDR R3 N111  ; start AEF 
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
LDB R3 H112 
MOV R2 FP 
ADI R2 -26 
LDR R2 R2 
STB R3 R2 
LDR R3 N113  ; start AEF 
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
LDB R3 H114 
MOV R2 FP 
ADI R2 -28 
LDR R2 R2 
STB R3 R2 
LDR R3 N115  ; start AEF 
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
LDB R3 H116 
MOV R2 FP 
ADI R2 -30 
LDR R2 R2 
STB R3 R2 
LDR R3 N117  ; start AEF 
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
LDB R3 H118 
MOV R2 FP 
ADI R2 -32 
LDR R2 R2 
STB R3 R2 
LDR R3 N103  ; start AEF 
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
LDB R3 H119 
MOV R2 FP 
ADI R2 -34 
LDR R2 R2 
STB R3 R2 
LDR R3 N120  ; start AEF 
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
LDB R3 H121 
MOV R2 FP 
ADI R2 -36 
LDR R2 R2 
STB R3 R2 
LDR R3 N122  ; start AEF 
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
LDB R3 H114 
MOV R2 FP 
ADI R2 -38 
LDR R2 R2 
STB R3 R2 
LDR R3 N123  ; start AEF 
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
LDB R3 H114 
MOV R2 FP 
ADI R2 -40 
LDR R2 R2 
STB R3 R2 
LDR R3 N124  ; start AEF 
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
LDB R3 H125 
MOV R2 FP 
ADI R2 -42 
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
M126 ADI SP -34 
LDR R3 N109 
MOV R2 FP 
ADI R2 -12 
STR R3 R2 
begin164 LDR R3 N103 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
CMP R3 R4 
BLT R3 Z214 
SUB R3 R3 
JMP Z215 
Z214 SUB R3 R3 
ADI R3 1 
Z215 MOV R2 FP 
ADI R2 -20 
STR R3 R2 
MOV R2 FP 
ADI R2 -20 
LDR R3 R2 
BRZ R3 endwhile166 
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
TRP 3 ;  cout << A167(char) 
LDR R3 N111 
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
JMP begin164 ;  Jump begin164 
endwhile166 LDB R3 H128 
TRP 3 ;  cout << ' '(char) 
begin170 LDR R3 N108 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
CMP R3 R4 
BLT R3 Z216 
SUB R3 R3 
JMP Z217 
Z216 SUB R3 R3 
ADI R3 1 
Z217 MOV R2 FP 
ADI R2 -33 
STR R3 R2 
MOV R2 FP 
ADI R2 -33 
LDR R3 R2 
BRZ R3 endwhile172 
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
ADI R2 -37 
STR R3 R2 
MOV R2 FP 
ADI R2 -37 
LDR R1 R2 
LDB R3 R1 
TRP 3 ;  cout << A173(char) 
LDR R3 N111 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -38 
STR R3 R2 
MOV R2 FP 
ADI R2 -38 
LDR R3 R2 
MOV R2 FP 
ADI R2 -12 
STR R3 R2 
JMP begin170 ;  Jump begin170 
endwhile172 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M131 ADI SP -13 
begin176 MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
MOV R4 R3 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
CMP R3 R4 
BLT R3 Z218 
BRZ R3 Z218 
SUB R3 R3 
JMP Z219 
Z218 SUB R3 R3 
ADI R3 1 
Z219 MOV R2 FP 
ADI R2 -20 
STR R3 R2 
MOV R2 FP 
ADI R2 -20 
LDR R3 R2 
BRZ R3 endwhile178 
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
TRP 3 ;  cout << A179(char) 
LDR R3 N111 
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
JMP begin176 ;  Jump begin176 
endwhile178 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
M132 ADI SP 0 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 5 
LDR R3 R2 
TRP 1 ;  cout << num(int) 
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
M133 ADI SP -79 
MOV R0 SL ; start NEW 
LDR R3 N103 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
ADD R1 R4 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -20 
MOV R3 SL 
STR R3 R2 
ADD SL R4 ; end NEW 
MOV R2 FP 
ADI R2 -20 
LDR R3 R2 
MOV R2 FP 
ADI R2 -16 
STR R3 R2 
LDR R3 N109  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -32 
STR R3 R2 
LDB R3 H110 
MOV R2 FP 
ADI R2 -32 
LDR R2 R2 
STB R3 R2 
LDR R3 N111  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -34 
STR R3 R2 
LDB R3 H112 
MOV R2 FP 
ADI R2 -34 
LDR R2 R2 
STB R3 R2 
LDR R3 N113  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -36 
STR R3 R2 
LDB R3 H114 
MOV R2 FP 
ADI R2 -36 
LDR R2 R2 
STB R3 R2 
LDR R3 N115  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -38 
STR R3 R2 
LDB R3 H116 
MOV R2 FP 
ADI R2 -38 
LDR R2 R2 
STB R3 R2 
LDR R3 N117  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -40 
STR R3 R2 
LDB R3 H118 
MOV R2 FP 
ADI R2 -40 
LDR R2 R2 
STB R3 R2 
LDR R3 N109  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -42 
STR R3 R2 
MOV R2 FP 
ADI R2 -42 
LDR R1 R2 
LDB R3 R1 
TRP 3 ;  cout << A195(char) 
LDR R3 N111  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -43 
STR R3 R2 
MOV R2 FP 
ADI R2 -43 
LDR R1 R2 
LDB R3 R1 
TRP 3 ;  cout << A196(char) 
LDR R3 N113  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -44 
STR R3 R2 
MOV R2 FP 
ADI R2 -44 
LDR R1 R2 
LDB R3 R1 
TRP 3 ;  cout << A197(char) 
LDR R3 N115  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -45 
STR R3 R2 
MOV R2 FP 
ADI R2 -45 
LDR R1 R2 
LDB R3 R1 
TRP 3 ;  cout << A198(char) 
LDR R3 N117  ; start AEF 
SUB R4 R4 
ADI R4 1 
MUL R4 R3 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
ADD R3 R4 
MOV R2 FP 
ADI R2 -46 
STR R3 R2 
MOV R2 FP 
ADI R2 -46 
LDR R1 R2 
LDB R3 R1 
TRP 3 ;  cout << A199(char) 
LDB R3 H136 
TRP 3 ;  cout << '\n'(char) 
MOV R0 SL ; start NEWI 
ADI R1 9 
CMP R0 SP 
BLT R1 End ; if room on the heap for object 
MOV R2 FP 
ADI R2 -47 
MOV R3 SL 
STR R3 R2 
ADI SL 9 ; end NEWI 
MOV R1 SP ;  static initializer for class printer backpatched to S137 Frame S137 
ADI R1 -17 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -47 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP S137 ; call 
MOV R0 SP 
LDR R1 R0 
MOV R2 FP 
ADI R2 -47 
STR R1 R2 
MOV R1 SP ;  printer printer([]) Frame X107 
ADI R1 -44 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
MOV R2 FP 
ADI R2 -47 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP X107 ; call 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -47 
STR R1 R2 
MOV R2 FP 
ADI R2 -47 
LDR R3 R2 
MOV R2 FP 
ADI R2 -12 
STR R3 R2 
MOV R2 FP  ; start REF 
ADI R2 -12 
LDR R3 R2 
ADI R3 5 
MOV R2 FP 
ADI R2 -55 
STR R3 R2  ; end REF 
MOV R2 FP 
ADI R2 -55 
LDR R1 R2 
LDR R3 R1 
TRP 1 ;  cout << R202(int) 
MOV R2 FP  ; start REF 
ADI R2 -12 
LDR R3 R2 
ADI R3 4 
MOV R2 FP 
ADI R2 -59 
STR R3 R2  ; end REF 
MOV R2 FP 
ADI R2 -59 
LDR R1 R2 
LDB R3 R1 
TRP 3 ;  cout << R203(char) 
LDB R3 H136 
TRP 3 ;  cout << '\n'(char) 
MOV R1 SP ;  void printname([]) Frame M126 
ADI R1 -46 
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
JMP M126 ; call 
LDB R3 H136 
TRP 3 ;  cout << '\n'(char) 
MOV R1 SP ;  void printrange(['P129', 'P130']) Frame M131 
ADI R1 -33 
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
MOV R0 SP ; Push N109 size: 4 type: int offset: 0 
LDR R3 N109 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push N117 size: 4 type: int offset: 0 
LDR R3 N117 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M131 ; call 
LDB R3 H128 
TRP 3 ;  cout << ' '(char) 
MOV R1 SP ;  void printrange(['P129', 'P130']) Frame M131 
ADI R1 -33 
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
MOV R0 SP ; Push N103 size: 4 type: int offset: 0 
LDR R3 N103 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push N124 size: 4 type: int offset: 0 
LDR R3 N124 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M131 ; call 
begin207 MOV R2 FP  ; start REF 
ADI R2 -12 
LDR R3 R2 
ADI R3 5 
MOV R2 FP 
ADI R2 -75 
STR R3 R2  ; end REF 
LDR R3 N109 
MOV R4 R3 
MOV R2 FP 
ADI R2 -75 
LDR R1 R2 
LDR R3 R1 
CMP R3 R4 
BNZ R3 Z220 
SUB R3 R3 
JMP Z221 
Z220 SUB R3 R3 
ADI R3 1 
Z221 MOV R2 FP 
ADI R2 -79 
STR R3 R2 
MOV R2 FP 
ADI R2 -79 
LDR R3 R2 
BRZ R3 endwhile210 
MOV R2 FP  ; start REF 
ADI R2 -12 
LDR R3 R2 
ADI R3 5 
MOV R2 FP 
ADI R2 -83 
STR R3 R2  ; end REF 
MOV R2 FP 
ADI R2 -83 
LDR R2 R2 
TRP 2 ;  cin >> R211(int) 
STR R3 R2 
MOV R1 SP ;  void printnum([]) Frame M132 
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
JMP M132 ; call 
JMP begin207 ;  Jump begin207 
endwhile210 MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV SP FP 
MOV FP R1 
JMR R3 ; rtn 
S137 ADI SP -5 
LDR R3 N103 
MOV R1 FP 
ADI R1 -8 
LDR R2 R1 
ADI R2 5 
STR R3 R2 
LDB R3 H105 
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
H136 .BYT 10 
N115 .INT 3 
N117 .INT 4 
N111 .INT 1 
N113 .INT 2 
H128 .BYT 32 
H125 .BYT 121 
H121 .BYT 101 
N103 .INT 5 
N109 .INT 0 
N108 .INT 10 
H118 .BYT 115 
H119 .BYT 84 
H112 .BYT 104 
H110 .BYT 67 
H116 .BYT 105 
H114 .BYT 114 
H105 .BYT 122 
N124 .INT 9 
N120 .INT 6 
N123 .INT 8 
N122 .INT 7 
N213 .INT 0 
End TRP 0 
