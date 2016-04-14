#tcode.py
import syntaxer
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
    tcode = frame(code)
  elif code[1] == 'CALL' :
    tcode = call(code)
  elif code[1] == 'STOP' :
    tcode = stop(code)
  elif code[1] == 'FUNC' :
    tcode = func(code)
  elif code[1] == 'PUSH' :
    tcode = push(code)
  elif code[1] == 'REF' :
    tcode = ref(code)
  elif code[1] == 'MOV' :
    tcode = mov(code)
  elif code[1] == 'PEEK' :
    tcode = peek(code)
  elif code[1] == 'RTN' :
    tcode = rtn(code)
  elif code[1] == 'RETURN' :
    tcode = retrn(code)
  elif code[1] == 'ADD' :
    tcode = add(code)
  elif code[1] == 'ADI' :
    tcode = adi(code)
  elif code[1] == 'SUB' :
    tcode = sub(code)
  elif code[1] == 'DIV' :
    tcode = div(code)
  elif code[1] == 'MUL' :
    tcode = mul(code)
  elif code[1] == 'LT' :
    tcode = lt(code)
  elif code[1] == 'GT' :
    tcode = gt(code)
  elif code[1] == 'EQ' :
    tcode = eq(code)
  elif code[1] == 'NE' :
    tcode = ne(code)
  elif code[1] == 'LE' :
    tcode = le(code)
  elif code[1] == 'GE' :
    tcode = ge(code)
  elif code[1] == 'AND' :
    tcode = _and(code)
  elif code[1] == 'OR' :
    tcode = _or(code)
  elif code[1] == 'BF' :
    tcode = bf(code)
  elif code[1] == 'BT' :
    tcode = bt(code)
  elif code[1] == 'JMP' :
    return jmp(code)
  elif code[1] == 'NEWI' :
    tcode = newi(code)
  elif code[1] == 'NEW' :
    tcode = new(code)
  elif code[1] == 'AEF' :
    tcode = aef(code)
  elif code[1] == 'READ' :
    tcode = read(code)
  elif code[1] == 'WRITE' :
    tcode = write(code)
  elif code[1] == '.INT' :
    return [code]
  elif code[1] == '.BYT' :
    if len(code[2]) > 1 :
      c = getspecialchar(code[2])
    else:
      c = ord(code[2])
    return [[code[0], code[1], c]]
  else :
    print 'Couldn\'t find the code:', code
  tcode[0].insert(0, code[0])
  return tcode

def frame(code) :
  if code[3] == 'this' :
    get = [['MOV', 'R2', 'FP'], ['ADI', 'R2', -8]]
    ld = [['LDR', 'R3', 'R2']]
  else:
    ths = symtab.get(code[3])
    get = getvar(ths) # get load instuctions for this pointer
    ld = load(ths)
  return [['MOV', 'R1', 'SP', code[5] + ' Frame ' + code[2]],\
          ['ADI', 'R1', -(getsize(code[2]) + 12)],\
          ['CMP', 'R1', 'SL'],\
          ['BLT', 'R1', 'End', '; if room on the stack for function'],\
          ['MOV', 'R7', 'SP', '; store the current SP in R7 for later assignment as new FP'],\
          ['ADI', 'SP', -4],\
          ['STR', 'FP', 'SP', '; store the previous frame pointer at FP - 4'],\
          ['ADI', 'SP', -4]] + get + ld + \
          [['STR', 'R3', 'SP', '; store the this pointer at FP - 8'], ['ADI', 'SP', -4, ';  end Frame' ]]

def call(code) :
  return [['MOV', 'FP', 'R7', '; call'],\
          ['MOV', 'R0', 'PC'],\
          ['ADI', 'R0', 36],\
          ['STR', 'R0', 'R7'],\
          ['JMP', code[2], '; call']]

def stop(code) :
  return [['TRP', '0']]

def func(code) :
  return [['ADI', 'SP', str(-symtab.get(code[2]).data.size)]]

def push(code) :
  p = symtab.get(code[2])
  offset = p.data.offset
  get = getvar(p) # load(sym) dest='R3', src='R2', temp='R1'
  ld = load(p)
  if p.data.size == 4:
    st = 'STR'
  else :
    st = 'STB'
  comment = '; Push ' + code[2] + ' size: ' + str(code[3]) + ' type: ' + p.data.returntype + ' offset: ' + str(p.data.offset)
  return [['MOV', 'R0', 'SP', comment]] + get + ld +\
          [[st, 'R3', 'R0'],\
          ['ADI', 'SP', -p.data.size]]

