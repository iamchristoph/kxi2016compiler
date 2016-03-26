from syntaxer import symtable

DEBUG = False
ops = {'(': 0, ')': 0, '[': 0, ']': 0, '=': 1, 'or': 2, 'and': 2, '==': 3, '!=': 3, '<': 4, '<=': 4, '>': 4, '>=': 4, '+': 5, '-': 5, '*': 6, '/': 6}
var = ('lvar', 'ivar', 'rivar','temp', 'alvar', 'aivar')
types = ('int', 'char', 'bool', 'void', 'sym')

class stack :
  def __init__(self) :
    self.stack = []  
    self.length = 0
  def pop(self) :
    if self.length > 0 :
      self.length -= 1
      return self.stack.pop()
    else :
      return None
  def top(self) :
    if self.length > 0 :
      return self.stack[self.length - 1]
    else :
      return None
  def push(self, ob) :
    self.stack.append(ob)
    self.length += 1

SAS = stack()
OPS = stack()
RTN = stack()
LBL = stack()
lblQ = []
statcon = None
statcons = {}
Icode = [['Start', 'FRAME', 'main', 'this', None, ';  Frame main'], \
          [None, 'CALL', 'main', None, None, ''], \
          ['End', 'STOP', None, None, None, '']]

def addscons() :
  for staticinit in statcons.iteritems() :
    sym = symtab.get(staticinit[0])
    backpatch(sym.data.type[2:], sym.symid)
    for instruction in staticinit[1] :
      Icode.append(instruction)
  for sym in symtab.table.iteritems() :
    if sym[0][0] == 'N' :
      Icode.append([sym[0], '.INT', sym[1].value, None, None, None])
    elif sym[0][0] == 'H' :
      Icode.append([sym[0], '.BYT', sym[1].value, None, None, None])
    elif sym[0][0] == 'B' :
      if sym[1].value == 'true' :
        Icode.append([sym[0], '.INT', 1, None, None, None])
      elif sym[1].value == 'false' :
        Icode.append([sym[0], '.INT', 0, None, None, None])
  Icode.append(['this', '.INT', '0', None, None, None])

def Iprint() :
  for quad in Icode :
    for i in quad :
      if i :
        print i,
    print ' '

