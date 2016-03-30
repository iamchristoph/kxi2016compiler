Start MOV R1 SP ;  Frame main backpatched to M123 Frame M123 
ADI R1 -24 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R3 this 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M123 ; call 
End TRP 0 
M102 ADI SP 0 
LDB R3 H103 
TRP 3 ;  cout << 'C'(char) 
LDB R3 H104 
TRP 3 ;  cout << 'h'(char) 
LDB R3 H105 
TRP 3 ;  cout << 'r'(char) 
LDB R3 H106 
TRP 3 ;  cout << 'i'(char) 
LDB R3 H107 
TRP 3 ;  cout << 's'(char) 
LDB R3 H108 
TRP 3 ;  cout << ' '(char) 
LDB R3 H109 
TRP 3 ;  cout << 'T'(char) 
LDB R3 H110 
TRP 3 ;  cout << 'e'(char) 
LDB R3 H105 
TRP 3 ;  cout << 'r'(char) 
LDB R3 H105 
TRP 3 ;  cout << 'r'(char) 
LDB R3 H111 
TRP 3 ;  cout << 'y'(char) 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV FP R1 
JMR R3 ; rtn 
M113 ADI SP 0 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
TRP 1 ;  cout << n(int) 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV FP R1 
JMR R3 ; rtn 
M115 ADI SP 0 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
TRP 3 ;  cout << c(char) 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV FP R1 
JMR R3 ; rtn 
M116 ADI SP -32 
MOV R1 SP ;  printname([]) Frame M102 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R3 this 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M102 ; call 
MOV R1 SP ;  printchar(['P114']) Frame M115 
ADI R1 -13 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R3 this 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push H108 size: 1 type: char offset: 0 
LDB R3 H108 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M115 ; call 
MOV R1 SP ;  printchar(['P114']) Frame M115 
ADI R1 -13 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R3 this 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push H117 size: 1 type: char offset: 0 
LDB R3 H117 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M115 ; call 
MOV R1 SP ;  printchar(['P114']) Frame M115 
ADI R1 -13 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R3 this 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push H108 size: 1 type: char offset: 0 
LDB R3 H108 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M115 ; call 
MOV R1 SP ;  printnum(['P112']) Frame M113 
ADI R1 -16 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R3 this 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push N118 size: 4 type: int offset: 0 
LDR R3 N118 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M113 ; call 
MOV R1 SP ;  printchar(['P114']) Frame M115 
ADI R1 -13 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R3 this 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push H108 size: 1 type: char offset: 0 
LDB R3 H108 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M115 ; call 
MOV R1 SP ;  printname([]) Frame M102 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R3 this 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M102 ; call 
MOV R1 SP ;  printchar(['P114']) Frame M115 
ADI R1 -13 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R3 this 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push H119 size: 1 type: char offset: 0 
LDB R3 H119 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M115 ; call 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV FP R1 
JMR R3 ; rtn 
M122 ADI SP -8 
MOV R1 SP ;  printnum(['P112']) Frame M113 
ADI R1 -16 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R3 this 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push P120 size: 4 type: int offset: 0 
MOV R2 FP 
ADI R2 -12 
LDR R3 R2 
STR R3 R0 
ADI SP -4 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M113 ; call 
MOV R1 SP ;  printchar(['P114']) Frame M115 
ADI R1 -13 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R3 this 
STR R3 SP ; store the this pointer at FP - 8 
ADI SP -4 ;  end Frame 
MOV R0 SP ; Push P121 size: 1 type: char offset: -4 
MOV R2 FP 
ADI R2 -16 
LDB R3 R2 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M115 ; call 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV FP R1 
JMR R3 ; rtn 
M123 ADI SP -12 
MOV R1 SP ;  void printall([]) Frame M116 
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
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M116 ; call 
MOV R1 SP ;  void printthese(['P120', 'P121']) Frame M122 
ADI R1 -25 
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
MOV R0 SP ; Push N125 size: 4 type: int offset: 0 
LDR R3 N125 
STR R3 R0 
ADI SP -4 
MOV R0 SP ; Push H126 size: 1 type: char offset: 0 
LDB R3 H126 
STB R3 R0 
ADI SP -1 
MOV FP R7 ; call 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M122 ; call 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV FP R1 
JMR R3 ; rtn 
S127 ADI SP 0 
MOV R0 FP ; rtn 
ADI R0 -4 
LDR R1 R0 ; get the previous frame pointer 
ADI R0 -4 
LDR R2 R0 ; get the this pointer 
LDR R3 FP 
STR R2 FP 
MOV FP R1 
JMR R3 ; rtn 
H105 .BYT 'r' 
H104 .BYT 'h' 
H107 .BYT 's' 
H106 .BYT 'i' 
H103 .BYT 'C' 
N118 .INT 10 
H108 .BYT ' ' 
H109 .BYT 'T' 
N125 .INT 7 
H119 .BYT '_' 
H110 .BYT 'e' 
H111 .BYT 'y' 
H117 .BYT 'Q' 
H126 .BYT 'V' 
this .INT 0 