def load(sym) : 
  sid = sym.symid
  if sym.data.returntype == 'char' :
    ld = 'LDB'
  else :
    ld = 'LDR'
  if sid[0] == 'R' or sid[0] == 'A':
    return [['LDR', 'R1', 'R2'], [ld, 'R3', 'R1']]
  elif sid[0] == 'N' or sid == 'this' or sid[0] == 'B' :
    return [['LDR', 'R3', sid]]
  elif sid[0] == 'Z' :#or sid[0] == 'A' :
    return [['LDR', 'R3', 'R2']]
  elif sid[0] == 'H' :
    return [['LDB', 'R3', sid]]
  else :
    return [[ld, 'R3', 'R2']]

def store(sym) :
  if sym.data.size == 4 :
    st = 'STR'
  else:
    st = 'STB'
  return [[st, 'R3', 'R2']]

def getvar(sym) :
  sid = sym.symid
  if sid[0] == 'L' or sid[0] == 'P' or sid[0] == 'T' or sid[0] == 'R' or sid[0] == 'A' :
    return [['MOV', 'R2', 'FP'], ['ADI', 'R2', sym.data.offset - 12]]
  elif sid[0] == 'I' :
    return [['MOV', 'R1', 'FP'], ['ADI', 'R1', -8], ['LDR', 'R2', 'R1'], ['ADI', 'R2', str(sym.data.offset)]]
  elif sid[0] == 'Z' :
    return [['MOV', 'R2', 'FP'], ['ADI', 'R2', -8]]
  else :
    return []

def ref(code) : #REF L130 I102 R194 ;  R194 = p.num offset = 1 
  getobj = getvar(symtab.get(code[2]))
  ldobj = load(symtab.get(code[2]))
  offset = str(symtab.get(code[3]).data.offset)
  getdst = getvar(symtab.get(code[4]))
  strdst = store(symtab.get(code[4]))
  getobj[0].append(' ; start REF')
  strdst[-1].append(' ; end REF')
  return getobj + ldobj + [['ADI', 'R3', offset]] + getdst + strdst

def mov(code) :
  src = symtab.get(code[2])
  dst = symtab.get(code[3])
  getsrc = getvar(src)
  getdst = getvar(dst)
  if dst.symid[0] == 'R' or dst.symid[0] == 'A':
    getdst.append(['LDR', 'R2', 'R2'])
  ld = load(src)
  stor = store(src)
  return getsrc + ld + getdst + stor

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

def retrn(code) :
  sym = symtab.get(code[2])
  get = getvar(sym)
  ld = load(sym)
  return [['MOV', 'R0', 'FP', '; rtn'],\
          ['ADI', 'R0', '-4'],\
          ['LDR', 'R7', 'R0', '; get the previous frame pointer'],\
          ['ADI', 'R0', '-4', '; get the return value']] + get + ld + \
          [['LDR', 'R2', 'FP'],\
          ['STR', 'R3', 'FP'],\
          ['MOV', 'SP', 'FP'],\
          ['MOV', 'FP', 'R7'],\
          ['JMR', 'R2', '; rtn']]

def rtn(code) :
  return [['MOV', 'R0', 'FP', '; rtn'],\
          ['ADI', 'R0', '-4'],\
          ['LDR', 'R1', 'R0', '; get the previous frame pointer'],\
          ['ADI', 'R0', '-4'],\
          ['LDR', 'R2', 'R0', '; get the this pointer'],\
          ['LDR', 'R3', 'FP'],\
          ['STR', 'R2', 'FP'],\
          ['MOV', 'SP', 'FP'],\
          ['MOV', 'FP', 'R1'],\
          ['JMR', 'R3', '; rtn']]

def add(code) :
  left = symtab.get(code[2])
  right = symtab.get(code[3])
  dst = symtab.get(code[4])
  getleft = getvar(left)
  getright = getvar(right)
  getdst = getvar(dst)
  ldleft = load(left)
  ldright = load(right)
  stor = store(dst)
  return getleft + ldleft + [['MOV', 'R4', 'R3']] + getright + ldright + [['ADD', 'R3', 'R4']] + getdst + stor

def adi(code) :
  return [code]

def sub(code) :
  left = symtab.get(code[2])
  right = symtab.get(code[3])
  dst = symtab.get(code[4])
  getleft = getvar(left)
  getright = getvar(right)
  getdst = getvar(dst)
  ldleft = load(left)
  ldright = load(right)
  stor = store(dst)
  return getleft + ldleft + [['MOV', 'R4', 'R3']] + getright + ldright + [['SUB', 'R3', 'R4']] + getdst + stor