def opop() :
  op = OPS.pop()
  if op == '=' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#=', l.data.symid, r.data.symid
    if l.data.kind not in var :
      return False, 'Cannot assign to ' + l.data.kind
    elif l.data.data.type != r.data.data.returntype and r.data.data.returntype != 'null':
      if l.data.data.type == 'ref' and l.data.data.returntype == r.data.data.returntype :
        pass
      else:
        return False, 'Cannot assign ' + r.data.data.returntype + ' to ' + l.data.data.type
    res =  pushtemp(l.data.data.returntype, l.data.data.returntype)
    if statcon and len(symtab.scope.split('.')) == 2 :
      statcons[statcon].append([LBL.pop(), 'MOV', r.data.symid, l.data.symid, None, ';  ' + l.value + '(offset=' + str(l.data.data.offset) + ') = ' + r.value]) # r -> l
    else :
      Icode.append([LBL.pop(), 'MOV', r.data.symid, l.data.symid, None, ';  ' + l.value + '(offset=' + str(l.data.data.offset) + ') = ' + r.value]) # r -> l
    return True,
  elif op == '+' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#+', l.data.symid, r.data.symid
    if l.data.data.returntype != 'int' :
      return False, 'Cannot add type ' + l.data.data.returntype + ' and ' + r.data.data.returntype
    elif r.data.data.returntype != 'int' :
      return False, 'Cannot add type ' + r.data.data.returntype + ' and ' + l.data.data.returntype
    else :
      res =  pushtemp(l.data.data.returntype, l.data.data.returntype)
      Icode.append([LBL.pop(), 'ADD', r.data.symid, l.data.symid, res[1],  ';  ' + res[1] + ' = ' + l.value + ' + ' + r.value]) # r + l -> res      
      return res
  elif op == '-' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#-', l.data.symid, r.data.symid
    if l.data.data.returntype != 'int' :
      return False, 'Cannot subtract type ' + l.data.data.returntype + ' and ' + r.data.data.returntype
    elif r.data.data.returntype != 'int' :
      return False, 'Cannot subtract type ' + r.data.data.returntype + ' and ' + l.data.data.returntype
    else :
      res =  pushtemp(l.data.data.returntype, l.data.data.returntype)
      Icode.append([LBL.pop(), 'SUB', r.data.symid, l.data.symid, res[1], ';  ' + res[1] + ' = ' + l.value + ' - ' + r.value]) # r - l -> res      
      return res
  elif op == '*' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#*', l.data.symid, r.data.symid
    if l.data.data.returntype != 'int' :
      return False, 'Cannot multiply type ' + l.data.data.returntype + ' and ' + r.data.data.returntype
    elif r.data.data.returntype != 'int' :
      return False, 'Cannot multiply type ' + r.data.data.returntype + ' and ' + l.data.data.returntype
    else :
      res =  pushtemp(l.data.data.returntype, l.data.data.returntype)
      Icode.append([LBL.pop(), 'MUL', r.data.symid, l.data.symid, res[1], ';  ' + res[1] + ' = ' + l.value + ' * ' + r.value]) # r * l -> res      
      return res
  elif op == '/' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#/', l.data.symid, r.data.symid
    if l.data.data.returntype != 'int' :
      return False, 'Cannot divide type ' + l.data.data.returntype + ' and ' + r.data.data.returntype
    elif r.data.data.returntype != 'int' :
      return False, 'Cannot divide type ' + r.data.data.returntype + ' and ' + l.data.data.returntype
    else :
      res =  pushtemp(l.data.data.returntype, l.data.data.returntype)
      Icode.append([LBL.pop(), 'DIV', r.data.symid, l.data.symid, res[1], ';  ' + res[1] + ' = ' + l.value + ' / ' + r.value]) # r / l -> res      
      return res
  elif op == 'or' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#or', l.data.symid, r.data.symid
    if l.data.data.returntype != 'bool' :
      return False, 'Operator \'or\' cannot compare type ' + l.data.data.returntype + ' and ' + r.data.data.returntype
    elif r.data.data.returntype != 'bool' :
      return False, 'Operator \'or\' cannot compare type ' + r.data.data.returntype + ' and ' + l.data.data.returntype
    else:
      res =  pushtemp('bool', 'bool')
      Icode.append([LBL.pop(), 'OR', r.data.symid, l.data.symid, res[1], ';  ' + res[1] + ' = ' + l.value + ' or ' + r.value]) # r or l -> res      
      return res
  elif op == 'and' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#and', l.data.symid, r.data.symid
    if l.data.data.returntype != 'bool' :
      return False, 'Operator \'and\' cannot compare type ' + l.data.data.returntype + ' and ' + r.data.data.returntype
    elif r.data.data.returntype != 'bool' :
      return False, 'Operator \'and\' cannot compare type ' + r.data.data.returntype + ' and ' + l.data.data.returntype
    else:
      res =  pushtemp('bool', 'bool')
      Icode.append([LBL.pop(), 'AND', r.data.symid, l.data.symid, res[1], ';  ' + res[1] + ' = ' + l.value + ' and ' + r.value]) # r and l -> res      
      return res
  elif op == '==' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#==', l.data.symid, r.data.symid
    if l.data.data.returntype not in types :
      return False, 'Operator \'==\' cannot compare type ' + l.data.data.returntype + ' and ' + r.data.data.returntype
    elif r.data.data.returntype != l.data.data.returntype :
      return False, 'Operator \'==\' cannot compare type ' + r.data.data.returntype + ' and ' + l.data.data.returntype
    else:
      res =  pushtemp('bool', 'bool')
      Icode.append([LBL.pop(), 'EQ', r.data.symid, l.data.symid, res[1], ';  ' + res[1] + ' = ' + l.value + ' == ' + r.value]) # r == l -> res      
      return res
  elif op == '!=' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#!=', l.data.symid, r.data.symid
    if l.data.data.returntype not in types :
      return False, 'Operator \'!=\' cannot compare type ' + l.data.data.returntype + ' and ' + r.data.data.returntype
    elif r.data.data.returntype != l.data.data.returntype :
      return False, 'Operator \'!=\' cannot compare type ' + r.data.data.returntype + ' and ' + l.data.data.returntype
    else:
      res =  pushtemp('bool', 'bool')
      Icode.append([LBL.pop(), 'NE', r.data.symid, l.data.symid, res[1], ';  ' + res[1] + ' = ' + l.value + ' != ' + r.value]) # r != l -> res      
      return res
  elif op == '<' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#<', l.data.symid, r.data.symid
    if l.data.data.returntype != 'int' :
      return False, 'Operator \'<\' cannot compare type ' + l.data.data.returntype + ' and ' + r.data.data.returntype
    elif r.data.data.returntype != l.data.data.returntype :
      return False, 'Operator \'<\' cannot compare type ' + r.data.data.returntype + ' and ' + l.data.data.returntype
    else:
      res =  pushtemp('bool', 'bool')
      Icode.append([LBL.pop(), 'LT', r.data.symid, l.data.symid, res[1], ';  ' + res[1] + ' = ' + l.value + ' < ' + r.value]) # l < r -> res      
      return res
  elif op == '<=' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#<=', l.data.symid, r.data.symid
    if l.data.data.returntype != 'int' :
      return False, 'Operator \'<=\' cannot compare type ' + l.data.data.returntype + ' and ' + r.data.data.returntype
    elif r.data.data.returntype != l.data.data.returntype :
      return False, 'Operator \'<=\' cannot compare type ' + r.data.data.returntype + ' and ' + l.data.data.returntype
    else:
      res =  pushtemp('bool', 'bool')
      Icode.append([LBL.pop(), 'LE', r.data.symid, l.data.symid, res[1], ';  ' + res[1] + ' = ' + l.value + ' <= ' + r.value]) # l <= r -> res      
      return res
  elif op == '>' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#>', l.data.symid, r.data.symid
    if l.data.data.returntype != 'int' :
      return False, 'Operator \'>\' cannot compare type ' + l.data.data.returntype + ' and ' + r.data.data.returntype
    elif r.data.data.returntype != l.data.data.returntype :
      return False, 'Operator \'>\' cannot compare type ' + r.data.data.returntype + ' and ' + l.data.datareturn.type
    else:
      res =  pushtemp('bool', 'bool')
      Icode.append([LBL.pop(), 'GT', r.data.symid, l.data.symid, res[1], ';  ' + res[1] + ' = ' + l.value + ' > ' + r.value]) # l > r -> res      
      return res
  elif op == '>=' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#>=', l.data.symid, r.data.symid
    if l.data.data.returntype != 'int' :
      return False, 'Operator \'>=\' cannot compare type ' + l.data.data.returntype + ' and ' + r.data.data.returntype
    elif r.data.data.returntype != l.data.data.returntype :
      return False, 'Operator \'>=\' cannot compare type ' + r.data.data.returntype + ' and ' + l.data.data.returntype
    else:
      res =  pushtemp('bool', 'bool')
      Icode.append([LBL.pop(), 'GE', r.data.symid, l.data.symid, res[1], ';  ' + res[1] + ' = ' + l.value + ' >= ' + r.value]) # l >= r -> res      
      return res
  else :
    if DEBUG :
      print 'OP ', op
    return False, 'The op ' + op + ' is invalid' 


