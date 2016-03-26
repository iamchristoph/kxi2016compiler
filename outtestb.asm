Start MOV R1 SP ;  Frame main backpatched to M101 Frame M101 
ADI R1 -12 
CMP R1 SL 
BLT R1 End ; if room on the stack for function 
MOV R7 SP ; store the current SP in R7 for later assignment as new FP 
ADI SP -4 
STR FP SP ; store the previous frame pointer at FP - 4 
ADI SP -4 
LDR R2 this 
LDR R3 R2 
STR R3 SP ; store the this pointer at FP - 8 
MOV FP R7 
MOV R0 PC 
ADI R0 36 
STR R0 R7 
JMP M101 
End TRP 0 
M101 ADI SP 0 
LDB R3 H102 
TRP 3 ;  cout << 'C'(char) 
LDB R3 H103 
TRP 3 ;  cout << 'h'(char) 
LDB R3 H104 
TRP 3 ;  cout << 'r'(char) 
LDB R3 H105 
TRP 3 ;  cout << 'i'(char) 
LDB R3 H106 
TRP 3 ;  cout << 's'(char) 
LDB R3 H107 
TRP 3 ;  cout << '_'(char) 
LDR R3 N108 
TRP 1 ;  cout << 10(int) 
LDR R0 FP 
JMR R0 
H105 .BYT 'i' 
H104 .BYT 'r' 
H107 .BYT '_' 
H106 .BYT 's' 
H103 .BYT 'h' 
H102 .BYT 'C' 
N108 .INT 10 
this .INT 0 
