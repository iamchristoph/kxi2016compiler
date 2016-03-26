Start MOV R1 SP ;  Frame main backpatched to M120 Frame M120 
ADI R1 -24 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR SP FP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R2 this 
LDR R3 R2 
STR SP R3 ; store the this pointer at FP - 8 
MOV FP R7 
MOV R0 PC 
ADI R0 24 
STR FP R0 
JMP M120 
End STOP 
X107 FUNC X107 ;  Contructor for class word 
REF T124 I102 R125 ;  R125 = T124.w offset = 1 
MOV P105 R125 ;  R125(offset=-12) = w 
MOV P106 I103 ;  size(offset=5) = s 
RETURN this ; return from function xtor 
M109 FUNC M109 ;  @:char read([]) 
MOV N111 L110 ;  i(offset=0) = 0 
MUL N113 1 S131 ;  21 * 1 -> S131 
NEW S131 A130 ;  new array of charof size S131 
MOV A130 L112 ;  word(offset=-8) = A130 
begin133 LT N114 L110 T134 ;  T134 = i < 20 
BF T134 endwhile135 ;  BranchFalse T134 (bool) endwhile135 
AEF L112 L110 A136 ;  word + i * sizeof char (pointer) 
READ A136 char ;  cin >> A136(char) 
ADD N115 L110 T137 ;  T137 = i + 1 
MOV T137 L110 ;  i(offset=0) = T137 
JMP begin133 ;  Jump begin133 
endwhile135 AEF L112 L110 A139 ;  word + i * sizeof char (pointer) 
MOV H116 A139 ;  A139(offset=-37) = '\0' 
RETURN L112 ; return @:char word from function func 
RTN ; return from function func 
M118 FUNC M118 ;  int write(['P117']) 
MOV N111 L119 ;  i(offset=-4) = 0 
MOV R1 SP ;  read([]) Frame M109 
ADI R1 -51 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR SP FP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R2 this 
LDR R3 R2 
STR SP R3 ; store the this pointer at FP - 8 
MOV FP R7 
MOV R0 PC 
ADI R0 24 
STR FP R0 
JMP M109 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -24 
STR R2 R1 
MOV R1 SP ;  write(['P117']) Frame M118 
ADI R1 -46 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR SP FP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R2 this 
LDR R3 R2 
STR SP R3 ; store the this pointer at FP - 8 
MOV R0 SP ; Push L142 size: 4 type: @:char offset: -12 
MOV R2 FP 
ADI R2 -24 
LDR R3 R2 
STR R0 R3 
ADI SP 4 
MOV FP R7 
MOV R0 PC 
ADI R0 24 
STR FP R0 
JMP M118 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -28 
STR R2 R1 
RETURN L143 ; return int L143 from function func 
begin144 AEF P117 L119 A145 ;  w + i * sizeof char (pointer) 
NE H116 A145 T146 ;  T146 = A145 != '\0' 
BF T146 endwhile147 ;  BranchFalse T146 (bool) endwhile147 
AEF P117 L119 A148 ;  w + i * sizeof char (pointer) 
MOV R2 FP 
ADI R2 -37 
LDB R3 R2 
TRP 3 ;  cout << A148(char) 
ADD N115 L119 T149 ;  T149 = i + 1 
MOV T149 L119 ;  i(offset=-4) = T149 
JMP begin144 ;  Jump begin144 
endwhile147 RETURN L119 ; return int i from function func 
RTN ; return from function func 
M120 FUNC M120 ; void kxi2016 main() 
MOV R1 SP ;  @:char read([]) Frame M109 
ADI R1 -51 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR SP FP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R2 L121 
LDR R3 R2 
STR SP R3 ; store the this pointer at FP - 8 
MOV FP R7 
MOV R0 PC 
ADI R0 24 
STR FP R0 
JMP M109 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -16 
STR R2 R1 
MOV R1 SP ;  int write(['P117']) Frame M118 
ADI R1 -46 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR SP FP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R2 L121 
LDR R3 R2 
STR SP R3 ; store the this pointer at FP - 8 
MOV R0 SP ; Push L151 size: 4 type: @:char offset: -4 
MOV R2 FP 
ADI R2 -16 
LDR R3 R2 
STR R0 R3 
ADI SP 4 
MOV FP R7 
MOV R0 PC 
ADI R0 24 
STR FP R0 
JMP M118 
MOV R0 SP ;  get return value 
LDR R1 R0 
MOV R2 FP 
ADI R2 -20 
STR R2 R1 
MOV R2 FP 
ADI R2 -20 
LDR R3 R2 
TRP 1 ;  cout << L152(int) 
MOV R2 FP 
ADI R2 -12 
LDB R3 R2 
TRP 3 ;  cout << 'c'(char) 
RTN ; return from function main 
S123 FUNC S123 ;  static initializer for classword 
RTN ; return from static initializer for word 
S128 FUNC S128 ;  static initializer for classio 
RTN ; return from static initializer for io 
N113 .INT 21 
N114 .INT 20 
N115 .INT 1 
N111 .INT 0 
H122 .BYT 'c' 
H116 .BYT '\0' 
this .INT 0 