class SAR :
  def __init__(self, t, data) :
    self.SAStype = t
    if t == 'ipush' :
      self.value = data.lexeme
    elif t == '#AL' :
      self.value = 'arglist'
    elif t == 'func' :
      self.value = data[0].value
    elif t == 'arr' :
      self.value = data[0].value
    else :
      self.value = data.value
    self.data = data
    #self.symid
  def __repr__(self) :
    return 'SAR <type: ' + self.SAStype + ', value: ' + self.value + ', data: ' + str(self.data)

def pushtemp(typ, rtyp, kind='temp', par=None, val=None) :
  temp = symtab.insert(val, kind, override=True, data=symtable.data(typ=typ, returntype=rtyp, param=par, accessmod='private'))
  sym = symtab.get(temp)
  SAS.push(SAR('#TPUSH', sym))
  slist = sym.scope.split('.')
  owner = symtab.idsymfromlexscope(slist[-1], '.'.join(slist[0:-1]))
  if sym.data.type == 'char' :
    sym.data.size = 1
  else:
    sym.data.size = 4
  if statcon and owner[1].scope == 'g':
    owner = symtab.get(statcon)
    sym.data.offset = -owner.data.size
    owner.data.size += sym.data.size
    #statcons[statcon].append([LBL.pop(), 'PUSH', sym.symid, sym.data.size, None, ';  ' + owner.value + '.' + sym.value + ', offset = ' + str(sym.data.offset)]) 
  else :
    sym.data.offset = -(owner[1].data.size + owner[1].data.psize)
    owner[1].data.size += sym.data.size
    #Icode.append([LBL.pop(), 'PUSH', sym.symid, sym.data.size, None, ';  ' + owner[1].value + '.' + sym.value + ', offset = ' + str(sym.data.offset)]) 
  if DEBUG :
    print '#TPUSH', SAS.top().data.symid
  return True, temp

