#tcode.py

#Regs = {0: pack('4x'), 1: pack('4x'), 2: pack('4x'), 3: pack('4x'), 4: pack('4x'), 5: pack('4x'), 6: pack('4x'), 7: pack('4x'), PC: pack('4x'), SL: pack('4x'), SP: pack('4x'), FP: pack('4x'), SB: pack('4x')}
#    this.mem = memory
#    this.offset = len(this.Regs)*4
#    this.stackbase =  len(memory) - OFFSET - this.offset
#    this.Regs[SB] = pack('i', this.stackbase)
#    this.Regs[SP] = pack('i', this.stackbase - 4)
#    this.Regs[FP] = this.Regs[SP]
#    this.Regs[PC], stacklimit = pack('i', keys[0]), keys[1]
#    this.stacksize = (this.stackbase-stacklimit)/THREADS
#    this.Regs[SL] = pack('i', (this.stackbase - this.stacksize - this.offset))

def get(code) :
  if code[1] == 'FRAME' :
    return frame(code)
  elif code[1] == 'CALL' :
    return call(code)
  elif code[1] == 'STOP' :
    return stop(code)
  elif code[1] == 'FUNC' :
    return func(code)
  elif code[1] == 'PUSH' :
    return push(code)
  elif code[1] == 'REF' :
    return ref(code)
  elif code[1] == 'MOV' :
    return mov(code)
  elif code[1] == 'PEEK' :
    return peek(code)
  elif code[1] == 'RTN' :
    return rtn(code)
  elif code[1] == 'RETURN' :
    return rtn(code)
  elif code[1] == 'ADD' :
    return add(code)
  elif code[1] == 'ADI' :
    return adi(code)
  elif code[1] == 'SUB' :
    return sub(code)
  elif code[1] == 'DIV' :
    return div(code)
  elif code[1] == 'MUL' :
    return mul(code)
  elif code[1] == 'LT' :
    return lt(code)
  elif code[1] == 'GT' :
    return gt(code)
  elif code[1] == 'EQ' :
    return eq(code)
  elif code[1] == 'NE' :
    return ne(code)
  elif code[1] == 'LE' :
    return le(code)
  elif code[1] == 'GE' :
    return ge(code)
  elif code[1] == 'AND' :
    return _and(code)
  elif code[1] == 'OR' :
    return _or(code)
  elif code[1] == 'BF' :
    return bf(code)
  elif code[1] == 'BT' :
    return bt(code)
  elif code[1] == 'JMP' :
    return jmp(code)
  elif code[1] == 'NEWI' :
    return newi(code)
  elif code[1] == 'NEW' :
    return new(code)
  elif code[1] == 'AEF' :
    return aef(code)
  elif code[1] == 'READ' :
    return read(code)
  elif code[1] == 'WRITE' :
    return write(code)
  elif code[1] == '.INT' :
    return [code]
  elif code[1] == '.BYT' :
    return [code]
  else :
    print 'Couldn\'t find the code:', code

def frame(code) :
  ths = code[3]
  ld = load(ths[0], 'LDR') # get load instuctions for this pointer
  return [[code[0], 'MOV', 'R1', 'SP', code[5] + ' Frame ' + code[2]],\
          ['ADI', 'R1', -(getsize(code[2]) + 12)],\
          ['CMP', 'R1', 'SL'],\
          ['BLT', 'R1', 'End', '; if room on the stack for function'],\
          ['MOV', 'R7', 'SP', '; store the current SP in R7 for later assignment as new FP'],\
          ['ADI', 'SP', -4],\
          ['STR', 'FP', 'SP', '; store the previous frame pointer at FP - 4'],\
          ['ADI', 'SP', -4],
          ['LDR', 'R2', ths]] +  ld + \
          [['STR', 'R3', 'SP', '; store the this pointer at FP - 8']]

