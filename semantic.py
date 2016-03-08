from syntaxer import symtable

DEBUG = False
ops = {'(': 0, ')': 0, '[': 0, ']': 0, '=': 1, 'or': 2, 'and': 2, '==': 3, '!=': 3, '<': 4, '<=': 4, '>': 4, '>=': 4, '+': 5, '-': 5, '*': 6, '/': 6}
var = ('lvar', 'ivar', 'rlvar', 'rivar')
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
#symtab 

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
      return False, 'Cannot assign ' + r.data.data.returntype + ' to ' + l.data.data.type
    else :
      return True,
  elif op == '+' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#+', l.data.symid, r.data.symid
    if l.data.data.type != 'int' :
      return False, 'Cannot add type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != 'int' :
      return False, 'Cannot add type ' + r.data.data.type + ' and ' + l.data.data.type
    else :
      return pushtemp(l.data.data.type, l.data.data.type),
  elif op == '-' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#-', l.data.symid, r.data.symid
    if l.data.data.type != 'int' :
      return False, 'Cannot subtract type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != 'int' :
      return False, 'Cannot subtract type ' + r.data.data.type + ' and ' + l.data.data.type
    else :
      return pushtemp(l.data.data.type, l.data.data.type),
  elif op == '*' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#*', l.data.symid, r.data.symid
    if l.data.data.type != 'int' :
      return False, 'Cannot multiply type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != 'int' :
      return False, 'Cannot multiply type ' + r.data.data.type + ' and ' + l.data.data.type
    else :
      return pushtemp(l.data.data.type, l.data.data.type),
  elif op == '/' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#/', l.data.symid, r.data.symid
    if l.data.data.type != 'int' :
      return False, 'Cannot divide type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != 'int' :
      return False, 'Cannot divide type ' + r.data.data.type + ' and ' + l.data.data.type
    else :
      return pushtemp(l.data.data.type, l.data.data.type),
  elif op == 'or' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#or', l.data.symid, r.data.symid
    if l.data.data.type != 'bool' :
      return False, 'Operator \'or\' cannot compare type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != 'bool' :
      return False, 'Operator \'or\' cannot compare type ' + r.data.data.type + ' and ' + l.data.data.type
    else:
      return pushtemp('bool', 'bool')
  elif op == 'and' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#and', l.data.symid, r.data.symid
    if l.data.data.type != 'bool' :
      return False, 'Operator \'and\' cannot compare type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != 'bool' :
      return False, 'Operator \'and\' cannot compare type ' + r.data.data.type + ' and ' + l.data.data.type
    else:
      return pushtemp('bool', 'bool')
  elif op == '==' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#==', l.data.symid, r.data.symid
    if l.data.data.type not in types :
      return False, 'Operator \'==\' cannot compare type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != l.data.data.type :
      return False, 'Operator \'==\' cannot compare type ' + r.data.data.type + ' and ' + l.data.data.type
    else:
      return pushtemp('bool', 'bool')
  elif op == '!=' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#!=', l.data.symid, r.data.symid
    if l.data.data.type not in types :
      return False, 'Operator \'!=\' cannot compare type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != l.data.data.type :
      return False, 'Operator \'!=\' cannot compare type ' + r.data.data.type + ' and ' + l.data.data.type
    else:
      return pushtemp('bool', 'bool')
  elif op == '<' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#<', l.data.symid, r.data.symid
    if l.data.data.type != 'int' :
      return False, 'Operator \'<\' cannot compare type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != l.data.data.type :
      return False, 'Operator \'<\' cannot compare type ' + r.data.data.type + ' and ' + l.data.data.type
    else:
      return pushtemp('bool', 'bool')
  elif op == '<=' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#<=', l.data.symid, r.data.symid
    if l.data.data.type != 'int' :
      return False, 'Operator \'<=\' cannot compare type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != l.data.data.type :
      return False, 'Operator \'<=\' cannot compare type ' + r.data.data.type + ' and ' + l.data.data.type
    else:
      return pushtemp('bool', 'bool')
  elif op == '>' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#>', l.data.symid, r.data.symid
    if l.data.data.type != 'int' :
      return False, 'Operator \'>\' cannot compare type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != l.data.data.type :
      return False, 'Operator \'>\' cannot compare type ' + r.data.data.type + ' and ' + l.data.data.type
    else:
      return pushtemp('bool', 'bool')
  elif op == '>=' :
    r = SAS.pop()
    l = SAS.pop()
    if DEBUG :
      print '#>=', l.data.symid, r.data.symid
    if l.data.data.type != 'int' :
      return False, 'Operator \'>=\' cannot compare type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != l.data.data.type :
      return False, 'Operator \'>=\' cannot compare type ' + r.data.data.type + ' and ' + l.data.data.type
    else:
      return pushtemp('bool', 'bool')
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