def ipush(token) :
  SAS.push(SAR('ipush', token))
  if DEBUG :
    print '#IPUSH', SAS.top().value

def vpush(var) :
  sym = symtab.get(var)
  SAS.push(SAR('vexist', sym))
  slist = sym.scope.split('.')
  owner = symtab.idsymfromlexscope(slist[-1], '.'.join(slist[0:-1]))
  if sym.kind == 'lvar' :
    if sym.data.type == 'char' :
      sym.data.size = 1
    else:
      sym.data.size = 4
    sym.data.offset = -(owner[1].data.size + owner[1].data.psize)
    owner[1].data.size +=sym.data.size
    #Icode.append([LBL.pop(), 'PUSH', sym.symid, sym.data.size, None, ';  ' + owner[1].value + '.' + sym.value + ', offset = ' + str(sym.data.offset)]) 
  if DEBUG :
    print '#VEXIST', SAS.top().data.symid

def iexist(stable=None) :
  i = SAS.pop()
  scope = symtab.scope
  if i.value == 'this' :
    slist = scope.split('.')
    clas = symtab.idsymfromlexscope(slist[1], 'g') 
    if clas :
      return pushtemp(clas[1].value, clas[1].value, 'this')
  while True :
    idsym = symtab.idsymfromlexscope(i.value, scope)
    if idsym :
      xid, symbol = idsym
      break
    elif scope == 'g' :
      return False, 'The variable ' + i.value + ' DNE'
    else :
      scope = widen(scope)
  if i.SAStype == 'func' :
    success = matchfunc(i, symbol)
    if not success[0] :
      return success
    res = pushtemp(symbol.data.type, symbol.data.returntype, 'return', i.data[1], symbol.value + 'rtn')
    rsym = symtab.get(res[1])
    Icode.append([LBL.pop(), 'FRAME', symbol.symid, 'this', None, ';  ' + symbol.value + '(' + str(symbol.data.param) + ')']) 
    print rsym, rsym.data.param
    for p in rsym.data.param.data :
      sym = symtab.get(p.symid)
      Icode.append([LBL.pop(), 'PUSH', sym.symid, sym.data.size, None, ';  ' + sym.value + ', offset = ' + str(sym.data.offset)]) 
    Icode.append([LBL.pop(), 'CALL', symbol.symid, None, None, None])
    if symbol.data.returntype and symbol.data.returntype != 'void' :
      Icode.append([LBL.pop(), 'PEEK', rsym.symid, None, None, ';  get return value'])
  elif i.SAStype == 'arr' :
    typ = symbol.data.type[2:]
    aef = pushtemp(typ, typ, 'a'+ symbol.kind, i.data[1])
    asym = symtab.get(aef[1])
    offset = i.data[1].data.symid
    osym = symtab.get(offset)
    Icode.append([LBL.pop(), 'AEF', symbol.symid, osym.symid, asym.symid, ';  ' + symbol.value + ' + ' + osym.value + ' * sizeof ' + asym.data.returntype + ' (pointer)'])
  else :
    SAS.push(SAR('iexist', symbol))
  if DEBUG :
    print '#IEXIST', SAS.top().data.symid
  return True,

