from syntaxer import symtable

ops = {'(': 0, ')': 0, '[': 0, ']': 0, '=': 1, 'or': 2, 'and': 2, '==': 3, '!=': 3, '<': 4, '<=': 4, '>': 4, '>=': 4, '+': 5, '-': 5, '*': 6, '/': 6}
var = ('lvar', 'ivar')

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
      temp = symtab.insert(None, 'temp', override=True, data=symtable.data(type=l.data.data.type, returntype=l.data.data.type, param=None, accessmod='private'))
      print temp
      return True,
  elif op == '-' :
    r = SAS.pop()
    l = SAS.pop()
    print '#-', l.data.symid, r.data.symid
    if l.data.data.type != 'int' :
      return False, 'Cannot subtract type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != 'int' :
      return False, 'Cannot subtract type ' + r.data.data.type + ' and ' + l.data.data.type
    else :
      return True,
  elif op == '*' :
    r = SAS.pop()
    l = SAS.pop()
    print '#*', l.data.symid, r.data.symid
    if l.data.data.type != 'int' :
      return False, 'Cannot multiply type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != 'int' :
      return False, 'Cannot multiply type ' + r.data.data.type + ' and ' + l.data.data.type
    else :
      return True,
  elif op == '/' :
    r = SAS.pop()
    l = SAS.pop()
    print '#/', l.data.symid, r.data.symid
    if l.data.data.type != 'int' :
      return False, 'Cannot divide type ' + l.data.data.type + ' and ' + r.data.data.type
    elif r.data.data.type != 'int' :
      return False, 'Cannot divide type ' + r.data.data.type + ' and ' + l.data.data.type
    else :
      return True,
  else :
    return True, 

class SAR :
  def __init__(self, t, data) :
    self.SAStype = t
    if t == 'ipush' :
      self.value = data.lexeme
    self.data = data
    #self.symid


def ipush(token) :
  SAS.push(SAR('ipush', token))
  print '#IPUSH', SAS.top().value

def iexist(stable) :
  i = SAS.pop()
  scope = stable.scope
  idsym = stable.idsymfromlex(i.value)
  if idsym :
    xid, symbol = idsym
  else :
    return False, 'The variable ' + i.value + ' DNE'
  while True :
    if symbol.scope == scope :
      SAS.push(SAR('iexist', symbol))
      break
    else :
      scope = widen(scope)
  print '#IEXIST', SAS.top().data.symid
  return True,

def opush(op) :
  val = ops.get(op)
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
  return '.'.join(s[0:-1])

def lpush(sym) :
  print '#LPUSH'
  SAS.push(SAR('#LPUSH', sym))