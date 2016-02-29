from syntaxer import symtable

ops = {'(': 0, ')': 0, '[': 0, ']': 0, '=': 1, 'or': 2, 'and': 2, '==': 3, '!=': 3, '<': 4, '<=': 4, '>': 4, '>=': 4, '+': 5, '-': 5, '*': 6, '/': 6}
var = ('lvar', 'ivar', 'rlvar', 'rivar')

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
#symtab 

def opop() :
  op = OPS.pop()
  if op == '=' :
    r = SAS.pop()
    l = SAS.pop()
    print '#=', l.data.symid, r.data.symid
    if l.data.kind not in var :
      return False, 'Cannot assign to ' + l.data.kind
    elif l.data.data.type != r.data.data.returntype :
      return False, 'Cannot assign ' + r.data.data.returntype + ' to ' + l.data.data.type
    else :
      return True,
  elif op == '+' :
    r = SAS.pop()
    l = SAS.pop()
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
    print '#/', l.data.symid, r.data.symid
    if l.data.data.type != 'int' :
      return False, 'Cannot divide type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != 'int' :
      return False, 'Cannot divide type ' + r.data.data.type + ' and ' + l.data.data.type
    else :
      return pushtemp(l.data.data.type, l.data.data.type),
  else :
    return True, 

class SAR :
  def __init__(self, t, data) :
    self.SAStype = t
    if t == 'ipush' :
      self.value = data.lexeme
    elif t == '#AL' :
      self.value = 'arglist'
    elif t == 'func' :
      self.value = data[0].value
    else :
      self.value = data.value
    self.data = data
    #self.symid

def pushtemp(typ, rtyp, kind='temp') :
  temp = symtab.insert(None, kind, override=True, data=symtable.data(type=typ, returntype=rtyp, param=None, accessmod='private'))
  SAS.push(SAR('#TPUSH', symtab.get(temp)))
  print '#TPUSH', SAS.top().data.symid
  return True

def ipush(token) :
  SAS.push(SAR('ipush', token))
  print '#IPUSH', SAS.top().value

def iexist(stable) :
  i = SAS.pop()
  scope = symtab.scope
  idsym = symtab.idsymfromlex(i.value)
  if idsym :
    xid, symbol = idsym
  else :
    return False, 'The variable ' + i.value + ' DNE'
  while True :
    if symbol.scope == scope :
      SAS.push(SAR('iexist', symbol))
      break
    elif scope == 'g' :
      return False, 'The variable ' + i.value + ' DNE in the current scope'
    else :
      scope = widen(scope)
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
    if symbol.data.accessmod == 'public' :
      print symbol.data.type, symbol.data.returntype, 'r'+ symbol.kind
      pushtemp(symbol.data.type, symbol.data.returntype, 'r'+ symbol.kind)
  else :
    return False, 'The reference ' + member.value + ' DNE'
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
  print '#OPUSH', op
  return True,

def eoe() :
  print '#EOE'
  while OPS.length > 0 :
    success = opop()
    if not success[0] :
      return success
  return True,

def widen(scope) :
  s = scope.split('.')
  if s == ['g'] :
    return 'g'
  return '.'.join(s[0:-1])

def lpush(sym) :
  print '#LPUSH', sym.symid
  SAS.push(SAR('#LPUSH', sym))

def bal() :               # FOr some reason its never getting in here.
  print '#BAL', SAS.top().value
  SAS.push(SAR('#BAL', SAS.top()))

def eal() : 
  arg()
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

def arg() :
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