def rexist() :
  done = False
  member = SAS.pop()
  objec = SAS.pop()
  clasname = objec.data.data.returntype
  clasidsym = symtab.idsymfromlexscope(clasname, 'g')
  if clasidsym :
    cid, clas = clasidsym
  else :
    return False, 'Class ' + clasname + ' not found'
  scope = clas.scope + '.' + clasname
  idsym = symtab.idsymfromlexscope(member.value, scope)
  if idsym :
    xid, symbol = idsym
    if symbol.kind == 'method' or symbol.kind == 'xtor' :
      success = matchfunc(member, symbol)
      if not success[0] :
        return success
      typ, rtyp = symbol.data.type, symbol.data.returntype
    elif member.SAStype == 'arr' :
      typ, rtyp = symbol.data.type[2:], symbol.data.returntype[2:]
      typ = symbol.data.type[2:]
    else:
      typ, rtyp = symbol.data.type, symbol.data.returntype
    if symbol.data.accessmod == 'public' or objec.data.kind == 'this' :
      if objec.data.kind == 'this' :
        #print typ, rtyp, 'r'+ symbol.kind, 'this'
        ref = pushtemp('ref', rtyp, 'r'+symbol.kind, 'this')
      elif symbol.kind == 'xtor' :
        ref = pushtemp(typ, rtyp, 'return', member.data[1], symbol.value + 'rtn')
        Icode.append([LBL.pop(), 'NEWI', clas.data.size, ref[1], None, ';  new instance of ' + clas.value + ' -> ' + ref[1]])
      elif symbol.kind == 'method' :
        ref = pushtemp(typ, rtyp, 'return', member.data[1], symbol.value + 'rtn')
      else :
        #print typ, rtyp, 'r'+ symbol.kind, member.data[1]
        ref = pushtemp('ref', rtyp, 'r'+symbol.kind, member.data[1])
      if symbol.kind =='method' or symbol.kind == 'xtor' :
        rsym = symtab.get(ref[1])
        rsym.kind = 'return'
        param =  [sym.symid for sym in rsym.data.param.data]
        if symbol.kind == 'method' :
          Icode.append([LBL.pop(), 'FRAME', symbol.symid, objec.data.symid, param, ';  ' + symbol.data.returntype  + ' ' + symbol.value + '(' + str(symbol.data.param) + ')']) 
        elif symbol.kind == 'xtor' :
          Icode.append([LBL.pop(), 'FRAME', clasname, rsym.symid, None, ';  static initializer for class ' + clasname])
          Icode.append([LBL.pop(), 'CALL', clasname, None, None, ''])
          Icode.append([LBL.pop(), 'PEEK', rsym.symid, None, None, ''])
          Icode.append([LBL.pop(), 'FRAME', symbol.symid, rsym.symid, param, ';  ' + symbol.data.returntype  + ' ' + symbol.value + '(' + str(symbol.data.param) + ')'])   
        else :
          return False, 'How the hell did you ever get to this line! (rexist)'
        for p in param :
          sym = symtab.get(p)
          Icode.append([LBL.pop(), 'PUSH', sym.symid, sym.data.size, None, ';  ' + sym.value + ', offset = ' + str(sym.data.offset)]) 
        Icode.append([LBL.pop(), 'CALL', symbol.symid, None, None, None])
        if symbol.data.returntype and symbol.data.returntype != 'void' :
          Icode.append([LBL.pop(), 'PEEK', rsym.symid, None, None, ';  get return value'])
        done = True
      elif member.SAStype == 'arr' :
        Icode.append([LBL.pop(), 'REF', objec.data.symid, symbol.symid, ref[1], ';  ' + ref[1] + ' = ' + objec.value + '.' + symbol.value + ' offset = ' + str(symbol.data.offset)]) # l.r -> ref      
        done = True
        aef = pushtemp(typ, typ, 'a'+ symbol.kind, member.data[1])
        asym = symtab.get(aef[1])
        offset = member.data[1].data.symid
        osym = symtab.get(offset)
        Icode.append([LBL.pop(), 'AEF', ref[1], osym.symid, asym.symid, ';  ' + symbol.value + ' + ' + osym.value + ' * sizeof ' + asym.data.returntype + ' (pointer)'])
    else :
      return False, 'The reference ' + member.value + ' DNE as a public member'
  else :
    return False, 'The reference ' + member.value + ' DNE'
  if DEBUG :
    print '#REXIST', SAS.top().data.symid
  if not done :
    Icode.append([LBL.pop(), 'REF', objec.data.symid, symbol.symid, ref[1], ';  ' + ref[1] + ' = ' + objec.value + '.' + symbol.value + ' offset = ' + str(symbol.data.offset)]) # l.r -> ref      
  return ref 