def div(code) :
  left = symtab.get(code[2])
  right = symtab.get(code[3])
  dst = symtab.get(code[4])
  getleft = getvar(left)
  getright = getvar(right)
  getdst = getvar(dst)
  ldleft = load(left)
  ldright = load(right)
  stor = store(dst)
  return getleft + ldleft + [['MOV', 'R4', 'R3']] + getright + ldright + [['DIV', 'R3', 'R4']] + getdst + stor

def mul(code) :
  left = symtab.get(code[2])
  right = symtab.get(code[3])
  dst = symtab.get(code[4])
  getleft = getvar(left)
  getright = getvar(right)
  getdst = getvar(dst)
  ldleft = load(left)
  ldright = load(right)
  stor = store(dst)
  return getleft + ldleft + [['MOV', 'R4', 'R3']] + getright + ldright + [['MUL', 'R3', 'R4']] + getdst + stor

def lt(code) :
  left = symtab.get(code[2])
  right = symtab.get(code[3])
  dst = symtab.get(code[4])
  getleft = getvar(left)
  getright = getvar(right)
  getdst = getvar(dst)
  ldleft = load(left)
  ldright = load(right)
  stor = store(dst)
  bt = symtab.insert('zbranch', 'zbranch', override=True, data=syntaxer.symtable.data(typ='br', returntype='br', param=[], accessmod='private'))
  bf = symtab.insert('zbranch', 'zbranch', override=True, data=syntaxer.symtable.data(typ='br', returntype='br', param=[], accessmod='private'))
  getdst[0].insert(0, bf)
  return getleft + ldleft + [['MOV', 'R4', 'R3']] + getright + ldright + [['CMP', 'R3', 'R4'], ['BLT', 'R3', bt], ['SUB', 'R3', 'R3'],\
          ['JMP', bf], [bt, 'SUB', 'R3', 'R3'], ['ADI', 'R3', 1]] + getdst + stor

def gt(code) :
  left = symtab.get(code[2])
  right = symtab.get(code[3])
  dst = symtab.get(code[4])
  getleft = getvar(left)
  getright = getvar(right)
  getdst = getvar(dst)
  ldleft = load(left)
  ldright = load(right)
  stor = store(dst)
  bt = symtab.insert('zbranch', 'zbranch', override=True, data=syntaxer.symtable.data(typ='br', returntype='br', param=[], accessmod='private'))
  bf = symtab.insert('zbranch', 'zbranch', override=True, data=syntaxer.symtable.data(typ='br', returntype='br', param=[], accessmod='private'))
  getdst[0].insert(0, bf)
  return getleft + ldleft + [['MOV', 'R4', 'R3']] + getright + ldright + [['CMP', 'R3', 'R4'], ['BGT', 'R3', bt], ['SUB', 'R3', 'R3'],\
          ['JMP', bf], [bt, 'SUB', 'R3', 'R3'], ['ADI', 'R3', 1]] + getdst + stor

def eq(code) :
  left = symtab.get(code[2])
  right = symtab.get(code[3])
  dst = symtab.get(code[4])
  getleft = getvar(left)
  getright = getvar(right)
  getdst = getvar(dst)
  ldleft = load(left)
  ldright = load(right)
  stor = store(dst)
  bt = symtab.insert('zbranch', 'zbranch', override=True, data=syntaxer.symtable.data(typ='br', returntype='br', param=[], accessmod='private'))
  bf = symtab.insert('zbranch', 'zbranch', override=True, data=syntaxer.symtable.data(typ='br', returntype='br', param=[], accessmod='private'))
  getdst[0].insert(0, bf)
  return getleft + ldleft + [['MOV', 'R4', 'R3']] + getright + ldright + [['CMP', 'R3', 'R4'], ['BRZ', 'R3', bt], ['SUB', 'R3', 'R3'],\
          ['JMP', bf], [bt, 'SUB', 'R3', 'R3'], ['ADI', 'R3', 1]] + getdst + stor

