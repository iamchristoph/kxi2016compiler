; proj3.asm
;
SIZE    .INT  7         ; const int  SIZE = 7
TEN     .INT  10
CHARS   .BYT  48
        .BYT  49
        .BYT  50
        .BYT  51
        .BYT  52 
        .BYT  53
        .BYT  54
        .BYT  55
        .BYT  56
        .BYT  57
        .BYT  32
        .BYT  10
        .BYT  @
        .BYT  +
        .BYT  -
        .BYT  i
        .BYT  s
        .BYT  n
        .BYT  o
        .BYT  t
        .BYT  a
        .BYT  u
        .BYT  m
        .BYT  b
        .BYT  e
        .BYT  r
        .BYT  N
        .BYT  B
        .BYT  g
        .BYT  O
        .BYT  p
        .BYT  d
INTS    .INT  0
ONE     .INT  1
TWO     .INT  2
THREE   .INT  3
FOUR    .INT  4
FIVE    .INT  5
SIX     .INT  6
SEVEN   .INT  7
EIGHT   .INT  8
NINE    .INT  9

cnt     .INT  0         ; int  cnt
tenth   .INT  0         ; int  tenth
c       .BYT  0         ; char c[SIZE]
        .BYT  0
        .BYT  0
        .BYT  0
        .BYT  0
        .BYT  0
        .BYT  0