def opush(op) :
  val = ops.get(op)
  if val == 0 :
    OPS.push(op)
  else :
    while OPS.length > 0 and val < ops[OPS.top()] :
      success =  opop()
      if not success[0] :
        return success
    OPS.push(op)
  if DEBUG :
    print '#OPUSH', op
  return True,

def eoe(rtn=False) :
  if DEBUG :
    print '#EOE'
  while OPS.length > 0 :
    success = opop()
    if not success[0] :
      return success
  if not rtn :    
    while SAS.length > 0 :
      SAS.pop().value
  return True,

def widen(scope) :
  s = scope.split('.')
  if s == ['g'] :
    return 'g'
  return '.'.join(s[0:-1])

def lpush(sym) :
  if DEBUG :
    print '#LPUSH', sym.symid
  SAS.push(SAR('#LPUSH', sym))

def bal() : 
  if DEBUG :
    print '#BAL', SAS.top().value
  SAS.push(SAR('#BAL', SAS.top()))

def eal() : 
  arg()
  if DEBUG :
    print '#)'
  op = OPS.pop()
  if op != '(' :
    return False, 'Expected to pop \'(\' got', op
  arglist = []
  while SAS.top().SAStype != '#BAL' :
    arglist.append(SAS.pop().data)
  SAS.pop()
  SAS.push(SAR('#AL', arglist))
  return True,

def rparen() :
  if DEBUG :
    print '#)'
  op = OPS.top()
  while op != '(' :
    success = opop()
    op = OPS.top()
    if not success[0] :
      return success
  op = OPS.pop()
  if op != '(' :
    return False, 'Expected \'(\' got ' + op
  else :
    return True,

def rbrac() :
  if DEBUG :
    print '#]'
  op = OPS.top()
  while op != '[' :
    success = opop()
    op = OPS.top()
    if not success[0] :
      return success
  op = OPS.pop()
  if op != '[' :
    return False, 'Expected \'(\' got ' + op
  else :
    return True,

def arr() :
  index = SAS.pop()
  #print 'args ', args.value
  arr = SAS.pop()
  #print 'funcname ', fname.value, args.data
  if DEBUG :
    print '#ARR', arr.value, index.value
  SAS.push(SAR('arr', [arr, index]))
  return True,
  

def arg() :
  if DEBUG :
    print '#,'
  while OPS.top() != '(' :
    success = opop()
    if not success[0] :
      return success
  return True,

def func() :
  args = SAS.pop()
  fname = SAS.pop()
  SAS.push(SAR('func', [fname, args]))
  return True,

def matchfunc(funcsar, symbol) :
  #print funcsar.data[0].data, funcsar.data[1].data, symbol.data.param
  funcsar.data[1].data.reverse()
  if symbol.kind == 'class' :
    return False, 'Class is not callable, use new keyword for constructor'
  if funcsar.data[0].value != symbol.value :
    return False, 'The function ' + funcsar.data[0].value + ' does not match ' + symbol.value
  if len(funcsar.data[1].data) != len(symbol.data.param) :
    #print funcsar.data, symbol.data.param
    return False, 'The function ' + symbol.value + ' requires exactly ' + str(len(symbol.data.param)) + ' arguments'
  for i in range(len(symbol.data.param)) : #params must be same type and order
    #p, q in funcsar.data[1].data, symbol.data.param
    if funcsar.data[1].data[i].data.returntype != symtab.get(symbol.data.param[i]).data.type :
      return False, 'The function ' + symbol.value + ' should take a ' + symtab.get(symbol.data.param[i]).data.type + ' got ' + funcsar.data[1].data[i].data.returntype
  return True,  symbol  

