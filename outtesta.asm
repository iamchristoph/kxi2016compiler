Start MOV R1 SP Frame;  Frame main backpatched to M151 
ADI R1 -189 
CMP R1 SL 
BLT R1 End 
CALL M151  backpatched to M151 
End STOP 
M104 FUNC M104 ;  int blob(['P102', 'P103']) 
RETURN N105 ; return int 89 from function func 
RTN ; return from function func 
X106 FUNC X106 ;  Contructor for class _bufar 
RETURN this ; return from function xtor 
M111 FUNC M111 ;  rabuf muck(['P110']) 
MOV L113 L112 ;  x(offset=0) = y 
ADD L113 N114 T160 ;  T160 = 5 + y 
MOV T160 L112 ;  x(offset=0) = T160 
MUL N115 L113 T162 ;  T162 = y * 3 
DIV N116 I109 T163 ;  T163 = s / 4 
SUB I109 T163 T164 ;  T164 = T163 - s 
ADD T164 T162 T165 ;  T165 = T162 + T164 
MOV T165 L112 ;  x(offset=0) = T165 
REF T167 I108 I168 ;  I168 = T167.c offset = 0 
MOV H117 I168 ;  I168(offset=-44) = 'c' 
REF T170 I109 I171 ;  I171 = T170.s offset = 1 
MOV L112 I171 ;  I171(offset=-50) = x 
RETURN P110 ; return rabuf stuff from function func 
RTN ; return from function func 
M119 FUNC M119 ;  void print(['P118']) 
WRITE P118 int ;  cout << i(int) 
RTN ; return from function func 
M124 FUNC M124 ;  int blah([]) 
RETURN N125 ; return int 1 from function func 
RTN ; return from function func 
M128 FUNC M128 ;  int bar(['P126', 'P127']) 
ADD N131 I121 T174 ;  T174 = ex + 2 
AEF I146 T174 A175 ;  goo + T174 * sizeof int (pointer) 
MOV A175 L130 ;  a(offset=-4) = A175 
MOV T177 L134 ;  uck(offset=-25) = T177 
MOV T179 L136 ;  cu(offset=-41) = T179 
MOV H139 L138 ;  A(offset=-48) = 'A' 
REF T182 I122 I183 ;  I183 = T182.sucking offset = 24 
MOV R1 SP Frame;  blah([]) 
ADI R1 
CMP R1 SL 
BLT R1 End 
CALL M124 
PEEK L184 ;  get return value 
REF T185 I121 I186 ;  I186 = T185.ex offset = 20 
GT I186 L184 T187 ;  T187 = L184 > I186 
MOV T187 I183 ;  I183(offset=-54) = T187 
MUL L135 L137 T189 ;  T189 = goback * hit 
MOV T189 L130 ;  a(offset=-4) = T189 
EQ N114 L134 T191 ;  T191 = uck == 5 
BF T191 skipif192 ;  BranchFalse T191 (bool) skipif192 
BF I122 skipif193 ;  BranchFalse I122 (bool) skipif193 
WRITE H140 char ;  cout << 'Z'(char) 
JMP skipelse194 ;  Jump skipelse194 
skipif193 WRITE H139 char ;  cout << 'A'(char) 
skipelse194 MOV H140 L132 ;  chit(offset=-20) = 'Z' 
JMP skipelse196 ;  Jump skipelse196 
skipif192 DIV I121 L135 T197 ;  T197 = hit / ex 
ADD N114 T197 T198 ;  T198 = T197 + 5 
MOV T198 L130 ;  a(offset=-4) = T198 
MOV T200 L132 ;  chit(offset=-20) = T200 
LT N116 N114 T202 ;  T202 = 5 < 4 
BF T202 skipif203 ;  BranchFalse T202 (bool) skipif203 
WRITE H141 char ;  cout << 'Y'(char) 
JMP skipelse196 ;  Jump skipelse204 backpatched to skipelse196 
skipif203 READ L132 char ;  cin >> chit(char) 
skipelse196 LT N116 N114 T205 ;  T205 = 5 < 4 
BF T205 skipif206 ;  BranchFalse T205 (bool) skipif206 
begin207 BF I122 skipif206 ;  BranchFalse I122 (bool) endwhile208 backpatched to skipif206 
AEF I123 N125 A209 ;  goof + 1 * sizeof char (pointer) 
WRITE A209 char ;  cout << A209(char) 
JMP begin207 ;  Jump begin207 
skipif206 RETURN L135 ; return int hit from function func 
RTN ; return from function func 
X149 FUNC X149 ;  Contructor for class rabuf 
AEF I123 N150 A211 ;  goof + 10 * sizeof char (pointer) 
MOV H117 A211 ;  A211(offset=0) = 'c' 
RETURN T213 ; return rabuf T213 from function xtor 
RTN ; return from function func 
M151 FUNC M151 ; void kxi2016 main() 
MOV N114 L152 ;  cho(offset=0) = 5 
MOV N154 L153 ;  a(offset=-8) = null 
NEWI 9 L216 ;  new instance of _bufar -> L216 
MOV R1 SP Frame;  static initializer for class _bufar backpatched to S158 
ADI R1 
CMP R1 SL 
BLT R1 End 
CALL S158  backpatched to S158 
PEEK L216 
MOV R1 SP Frame;  _bufar _bufar([]) 
ADI R1 
CMP R1 SL 
BLT R1 End 
CALL X106 
PEEK L216 ;  get return value 
MOV L216 L157 ;  buf(offset=-21) = L216 
REF L157 I107 I218 ;  I218 = buf.bubu offset = 5 
REF L156 I121 I219 ;  I219 = rab.ex offset = 20 
MOV I219 I218 ;  I218(offset=-33) = I219 
WRITE H117 char ;  cout << 'c'(char) 
READ L153 int ;  cin >> a(int) 
WRITE L153 int ;  cout << a(int) 
MOV R1 SP Frame;  rabuf muck(['P110']) 
ADI R1 -62 
CMP R1 SL 
BLT R1 End 
MOV R0 SP 
MOV R2 FP 
ADI R2 -29 
LDR R1 R2 
STR R1 R0 
ADI SP 4 
CALL M111 
PEEK L221 ;  get return value 
REF L221 I121 I222 ;  I222 = L221.ex offset = 20 
MOV I222 L152 ;  cho(offset=0) = I222 
MOV R1 SP Frame;  int blah([]) 
ADI R1 
CMP R1 SL 
BLT R1 End 
CALL M124 
PEEK L224 ;  get return value 
MOV L224 L152 ;  cho(offset=0) = L224 
MOV R1 SP Frame;  rabuf muck(['P110']) 
ADI R1 -62 
CMP R1 SL 
BLT R1 End 
MOV R0 SP 
MOV R2 FP 
ADI R2 -29 
LDR R1 R2 
STR R1 R0 
ADI SP 4 
CALL M111 
PEEK L226 ;  get return value 
REF L226 I121 I227 ;  I227 = L226.ex offset = 20 
MOV L152 I227 ;  I227(offset=-69) = cho 
MOV T228 L153 ;  a(offset=-8) = T228 
REF L157 I107 I230 ;  I230 = buf.bubu offset = 5 
ADD I230 L152 T231 ;  T231 = cho + I230 
REF L156 I121 I232 ;  I232 = rab.ex offset = 20 
ADD L152 I232 T233 ;  T233 = I232 + cho 
MOV R1 SP Frame;  int bar(['P126', 'P127']) 
ADI R1 -122 
CMP R1 SL 
BLT R1 End 
MOV R0 SP 
MOV R2 FP 
ADI R2 -97 
LDR R1 R2 
STR R1 R0 
ADI SP 4 
MOV R0 SP 
MOV R2 FP 
ADI R2 -105 
LDR R1 R2 
STR R1 R0 
ADI SP 4 
CALL M128 
PEEK L234 ;  get return value 
MOV L234 L153 ;  a(offset=-8) = L234 
REF L156 I146 I236 ;  I236 = rab.goo offset = 8 
DIV N116 N114 T237 ;  T237 = 5 / 4 
SUB N125 T237 T238 ;  T238 = T237 - 1 
ADD T238 L152 T239 ;  T239 = cho + T238 
MUL T239 4 S241 ;  T239 * 4 -> S241 
NEW S241 A240 ;  new array of intof size S241 
MOV A240 I236 ;  I236(offset=-105) = A240 
REF L156 I146 I243 ;  I243 = rab.goo offset = 8 
AEF I243 N114 A244 ;  goo + 5 * sizeof int (pointer) 
MOV N115 A244 ;  A244(offset=-137) = 3 
NEWI 32 L246 ;  new instance of rabuf -> L246 
MOV R1 SP Frame;  static initializer for class rabuf backpatched to S173 
ADI R1 -4 
CMP R1 SL 
BLT R1 End 
CALL S173  backpatched to S173 
PEEK L246 
MOV R1 SP Frame;  rabuf rabuf(['P147', 'P148']) 
ADI R1 -14 
CMP R1 SL 
BLT R1 End 
MOV R0 SP 
MOV R2 FP 
ADI R2 -12 
LDR R1 R2 
STR R1 R0 
ADI SP 4 
MOV R0 SP 
MOV R2 FP 
ADI R2 -12 
LDR R1 R2 
STR R1 R0 
ADI SP 4 
CALL X149 
PEEK L246 ;  get return value 
MOV L246 L156 ;  rab(offset=-17) = L246 
REF L156 I144 I248 ;  I248 = rab.ra offset = 12 
MUL N114 4 S250 ;  5 * 4 -> S250 
NEW S250 A249 ;  new array of rabufof size S250 
MOV A249 I248 ;  I248(offset=-153) = A249 
REF L156 I144 I252 ;  I252 = rab.ra offset = 12 
AEF I252 N131 A253 ;  ra + 2 * sizeof rabuf (pointer) 
NEWI 32 L254 ;  new instance of rabuf -> L254 
MOV R1 SP Frame;  static initializer for class rabuf backpatched to S173 
ADI R1 -4 
CMP R1 SL 
BLT R1 End 
CALL S173  backpatched to S173 
PEEK L254 
MOV R1 SP Frame;  rabuf rabuf(['P147', 'P148']) 
ADI R1 -14 
CMP R1 SL 
BLT R1 End 
MOV R0 SP 
MOV R2 FP 
ADI R2 -12 
LDR R1 R2 
STR R1 R0 
ADI SP 4 
MOV R0 SP 
MOV R2 FP 
ADI R2 -12 
LDR R1 R2 
STR R1 R0 
ADI SP 4 
CALL X149 
PEEK L254 ;  get return value 
MOV L254 A253 ;  A253(offset=-173) = L254 
ADD N114 N114 T256 ;  T256 = 5 + 5 
WRITE T256 int ;  cout << T256(int) 
RTN ; return from function main 
S173 FUNC S173 ;  static initializer for classrabuf 
MOV I145 I146 ;  goo(offset=8) = foo 
RTN ; return from static initializer for rabuf 
S158 FUNC S158 ;  static initializer for class_bufar 
RTN ; return from static initializer for _bufar 
H141 .BYT 'Y' 
H140 .BYT 'Z' 
H139 .BYT 'A' 
N114 .INT 5 
N115 .INT 3 
N116 .INT 4 
H117 .BYT 'c' 
N131 .INT 2 
N125 .INT 1 
N150 .INT 10 
N154 .INT null 
N105 .INT 89 