data    .INT  0         ; int  data
flag    .INT  0         ; int  flag
opdv    .INT  0         ; int  opdv
; /*   Convert char j to an integer if possible.
;  If the flag is not set use the sign indicator s
;  and the tenths indicator to compute the actual
;  value of j.  Add the value to the accumulator opdv. */
;
OPD     MOV   R7  FP      ; void opd(char s, int k, char j) {  
        ADI   R7  -20     ;     S = FP-16, K = FP-12, J = FP-8, PREVFRAME = FP-4, RETURN = FP
        MOV   R1  SP
        ADI   R1  -4 
        CMP   R1  SL
        BLT   R1  ENDOPD
        ADI   SP  -4      ;  address of T in R7   int t = 0   // Local var  
        MOV   R0  FP      ;  if (j == '0')      // Convert
        ADI   R0  -8 
        LDB   R1  R0      ;   put j in R1
        LDA   R2  CHARS   ;   GET THE FIRST NUMBER CHARACTER address '0'
        LDB   R3  R2
        CMP   R3  R1      ;    J CMP '0'
        BNZ   R3  OPD1
        LDR   R4  INTS
        STR   R3  R7  
        JMP   OPDENDIF    ;  T = 0
                          ;  else if (j == '1')
OPD1    ADI   R2  1       ;  POINT TO '1'
        LDB   R3  R2
        CMP   R3  R1
        BNZ   R3  OPD2
        LDR   R3  ONE
        STR   R3  R7
        JMP   OPDENDIF
                          ;   t = 1
                          ;  else if (j == '2')
OPD2    ADI   R2  1       
        LDB   R3  R2
        CMP   R3  R1
        BNZ   R3  OPD3
        LDR   R3  TWO
        STR   R3  R7 
        JMP   OPDENDIF     ;   t = 2
                          ;  else if (j == '3')
OPD3    ADI   R2  1       
        LDB   R3  R2
        CMP   R3  R1
        BNZ   R3  OPD4
        LDR   R3  THREE
        STR   R3  R7      ;   t = 3
        JMP   OPDENDIF
                          ;  else if (j == '4')
OPD4    ADI   R2  1       
        LDB   R3  R2
        CMP   R3  R1
        BNZ   R3  OPD5
        LDR   R3  FOUR
        STR   R3  R7
        JMP   OPDENDIF
                          ;   t = 4
                          ;  else if (j == '5')
OPD5    ADI   R2  1       
        LDB   R3  R2
        CMP   R3  R1
        BNZ   R3  OPD6
        LDR   R3  FIVE
        STR   R3  R7
        JMP   OPDENDIF
                          ;   t = 5
                          ;  else if (j == '6')
OPD6    ADI   R2  1       
        LDB   R3  R2
        CMP   R3  R1
        BNZ   R3  OPD7
        LDR   R3  SIX
        STR   R3  R7   
        JMP   OPDENDIF                       
                          ;   t = 6
                          ;  else if (j == '7')
OPD7    ADI   R2  1       
        LDB   R3  R2
        CMP   R3  R1
        BNZ   R3  OPD8
        LDR   R3  SEVEN
        STR   R3  R7
        JMP   OPDENDIF
                          ;   t = 7
                          ;  else if (j == '8')
OPD8    ADI   R2  1
        LDB   R3  R2
        CMP   R3  R1
        BNZ   R3  OPD9
        LDR   R3  EIGHT
        STR   R3  R7
        JMP   OPDENDIF
                          ;   t = 8
                          ;  else if (j == '9')
OPD9    ADI   R2  1
        LDB   R3  R2
        CMP   R3  R1
        BNZ   R3  OPD10
        LDR   R3  NINE
        STR   R3  R7
        JMP   OPDENDIF
                          ;   t = 9
                          ;  else {
OPD10   MOV   R0  FP
        ADI   R0  -8
        LDB   R3  R0
        TRP   3
        LDA   R0  CHARS
        ADI   R0  10
        LDB   R3  R0
        TRP   3
        ADI   R0  5
        LDB   R3  R0
        TRP   3
        ADI   R0  1
        LDB   R3  R0
        TRP   3
        ADI   R0  -6
        LDB   R3  R0
        TRP   3
        ADI   R0  7
        LDB   R3  R0
        TRP   3
        ADI   R0  1
        LDB   R3  R0
        TRP   3
        ADI   R0  1
        LDB   R3  R0
        TRP   3
        ADI   R0  -9
        LDB   R3  R0
        TRP   3
        ADI   R0  10
        LDB   R3  R0
        TRP   3
        ADI   R0  -10
        LDB   R3  R0
        TRP   3
        ADI   R0  7
        LDB   R3  R0
        TRP   3
        ADI   R0  4
        LDB   R3  R0
        TRP   3
        ADI   R0  1
        LDB   R3  R0
        TRP   3
        ADI   R0  1
        LDB   R3  R0
        TRP   3
        ADI   R0  1
        LDB   R3  R0
        TRP   3
        ADI   R0  1
        LDB   R3  R0
        TRP   3
        ADI   R0  -14
        LDB   R3  R0
        TRP   3
                          ;   printf("%c is not a number\n", j)
        LDA   R0  INTS
        ADI   R0  4
        LDR   R1  R0
        STR   R1  flag
                          ;   flag = 1 
                          ;  }
OPDENDIF  LDR R0  flag
        BNZ   R0  OPDENDIF1   ;  if (!flag) {
        LDA   R0  CHARS
        ADI   R0  13
        LDB   R1  R0
        MOV   R0  FP
        ADI   R0  -16
        LDR   R2  R0
        CMP   R2  R1
        BNZ   R2  OPD11
        MOV   R0  FP      ;   if (s == '+')
        ADI   R0  -20
        LDR   R1  R0
        ADI   R0  8 
        LDR   R2  R0
        MUL   R2  R1
        ADI   R0  -8      ;    t *= k
        STR   R2  R0
        JMP   OPDENDIF1
OPD11   MOV   R0  FP      ;   LOAD T
        ADI   R0  -20
        LDR   R1  R0
        ADI   R0  8 
        LDR   R2  R0
        LDR   R3  INTS
        ADI   R3  -1
        MUL   R2  R3
        MUL   R2  R1
        ADI   R0  -8      ;    t *= -k
        STR   R2  R0                  ;   else
OPDENDIF1   LDR   R1  opdv    ;    t *= -k
        MOV   R0  FP      ;   opdv += t
        ADI   R0  -20
        LDR   R2  R0 
        ADD   R1  R2
        STR   R1  opdv    
ENDOPD  MOV   SP  FP
        MOV   R0  FP 
        ADI   R0  -4 
        LDR   R1  R0
        MOV   FP  R1
        LDR   R0  SP
        JMR   R0           ; END OPDV FUNCTION


;   Discard keyboard input until a newline '\n' is
;   Encountered. 
FLUSH   LDA   R0  INTS      ; void flush() {
        LDR   R1  R0        ; GET 0
        STR   R1  data      ;  data = 0
        LDA   R0  CHARS
        ADI   R0  11
        LDB   R2  R0        ; GET THE '\n'
FLUSHW  TRP   4             ;  c[0] = getchar()
        CMP   R3  R2        ;  while (c[0] != '\n')
        BNZ   R3  FLUSHW    ;   c[0] = getchar()
        MOV   SP  FP
        MOV   R0  FP 
        ADI   R0  -4 
        LDR   R1  R0
        MOV   FP  R1
        LDR   R0  SP
        JMR   R0                   ;   GO BACK TO CALLING 

;    Read one char
;    at a time from the keyboard after a
;    newline '\n' has been entered. If there is room
;    place the char in the array c
;    otherwise indicate the number is too big and
;    flush the keyboard input. */
GETDATA LDR   R0  cnt     ; void getdata() {
        LDR   R1  SIZE
        CMP   R1  R0
        BLT   R1  GETDATA1  ;  if (cnt < SIZE) {  //  Get data if there is room
        BRZ   R1  GETDATA1  ;   c[cnt] = getchar()  // Your TRP 4 should work like getchar()
        LDA   R4  c
        ADD   R4  R0
        TRP   4
        STB   R3  R4
        LDR   R0  cnt
        ADI   R0  1 
        STR   R0  cnt         ;   cnt++
        JMP   ENDGETDATA  ; } else {
GETDATA1  LDA   R0  CHARS   ;   printf("Number too Big\n")
        ADI   R0  26      
        LDB   R3  R0        ; LOAD 'N'
        TRP   3 
        ADI   R0  -5
        LDB   R3  R0        ; LOAD 'u'
        TRP   3 
        ADI   R0  1 
        LDB   R3  R0        ; LOAD 'm'
        TRP   3 
        ADI   R0  1 
        LDB   R3  R0        ; LOAD 'b'
        TRP   3 
        ADI   R0  1 
        LDB   R3  R0        ; LOAD 'e'
        TRP   3 
        ADI   R0  1 
        LDB   R3  R0        ; LOAD 'r'
        TRP   3
        ADI   R0  -15
        LDB   R3  R0        ; LOAD ' '
        TRP   3 
        ADI   R0  9 
        LDB   R3  R0        ; LOAD 't'
        TRP   3
        ADI   R0  -1
        LDB   R3  R0        ; LOAD 'o'
        TRP   3
        TRP   3
        ADI   R0  -8 
        LDB   R3  R0        ; LOAD ' '
        TRP   3
        ADI   R0  17
        LDB   R3  R0        ; LOAD 'B'
        TRP   3
        ADI   R0  -12
        LDB   R3  R0        ; LOAD 'i'
        TRP   3
        ADI   R0  13
        LDB   R3  R0        ; LOAD 'g'
        TRP   3
        ADI   R0  -17
        LDB   R3  R0        ; LOAD '\n'
        TRP   3
        MOV   R1  SP
        ADI   R1  -24       ;  GET THE NEW TOP OF STACK AND COMPARE TO STACK LIMIT
        CMP   R1  SL
        BLT   R1  ENDGETDATA
        MOV   R3  PC        ; GET PC FOR RETURN ADDRESS
        ADI   R3  96
        STR   R3  SP
        MOV   R0  SP
        ADI   R0  -4
        STR   FP  R0
        MOV   FP  SP
        ADI   SP  -8 
        JMP   FLUSH
                            ;  flush()

ENDGETDATA    MOV   SP  FP
        MOV   R0  FP 
        ADI   R0  -4 
        LDR   R1  R0
        MOV   FP  R1
        LDR   R0  SP
        JMR   R0                  ;   GO BACK TO CALLING   
                            ;  } } /*

;   Reset c to all 0’s;
;   Assign values to data, opdv, cnt and flag. 
RESET   LDR   R0  INTS    ; void              reset(int w, int x, int y, int z) {
        LDA   R1  c       ;  int k  // Local var    FP-20  FP-16  FP-12   FP-8 
        MOV   R2  R0      ;   R0
        LDR   R4  SIZE
        ADD   R4  R1

RESETFOR  STB   R2  R1    ; c[k] = 0
        ADI   R1  1 
        MOV   R5  R4
        CMP   R5  R1      ;  for (k= 0; k < SIZE; k++)
        BNZ   R5  RESETFOR      
        MOV   R0  FP
        ADI   R0  -8      ;  data = w
        LDR   R1  R0      ;  opdv = x
        STR   R1  flag    ;  cnt  = y
        ADI   R0  -4      
        LDR   R1  R0      
        STR   R1  cnt 
        ADI   R0  -4     
        LDR   R1  R0     
        STR   R1  opdv
        ADI   R0  -4     
        LDR   R1  R0     
        STR   R1  data
                          ;  flag = z
        MOV   SP  FP
        MOV   R0  FP 
        ADI   R0  -4 
        LDR   R1  R0
        MOV   FP  R1
        LDR   R0  SP
        JMR   R0                  ;   GO BACK TO CALLING   
                          ; } /*

;   Get input from the keyboard until the symbol '@' is encountered.
;   Convert the char data input from the keyboard to an integer be
;   Sure to account for the sign of the number.  If no sign is used
;   always assume the number is positive. */
Start   MOV   R1  SP
        ADI   R1  -24       ;  GET THE NEW TOP OF STACK AND COMPARE TO STACK LIMIT
        CMP   R1  SL
        BLT   R1  End       ; FAIL TO END IF NO ROOM ON THE STACK
        MOV   R3  FP 
        ADI   R3  -8        ; STORE MY PARAMETERS
        LDR   R1  INTS
        STR   R1  R3
        ADI   R3  -4 
        STR   R1  R3
        ADI   R3  -4 
        STR   R1  R3
        ADI   R3  -4
        ADI   R1  1
        STR   R1  R3
        MOV   R3  PC        ; GET PC FOR RETURN ADDRESS
        ADI   R3  96
        STR   R3  SP
        MOV   R0  SP
        ADI   R0  -4
        STR   FP  R0
        MOV   FP  SP
        ADI   SP  -24
        JMP   RESET                  ; void main() {
                          ;  reset(1, 0, 0, 0); // Reset globals data = 1, opdv, cnt, flag = 0


        MOV   R1  SP
        ADI   R1  -8        ;  GET THE NEW TOP OF STACK AND COMPARE TO STACK LIMIT
        CMP   R1  SL
        BLT   R1  End       ; FAIL TO END IF NO ROOM ON THE STACK
        MOV   R3  PC        ; GET PC FOR RETURN ADDRESS
        ADI   R3  96
        STR   R3  SP
        MOV   R0  SP
        ADI   R0  -4
        STR   FP  R0
        MOV   FP  SP
        ADI   SP  -8 
        JMP   GETDATA  
                        ;  getdata();         // Get data
                          ;  while (c[0] != '@') { // Check for stop symbol '@'
WHILE1  LDA   R0  CHARS
        ADI   R0  12
        LDB   R1  R0      ; GET '@'
        LDB   R2  c       ; GET c[0]
        CMP   R1  R2
        BRZ   R1  ENDWHILE1
                          ;   if (c[0] == '+' || c[0] == '-') { // Determine sign


        LDA   R0  CHARS 
        ADI   R0  13      ; get the '+'
        LDB   R1  R0
        LDB   R2  c
        CMP   R1  R2
        BRZ   R1  IF1
        LDA   R0  CHARS 
        ADI   R0  14      ; get the '-'
        LDB   R1  R0
        LDB   R2  c
        CMP   R1  R2
        BNZ   R1  ELSE1
                            ;  MAKE THE FUNCTION CALL
IF1     MOV   R1  SP
        ADI   R1  -8        ;  GET THE NEW TOP OF STACK AND COMPARE TO STACK LIMIT
        CMP   R1  SL
        BLT   R1  End       ; FAIL TO END IF NO ROOM ON THE STACK
        MOV   R3  PC        ; GET PC FOR RETURN ADDRESS
        ADI   R3  96
        STR   R3  SP
        MOV   R0  SP
        ADI   R0  -4
        STR   FP  R0
        MOV   FP  SP
        ADI   SP  -8 
        JMP   GETDATA  
                     
        JMP ENDIF1        ;    getdata(); // Get most significant byte

ELSE1   LDB   R1  c       ;   } else {  // Default sign is '+'
        LDA   R0  c       ;    c[1] = c[0]; // Make room for the sign
        ADI   R0  1 
        STB   R1  R0
        LDA   R0  CHARS 
        ADI   R0  13      ; get the '+'
        LDB   R1  R0
        STB   R1  c

                          ;    c[0] = '+'
                          ;    cnt++;
        LDR   R0  cnt 
        ADI   R0  1
        STR   R0 cnt
                          ;   }
ENDIF1  JMP WHILE2

WHILE2  LDR   R0  data
        BRZ   R0  ENDWHILE2   ;   while(data) {  // Loop while there is data to process

IF2     LDA   R0  CHARS   ;  IF2     if (c[cnt-1] == '\n') { // Process data now 
        ADI   R0  11
        LDB   R1  R0      ;  got the newline character
        LDR   R2  cnt
        ADI   R2  -1
        LDA   R0  c
        ADD   R0  R2      
        LDB   R2  R0      ;  got c[cnt-1]
        CMP   R1  R2
        BNZ   R1  ELSE2
        LDR   R0  INTS     ;            data = 0
        STR   R0  data
        ADI   R0  1
        STR   R0  tenth   ;            tenth = 1
        LDR   R0  cnt
        ADI   R0  -2
        STR   R0  cnt     ;            cnt = cnt - 2
WHILE3  LDR   R1  flag      ;  WHILE3    while (!flag && cnt != 0) { // Compute a number
        BNZ   R1  ENDWHILE3
        LDR   R0  cnt
        BRZ   R0  ENDWHILE3
                          ;             opd(c[0], tenth, c[cnt])
                            ;  MAKE THE FUNCTION CALL
        MOV   R1  SP
        ADI   R1  -20      ;  GET THE NEW TOP OF STACK AND COMPARE TO STACK LIMIT
        CMP   R1  SL
        BLT   R1  End       ; FAIL TO END IF NO ROOM ON THE STACK
        MOV   R0  SP
        ADI   R0  -8 
        LDA   R1  c
        LDR   R2  cnt
        ADD   R1  R2
        LDB   R2  R1
        STR   R2  R0        ; PUSH THE FIRST Operand
        ADI   R0  -4 
        LDR   R1  tenth
        STR   R1  R0        ; PUSH THE SECOND OPERAND
        ADI   R0  -4 
        LDB   R1  c
        STB   R1  R0        ;  PUSH THE LAST OPERAND 
        MOV   R3  PC        ; GET PC FOR RETURN ADDRESS
        ADI   R3  96
        STR   R3  SP
        MOV   R0  SP
        ADI   R0  -4
        STR   FP  R0
        MOV   FP  SP
        ADI   SP  -20
        JMP   OPD         ; JUMP TO FUNCTION
                   
        LDR   R0  cnt
        ADI   R0  -1      ;             cnt--
        STR   R0  cnt
        LDR   R0  tenth
        LDR   R1  TEN
        MUL   R0  R1      ;             tenth *= 10
        STR   R0  tenth
        JMP WHILE3
ENDWHILE3  JMP IF3        ;  ENDWHILE3 }



IF3       LDR R0  flag
          BNZ R0  ENDIF3  ;  IF3       if (!flag)  //  Good number entered

          LDA   R0  CHARS   ;   printf("Operand is %d\n", opdv)
        ADI   R0  29      
        LDB   R3  R0        ; LOAD 'O'
        TRP   3 
        ADI   R0  1 
        LDB   R3  R0        ; LOAD 'p'
        TRP   3 
        ADI   R0  -6
        LDB   R3  R0        ; LOAD 'e'
        TRP   3 
        ADI   R0  1 
        LDB   R3  R0        ; LOAD 'r'
        TRP   3 
        ADI   R0  -5
        LDB   R3  R0        ; LOAD 'a'
        TRP   3 
        ADI   R0  -3
        LDB   R3  R0        ; LOAD 'n'
        TRP   3 
        ADI   R0  14
        LDB   R3  R0        ; LOAD 'd'
        TRP   3 
        ADI   R0  -21
        LDB   R3  R0        ; LOAD ' '
        TRP   3 
        ADI   R0  5 
        LDB   R3  R0        ; LOAD 'i'
        TRP   3 
        ADI   R0  1 
        LDB   R3  R0        ; LOAD 's'
        TRP   3 
        ADI   R0  -6
        LDB   R3  R0        ; LOAD ' '
        TRP   3
        LDR   R3  opdv      ; LOAD opdv
        TRP   1 
        ADI   R0  1
        LDB   R3  R0        ; LOAD '\n'
        TRP   3 
ENDIF3  JMP   ENDIF2      ;  ENDIF3     
                          ;          }



ELSE2   MOV   R1  SP      ;  ELSE2   else
        ADI   R1  -8        ;  GET THE NEW TOP OF STACK AND COMPARE TO STACK LIMIT
        CMP   R1  SL
        BLT   R1  End       ; FAIL TO END IF NO ROOM ON THE STACK
        MOV   R3  PC        ; GET PC FOR RETURN ADDRESS
        ADI   R3  96
        STR   R3  SP
        MOV   R0  SP
        ADI   R0  -4
        STR   FP  R0
        MOV   FP  SP
        ADI   SP  -8 
        JMP   GETDATA                   
ENDIF2    JMP  WHILE2   ;  ENDIF2


; here we simply call reset and getdata again to before restarting the main loop.
ENDWHILE2 MOV   R1  SP
        ADI   R1  -24       ;  GET THE NEW TOP OF STACK AND COMPARE TO STACK LIMIT
        CMP   R1  SL
        BLT   R1  End       ; FAIL TO END IF NO ROOM ON THE STACK
        MOV   R3  FP 
        ADI   R3  -8        ; STORE MY PARAMETERS
        LDR   R1  INTS
        STR   R1  R3
        ADI   R3  -4 
        STR   R1  R3
        ADI   R3  -4 
        STR   R1  R3
        ADI   R3  -4
        ADI   R1  1
        STR   R1  R3
        MOV   R3  PC        ; GET PC FOR RETURN ADDRESS
        ADI   R3  96
        STR   R3  SP
        MOV   R0  SP
        ADI   R0  -4
        STR   FP  R0
        MOV   FP  SP
        ADI   SP  -24
        JMP   RESET                  ; void main() {
                          ;  reset(1, 0, 0, 0); // Reset globals data = 1, opdv, cnt, flag = 0

        MOV   R1  SP
        ADI   R1  -8        ;  GET THE NEW TOP OF STACK AND COMPARE TO STACK LIMIT
        CMP   R1  SL
        BLT   R1  End       ; FAIL TO END IF NO ROOM ON THE STACK
        MOV   R3  PC        ; GET PC FOR RETURN ADDRESS
        ADI   R3  96
        STR   R3  SP
        MOV   R0  SP
        ADI   R0  -4
        STR   FP  R0
        MOV   FP  SP
        ADI   SP  -8 
        JMP   GETDATA  
                        ;  getdata();         // Get data
                        
        JMP WHILE1      
ENDWHILE1 JMP End         ;  } end WHILE1
                          ; }end main
End       TRP 0