def ne(code) :
  left = symtab.get(code[2])
  right = symtab.get(code[3])
  dst = symtab.get(code[4])
  getleft = getvar(left)
  getright = getvar(right)
  getdst = getvar(dst)
  ldleft = load(left)
  ldright = load(right)
  stor = store(dst)
  bt = symtab.insert('zbranch', 'zbranch', override=True, data=syntaxer.symtable.data(typ='br', returntype='br', param=[], accessmod='private'))
  bf = symtab.insert('zbranch', 'zbranch', override=True, data=syntaxer.symtable.data(typ='br', returntype='br', param=[], accessmod='private'))
  getdst[0].insert(0, bf)
  return getleft + ldleft + [['MOV', 'R4', 'R3']] + getright + ldright + [['CMP', 'R3', 'R4'], ['BNZ', 'R3', bt], ['SUB', 'R3', 'R3'],\
          ['JMP', bf], [bt, 'SUB', 'R3', 'R3'], ['ADI', 'R3', 1]] + getdst + stor

def le(code) :
  left = symtab.get(code[2])
  right = symtab.get(code[3])
  dst = symtab.get(code[4])
  getleft = getvar(left)
  getright = getvar(right)
  getdst = getvar(dst)
  ldleft = load(left)
  ldright = load(right)
  stor = store(dst)
  bt = symtab.insert('zbranch', 'zbranch', override=True, data=syntaxer.symtable.data(typ='br', returntype='br', param=[], accessmod='private'))
  bf = symtab.insert('zbranch', 'zbranch', override=True, data=syntaxer.symtable.data(typ='br', returntype='br', param=[], accessmod='private'))
  getdst[0].insert(0, bf)
  return getleft + ldleft + [['MOV', 'R4', 'R3']] + getright + ldright + [['CMP', 'R3', 'R4'], ['BLT', 'R3', bt], ['BRZ', 'R3', bt], \
          ['SUB', 'R3', 'R3'], ['JMP', bf], [bt, 'SUB', 'R3', 'R3'], ['ADI', 'R3', 1]] + getdst + stor

def ge(code) :
  left = symtab.get(code[2])
  right = symtab.get(code[3])
  dst = symtab.get(code[4])
  getleft = getvar(left)
  getright = getvar(right)
  getdst = getvar(dst)
  ldleft = load(left)
  ldright = load(right)
  stor = store(dst)
  bt = symtab.insert('zbranch', 'zbranch', override=True, data=syntaxer.symtable.data(typ='br', returntype='br', param=[], accessmod='private'))
  bf = symtab.insert('zbranch', 'zbranch', override=True, data=syntaxer.symtable.data(typ='br', returntype='br', param=[], accessmod='private'))
  getdst[0].insert(0, bf)
  return getleft + ldleft + [['MOV', 'R4', 'R3']] + getright + ldright + [['CMP', 'R3', 'R4'], ['BGT', 'R3', bt], ['BRZ', 'R3', bt], \
          ['SUB', 'R3', 'R3'], ['JMP', bf], [bt, 'SUB', 'R3', 'R3'], ['ADI', 'R3', 1]] + getdst + stor

def _and(code) :
  left = symtab.get(code[2])
  right = symtab.get(code[3])
  dst = symtab.get(code[4])
  getleft = getvar(left)
  getright = getvar(right)
  getdst = getvar(dst)
  ldleft = load(left)
  ldright = load(right)
  stor = store(dst)
  return getleft + ldleft + [['MOV', 'R4', 'R3']] + getright + ldright + [['AND', 'R3', 'R4']] + getdst + stor

def _or(code) :
  left = symtab.get(code[2])
  right = symtab.get(code[3])
  dst = symtab.get(code[4])
  getleft = getvar(left)
  getright = getvar(right)
  getdst = getvar(dst)
  ldleft = load(left)
  ldright = load(right)
  stor = store(dst)
  return getleft + ldleft + [['MOV', 'R4', 'R3']] + getright + ldright + [['OR', 'R3', 'R4']] + getdst + stor

def bf(code) :
  left = symtab.get(code[2])
  getleft = getvar(left)
  ldleft = load(left)
  return getleft + ldleft + [['BRZ', 'R3', code[3]]]

def bt(code) :
  left = symtab.get(code[2])
  getleft = getvar(left)
  ldleft = load(left)
  return getleft + ldleft + [['BNZ', 'R3', code[3]]]

def jmp(code) :
  return [code]