def funcp(symbol) :
  for i in range(len(symbol.data.param)) :
    p = symbol.data.param[i]
    psym = symtab.get(p)
    if psym.data.type == 'char' :
      psym.data.size = 1
    else:
      psym.data.size = 4
    psym.data.offset = -symbol.data.psize
    symbol.data.psize += psym.data.size

def cdec(t) :
  scope = symtab.scope
  slist = scope.split('.')
  if t.lexeme != slist[-1] :
    return False, 'Cannot declare constructor for class ' + t.lexeme + ' in class ' + slist[-1]
  else :
    return True,
  

def checkif() :
  exp = SAS.pop()
  if exp.data.data.returntype != 'bool' :
    return False, 'Expression in \'if(\' must be of type bool'
  else:
    return True, exp.data.symid

def checkwhile() :
  exp = SAS.pop()
  if exp.data.data.returntype != 'bool' :
    return False, 'Expression in \'while(\' must be of type bool'
  else:
    return True, exp.data.symid

def iopush(op) :
  if op == '<<' or op == '>>' :
    RTN.push((op, ('int', 'char')))

def rtnpush(typ, m) :
  RTN.push((m, (typ, False)))

def io() :
  op = RTN.pop()
  val = SAS.pop()
  if not(op[0] == '<<' or op[0] == '>>') :
    return False, 'IO statement expected, got ' + op[0]
  elif val.data.data.returntype not in op[1] :
    return False, 'IO statement must have operand of types \'int\' or \'char\' got ' + val.data.data.returntype
  else :
    if DEBUG :
      print '#' + op[0] + ' ' + val.data.data.returntype
    if op[0] == '<<' :
      Icode.append([LBL.pop(), 'WRITE', val.data.symid, val.data.data.returntype, None, ';  cout << ' + val.value + '(' + val.data.data.returntype + ')'] )
    elif op[0] == '>>' :
      Icode.append([LBL.pop(), 'READ', val.data.symid, val.data.data.returntype, None, ';  cin >> ' + val.value + '(' + val.data.data.returntype + ')' ])
    return True,

def rtn(default=False) :
  val = SAS.pop()
  rval = RTN.pop()
  #print val, rval
  if default :
    if rval[0] == 'xtor' :
      Icode.append([LBL.pop(), 'RETURN', 'this', None, None, '; return from function ' + rval[0]])
      return True,
    elif rval[1][0] == 'void' or rval[1][1] :
      Icode.append([LBL.pop(), 'RTN', None, None, None, '; return from function ' + rval[0]])
      return True,
    else :
      return False, 'The function must return type ' + rval[1][0] + ' got void'
  if not (rval[0] != 'func' or rval[0] != 'xtor') :
    return False, 'Return statement expected, got ' + rval[0]
  elif val == None :
    if rval[1][0] == 'void' :
      Icode.append([LBL.pop(), 'RTN', None, None, None, '; return from function ' + rval[0]])
      return True,
    else :
      return False, 'The function must return type ' + rval[1][0] + ' got void'
  elif val.data.data.returntype not in rval[1] :
    return False, 'The function must return type ' + rval[1][0] + ' got ' + val.data.data.returntype
  else :
    if not default :
      RTN.push(('func', (val.data.data.returntype, True)))
    if DEBUG :
      print '#return ' + rval[1][0]
    Icode.append([LBL.pop(), 'RETURN', val.data.symid, None, None, '; return ' + val.data.data.returntype + ' ' + val.data.value + ' from function ' + rval[0]])
    return True,

def atoi() :
  a = SAS.pop()
  if a.data.data.returntype != 'char' :
    return False, 'Cannot convert type \'' + a.data.data.returntype + '\' to type \'int\''
  else :
    pushtemp('int', 'int', par=a.data)
    return True,

def itoa() :
  a = SAS.pop()
  if a.data.data.returntype != 'int' :
    return False, 'Cannot convert type \'' + a.data.data.returntype + '\' to type \'char\''
  else :
    pushtemp('char', 'char', par=a.data)
    return True,