def pushtemp(typ, rtyp, kind='temp', par=None) :
  temp = symtab.insert(None, kind, override=True, data=symtable.data(type=typ, returntype=rtyp, param=par, accessmod='private'))
  SAS.push(SAR('#TPUSH', symtab.get(temp)))
  if DEBUG :
    print '#TPUSH', SAS.top().data.symid
  return True, 

def ipush(token) :
  SAS.push(SAR('ipush', token))
  if DEBUG :
    print '#IPUSH', SAS.top().value

def vpush(var) :
  symbol = symtab.get(var)
  SAS.push(SAR('vexist', symbol))
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
    pushtemp(symbol.data.type, symbol.data.returntype, 'f'+ symbol.kind, i.data[1])
  elif i.SAStype == 'arr' :
    typ = symbol.data.type[2:]
    pushtemp(typ, typ, 'a'+ symbol.kind, i.data[1])
  else :
    SAS.push(SAR('iexist', symbol))
  if DEBUG :
    print '#IEXIST', SAS.top().data.symid
  return True,

def rexist() :
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
    if symbol.kind == 'method' :
      success = matchfunc(member, symbol)
      if not success[0] :
        return success
      typ, rtyp = symbol.data.type, symbol.data.returntype
    elif member.SAStype == 'arr' :
      typ, rtyp = symbol.data.type[2:], symbol.data.returntype[2:]
    else:
      typ, rtyp = symbol.data.type, symbol.data.returntype
    if symbol.data.accessmod == 'public' or objec.data.kind == 'this' :
      if objec.data.kind == 'this' :
        #print typ, rtyp, 'r'+ symbol.kind, 'this'
        pushtemp(typ, rtyp, 'r'+ symbol.kind, 'this')
      else :
        #print typ, rtyp, 'r'+ symbol.kind, member.data[1]
        pushtemp(typ, rtyp, 'r'+ symbol.kind, member.data[1])
    else :
      return False, 'The reference ' + member.value + ' DNE as a public member'
  else :
    return False, 'The reference ' + member.value + ' DNE'
  if DEBUG :
    print '#REXIST', SAS.top().data.symid
  return True,

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
  #print 'args ', args.value
  fname = SAS.pop()
  #print 'funcname ', fname.value, args.data
  SAS.push(SAR('func', [fname, args]))
  return True,

def matchfunc(funcsar, symbol) :
  #print funcsar.data[0].data, funcsar.data[1].data, symbol.data.param
  if funcsar.data[0].value != symbol.value :
    return False, 'The function ' + funcsar.data[0].value + ' does not match ' + symbol.value
  if len(funcsar.data[1].data) != len(symbol.data.param) :
    #print funcsar.data, symbol.data.param
    return False, 'The function ' + symbol.value + ' requires exactly ' + str(len(symbol.data.param)) + ' arguments'
  for i in range(len(symbol.data.param)) : #params must be same type and order
    #p, q in funcsar.data[1].data, symbol.data.param
    if funcsar.data[1].data[i].data.returntype != symtab.get(symbol.data.param[i]).data.type :
      return False, 'The function ' + symbol.value + ' should take a ' + symtab.get(symbol.data.param[i]).data.type + ' got ' + funcsar.data[1].data[i].data.returntype
  return True,    

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
    return True,

def checkwhile() :
  exp = SAS.pop()
  if exp.data.data.returntype != 'bool' :
    return False, 'Expression in \'while(\' must be of type bool'
  else:
    return True,

def iopush(op) :
  if op == '<<' or op == '>>' :
    RTN.push(('io', ('int', 'char')))

def rtnpush(typ, m) :
  RTN.push((m, (typ, False)))

def io() :
  op = RTN.pop()
  val = SAS.pop()
  if op[0] != 'io' :
    return False, 'IO statement expected, got ' + op[0]
  elif val.data.data.returntype not in op[1] :
    return False, 'IO statement must have operand of types \'int\' or \'char\' got ' + val.data.data.returntype
  else :
    if DEBUG :
      print '#' + op[0] + ' ' + val.data.data.returntype
    return True,

def rtn(default=False) :
  val = SAS.pop()
  rval = RTN.pop()
  #print val, rval
  if default :
    if rval[0] == 'xtor' or rval[1][0] == 'void' or rval[1][1] :
      return True,
    else :
      return False, 'The function must return type ' + rval[1][0] + ' got void'
  if not (rval[0] != 'func' or rval[0] != 'xtor') :
    return False, 'Return statement expected, got ' + rval[0]
  elif val == None :
    if rval[1][0] == 'void' :
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
    pushtemp('@:' + typ.value, '@:'+typ.value, 'arr', index)
    return True, 