def call(code) :
  return [['MOV', 'FP', 'R7'],\
          ['MOV', 'R0', 'PC'],\
          ['ADI', 'R0', 36],\
          ['STR', 'R0', 'R7'],\
          ['JMP', code[2]]]

def stop(code) :
  return [[code[0], 'TRP', '0']]

def func(code) :
  return [[code[0], 'ADI', 'SP', str(symtab.get(code[2]).data.size)]]

def push(code) :
  p = symtab.get(code[2])
  size = p.data.size
  if size == 4 :
    ld = 'LDR'
    st = 'STR'
  elif size == 1 :
    ld = 'LDB'
    st = 'STB'
  else:
    print 'Expected data to load should be loadable as int or char, got ', p
  offset = p.data.offset - 12
  l = load(p.symid[0], ld) # load(char, load, dest='R3', src='R2', temp='R1')
  comment = '; Push ' + code[2] + ' size: ' + str(code[3]) + ' type: ' + p.data.returntype + ' offset: ' + str(p.data.offset)
  return [['MOV', 'R0', 'SP', comment],\
          ['MOV', 'R2', 'FP'],\
          ['ADI', 'R2', offset],\
          l,\
          [st, 'R3', 'R0'],\
          ['ADI', 'SP', size]]

def load(char, ld, dest='R3', src='R2', temp='R1') : 
  if char == 'R' or char == 'A' :
    return [['LDR', temp, src], [ld, dest, temp]]
  else :
    return [[ld, dest, src]]

def getvar(sym) :
  sid = sym.symid
  if sid[0] == 'N' :
    return [['LDR', 'R3', sid]]
  elif sid[0] == 'H' :
    return [['LDB', 'R3', sid]]
  elif sid[0] == 'L' :
    if sym.data.size == 4 :
      ld = 'LDR'
    else :
      ld = 'LDB'
    return [['MOV', 'R2', 'FP'], ['ADI', 'R2', sym.data.offset - 12]]+load(sid[0], ld)

def ref(code) :
  return [code]

def mov(code) :
  return [code]

def peek(code) : #PEEK L164 ;  get return value 
  p = symtab.get(code[2])
  size = p.data.size
  if size == 4 :
    load = 'LDR'
    store = 'STR'
  elif size == 1 :
    load = 'LDB'
    store = 'STB'
  else:
    print 'Expected data to load should be loadable as int or char, got ', p
  offset = p.data.offset - 12
  return [['MOV', 'R0', 'SP', code[5]], [load, 'R1', 'R0'], ['MOV', 'R2', 'FP'], ['ADI', 'R2', offset], [store, 'R1', 'R2']]

def rtn(code) :
  return [['LDR', 'R0', 'FP'],['JMR', 'R0']]

def add(code) :
  return [code]

def adi(code) :
  return [code]

def sub(code) :
  return [code]

def div(code) :
  return [code]

def mul(code) :
  return [code]

def lt(code) :
  return [code]

def gt(code) :
  return [code]

def eq(code) :
  return [code]

def ne(code) :
  return [code]

def le(code) :
  return [code]

def ge(code) :
  return [code]

def _and(code) :
  return [code]

def _or(code) :
  return [code]

def bf(code) :
  return [code]

def bt(code) :
  return [code]

def jmp(code) :
  return [code]

def newi(code) :
  return [code]

def new(code) :
  return [code]

def aef(code) :
  return [code]

def read(code) :
  return [code]

def write(code) :
  get = getvar(symtab.get(code[2]))
  if code[3] == 'int':
    op = ['TRP', '1', code[5]]
    ld = 'LDR'
  elif code[3] == 'char' :
    op = ['TRP', '3', code[5]]
    ld = 'LDB'
  else : 
    print 'Write is not formated correctly'
  #l = load(code[3], ld)
  return get + [op]

def getsize(sid) :
  sym = symtab.get(sid)
  size = sym.data.size
  if len(sym.data.param) > 0 :
    for p in sym.data.param :
      psym = symtab.get(p)
      size += psym.data.size
  return size