def newobj() :
  args = SAS.pop()
  fname = SAS.pop()
  SAS.push(SAS.top())
  if DEBUG :
    print 'newobj ', fname.value, args.data
  SAS.push(SAR('func', [fname, args]))
  success = rexist()
  if not success[0] :
    return success
  else:
    return True, 

def newarr() :
  index = SAS.pop()
  typ = SAS.pop()
  if index.data.data.returntype != 'int' :
    return False, 'Array index must be of type int, got ' + index.data.data.returntype
  elif typ.value == 'void' :
    return False, 'Cannot create array of type void'
  else :
    arr = pushtemp('@:' + typ.value, '@:'+typ.value, 'arr', index)
    if typ.value == 'char' :
      dsize = 1
    else :
      dsize = 4
    size = pushtemp('int', 'int', 'siza', [index.data.symid, dsize])
    SAS.pop()
    Icode.append([LBL.pop(), 'MUL', index.data.symid, dsize, size[1], ';  '+ index.data.value + ' * ' + str(dsize) + ' -> ' + size[1]])
    Icode.append([LBL.pop(), 'NEW', size[1], arr[1], None, ';  new array of ' + typ.value + 'of size ' + size[1]])
    return True, 

def iif(symid) :
  sym = symtab.get(symid)
  lbl = symtab.getid('skipif', True)
  Icode.append([LBL.pop(), 'BF', symid, lbl, None, ';  BranchFalse ' + symid + ' (' + sym.data.returntype + ') ' + lbl ])
  lblQ.insert(0, lbl)
  if DEBUG :
    print 'iif', lblQ, lbl

def iskip(next) :
  if next == 'else' :
    lbl = symtab.getid('skipelse', True)
    Icode.append([LBL.pop(), 'JMP', lbl, None, None, ';  Jump ' + lbl ])
    lblQ.insert(1, lbl)
  if LBL.top() and len(lblQ) > 0 :
    #print 'iskip LBL top', LBL.top(), 'lblQ', lblQ
    backpatch(LBL.pop(), lblQ[0])
  #print 'iskip', lblQ
  LBL.push(lblQ.pop(0))
  if DEBUG :
    print lblQ

def ielse() :
  if LBL.top() and len(lblQ) > 0 :
    #print 'ielse LBL top', LBL.top(), 'lblQ', lblQ
    backpatch(LBL.pop(), lblQ[0])
  LBL.push(lblQ.pop(0))
  if DEBUG :
    print lblQ

def ibegin() :
  lbl = symtab.getid('begin', True)
  lblQ.insert(0, lbl)
  if LBL.top() and len(lblQ) > 0 :
    #print 'ibegin LBL top', LBL.top(), 'lblQ', lblQ
    backpatch(LBL.pop(), lblQ[0])
  #print 'ibegin', lblQ
  LBL.push(lbl)
  if DEBUG :
    print lblQ

def iwhile(symid) :
  sym = symtab.get(symid)
  lbl = symtab.getid('endwhile', True)
  Icode.append([LBL.pop(), 'BF', symid, lbl, None, ';  BranchFalse ' + symid + ' (' + sym.data.returntype + ') ' + lbl ])
  lblQ.insert(1, lbl)
  if DEBUG :
    print 'iwhile', lblQ, lbl

def iend() :
  lbl = lblQ.pop(0)
  Icode.append([LBL.pop(), 'JMP', lbl, None, None, ';  Jump ' + lbl ])
  if LBL.top() and len(lblQ) > 0 :
    #print 'iend LBL top', LBL.top(), 'lblQ', lblQ
    backpatch(LBL.pop(), lblQ[0])
  #print 'iend', lblQ
  LBL.push(lblQ.pop(0))
  if DEBUG :
    print lblQ

def backpatch(old, new) :
  if DEBUG :
    print 'Backpatching: replacing ' + old + ' with ' + new
  for quad in Icode :
    for item in quad :
      if item == old :
        #print quad, item, old, new
        quad[quad.index(item)] = new
        quad[5] += ' backpatched to ' + new
        #print quad