def newi(code) :
  getdst = getvar(symtab.get(code[3]))
  stdst = store(symtab.get(code[3]))
  return [['MOV', 'R0', 'SL', '; start NEWI'], ['ADI', 'R1', code[2]], ['CMP', 'R0', 'SP'],\
  ['BLT', 'R1', 'End', '; if room on the heap for object']] + getdst + [['MOV', 'R3', 'SL']]\
   + stdst + [['ADI', 'SL', code[2], '; end NEWI']]
  #['MOV', 'R1', 'SP', code[5] + ' Frame ' + code[2]],\
  #        ['ADI', 'R1', -(getsize(code[2]) + 12)],\
  #        ['CMP', 'R1', 'SL'],\
  #        ['BLT', 'R1', 'End', '; if room on the stack for function'],\
  #        ['MOV', 'R7', 'SP', '; store the current SP in R7 for later assignment as new FP'],\
  #        ['ADI', 'SP', -4],\
  #        ['STR', 'FP', 'SP', '; store the previous frame pointer at FP - 4'],\
  #        ['ADI', 'SP', -4]] + get + ld + \
  #        [['STR', 'R3', 'SP', '; store the this pointer at FP - 8'], ['ADI', 'SP', -4, ';  end Frame' ]]

def new(code) : #NEW N103 A181 dsize;  new array of charof size 5 
  getdst = getvar(symtab.get(code[3]))
  stdst = store(symtab.get(code[3]))
  getsz = getvar(symtab.get(code[2]))
  ldsz = load(symtab.get(code[2]))
  offset = [['SUB', 'R4', 'R4'], ['ADI', 'R4', code[4]], ['MUL', 'R4', 'R3']]
  return [['MOV', 'R0', 'SL', '; start NEW']] + getsz + ldsz + offset + [['ADD', 'R1', 'R4'], ['CMP', 'R0', 'SP'],\
  ['BLT', 'R1', 'End', '; if room on the heap for object']] + getdst + [['MOV', 'R3', 'SL']]\
   + stdst + [['ADD', 'SL', 'R4', '; end NEW']]

def aef(code) : #AEF L137 N138 A184 ;  name + 0 * sizeof char (pointer) 
  getarr = getvar(symtab.get(code[2]))
  ldarr = load(symtab.get(code[2]))
  getidx = getvar(symtab.get(code[3]))
  ldidx = load(symtab.get(code[3]))
  offset = [['SUB', 'R4', 'R4'], ['ADI', 'R4', symtab.get(code[4]).data.size], ['MUL', 'R4', 'R3']]
  getdst = getvar(symtab.get(code[4]))
  #offset = str(symtab.get(code[3]).data.offset)
  strdst = store(symtab.get(code[4]))
  ldidx[0].append(' ; start AEF')
  strdst[-1].append(' ; end AEF')
  #return getobj + ldobj + [['ADI', 'R3', offset]] + getdst + strdst
  return getidx + ldidx + offset + getarr + ldarr + [['ADD', 'R3', 'R4']] + getdst + [['STR', 'R3', 'R2']]

def read(code) :
  get = getvar(symtab.get(code[2]))
  st = store(symtab.get(code[2]))
  if code[3] == 'int':
    op = ['TRP', '2', code[5]]
  elif code[3] == 'char' :
    op = ['TRP', '4', code[5]]
  else : 
    print 'Write is not formated correctly'
  if symtab.get(code[2]).symid[0] == 'R' or symtab.get(code[2]).symid[0] == 'A':
    get.append(['LDR', 'R2', 'R2'])
  return get + [op] + st

def write(code) :
  get = getvar(symtab.get(code[2]))
  ld = load(symtab.get(code[2]))
  if code[3] == 'int':
    op = ['TRP', '1', code[5]]
  elif code[3] == 'char' :
    op = ['TRP', '3', code[5]]
  else : 
    print 'Write is not formated correctly'
  #l = load(code[3], ld)
  return get + ld + [op]

def getsize(sid) :
  sym = symtab.get(sid)
  size = sym.data.size
  if len(sym.data.param) > 0 :
    for p in sym.data.param :
      psym = symtab.get(p)
      size += psym.data.size
  return size

def getspecialchar(c) :
  if c[0] != '\\' :
    print c, 'is not a character!'
  else:
    if c[1] == 'n':
      return ord('\n')
    elif c[1] == 't':
      return ord('\t') #nabrtfvx0
    elif c[1] == 'a':
      return ord('\a')
    elif c[1] == 'b':
      return ord('\b')
    elif c[1] == 'r':
      return ord('\r')
    elif c[1] == 'f':
      return ord('\f')
    elif c[1] == 'v':
      return ord('\v')
    elif c[1] == 'x':
      return '0'
    elif c[1] == '0':
      return '0'
    else:
      return '0'
