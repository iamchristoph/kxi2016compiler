#syntaxer.py
import lexer
from collections import namedtuple
import semantic
import tcode

DEBUG = False

class symtable :
  #symbol = namedtuple('sym', ['scope', 'symid', 'value', 'kind', 'data'])
  class symbol :
    def __init__(self, scope, symid, val, kind, data) :
      self.scope = scope
      self.symid = symid
      self.value = val
      self.kind = kind
      self.data = data
    def __repr__(self) :
      return 'symid: ' + self.symid + ' scope: ' + self.scope + ' value: ' + self.value + ' kind: ' + self.kind + '\ndata: { '\
       + self.data.__repr__() + '}\n'  
  class data :
    def __init__(self, typ, returntype, param, accessmod, size=0, offset=0) :
      self.type = typ     
      self.returntype = returntype
      self.param = param
      self.accessmod = accessmod
      self.size = size
      self.offset = offset
      self.psize = 0
    def __repr__(self) :
      if self.psize :
        p = ' psize: ' + str(self.psize)
      else :
        p = ''
      return 'type: ' + self.type + ' r-type: ' + self.returntype + ' param: [' + self.param.__repr__() + ']\n\taccess: '\
       + self.accessmod.__repr__() + ' size: ' + str(self.size) + ' offset: ' + str(self.offset) + p
  #data = namedtuple('data', ['type', 'returntype', 'param', 'accessmod', 'size', 'offset'])
  def __init__(self, d=False) :
    self.debug = d
    self.table = {'this': symtable.symbol('g', 'this', 'void', 'this', symtable.data('void', 'void', [], None))}
    self.isfull = False
    self.scope = 'g'
    self.currentid = 100

  def  symfromscope(self, scope) :
    l ={}
    for _id, sym in self.table.iteritems() :
      if sym.scope == scope :
        l[_id] = sym
    return l

  def idsymfromlex(self, lexem) :
    for _id, sym in self.table.iteritems() :
      if lexem == sym.value :
        return _id, sym
    return None
  def idsymfromlexscope(self, lexem, scope) :
    #print lexem, scope
    for _id, sym in self.table.iteritems() :
      if lexem == sym.value :
        if scope == sym.scope :
          return _id, sym
    return None
  def get(self, symid) :
    return self.table.get(symid)
  def getid(self, kind, full=False) :
    self.currentid += 1
    c = kind[0].upper()
    if kind == 'ilit' :
      c = 'N'
    if kind == 'clit' :
      c = 'H'
    if full :
      c = kind
    return c + str(self.currentid)

  def insert(self, t, kind, data=None, scope=None, override=False) :
    if not self.isfull or override :
      if not override :
        dup = self.idsymfromlexscope(t.lexeme, self.scope)
        if dup :
          if not (dup[1].kind == 'class' and kind == 'xtor') :
            print 'Line: ', t.line, t.bit, 'The token', t.lexeme, 'has already been defined as', dup[1].data.type, 'cannot be redefined as', data.type
            sys.exit(1)
      if kind == 'ilit' or kind == 'clit' or kind == 'blit' or kind == 'null' :
        try:
          val = t.lexeme
        except:
          val = t
        dup = self.idsymfromlex(val)
        if dup :
          return dup[0]
      if kind == 'return' :
        dup = self.idsymfromlexscope(t, self.scope)
        if dup :
          return dup[0]
        else :
          _id = self.getid('lvar')
      else :
        _id = self.getid(kind)
      if override :
        val = _id
      else :
        val = t.lexeme
      if not scope :
        scope = self.scope
      self.table[_id] = symtable.symbol(scope, _id, val, kind, data)
      if self.debug :
        self.display(_id)
      return _id
    else :
      scope = self.scope
      while True :
        idsym = self.idsymfromlexscope(t.lexeme, scope)
        if idsym :
          _id, symbol = idsym
          break
        elif scope == 'g' :
          return False, 'The variable ' + i.value + ' DNE'
        else :
          scope = semantic.widen(scope)
      if self.debug :
        self.display(_id)
      return _id

  def scoper(self, name=None) :
    if name :
      self.scope = self.scope + '.' + name
    else :
      s = self.scope.split('.')
      self.scope = '.'.join(s[0:-1])
  def display(self, i) :
    print 'SYMID: ', i
    print '  Scope: ' + self.table[i].scope + '\tValue: ' + self.table[i].value + '\tKind: ' + self.table[i].kind
    if self.table[i].data :
      print '    Data: ',
      if self.table[i].data.type :
        print 'Type: ' + self.table[i].data.type,
      if self.table[i].data.returntype :
        print 'Return: ' + self.table[i].data.returntype,
      if self.table[i].data.param :
        print 'Param: ',
        print self.table[i].data.param,
      print 'Mod: ' + self.table[i].data.accessmod

class syntaxer :
  expressionlexeme = ('(', 'true', 'false', 'null', 'this')
  expressiontype = ('number', 'character', 'identifier')
  statementlexeme = ('block', 'lock', 'cin', 'cout', 'return', 'if', 'while', 'spawn', 'release', '{')
  expressionzlexeme = ('=', "and", "or", "==", "!=", "<=", ">=", "<", ">", "+", "-", "*", "/")
  def __init__(self, fname, scheck=False, d=False) : #d is the debug value
    self.lexer = lexer.lexer(fname, False)
    self.thefilename = fname
    self.token = self.lexer.getToken
    self.nexttoken = self.lexer.getNext
    self.tkgen = self.lexer.tokengenerator
    self.classnames = set(['int', 'char', 'bool', 'void', 'sym'])
    self.symtab = symtable(d)
    self.semcheck = scheck

  def generror(self, langdef='', deftype='', typ='', lexeme='') :
    t = self.token()
    print 'Line: ', t.line, t.bit, 'In', langdef, deftype, 'Expected', typ, lexeme, 'got', t.type, t.lexeme
    sys.exit(1)

  def gensemerror(self, message) :
    t = self.token()
    print 'Line: ', t.line, message
    exit(1)
  
  def isexpression(self, t) :
    if t.lexeme in syntaxer.expressionlexeme :
      return True
    elif t.type in syntaxer.expressiontype :
      return True
    else :
      return False

  def isstatement(self, t) :
    if t.lexeme in syntaxer.statementlexeme :
      return True
    else :
      return self.isexpression(t)  

  def isfnarrmember(self, t) :
    if t.lexeme == '(' :
      return True
    elif t.lexeme == '[' :
      return True
    else :
      return False

  def eoe(self, where='') :
    rtn = False
    if where == 'rtn' :
      rtn = True
    if self.token().lexeme == ';' :
      if self.semcheck :
        success = semantic.eoe(rtn)
        if not success[0] :
          self.gensemerror(success[1])
      self.tkgen.next()
    else :
      self.generror(where, '', 'symbol', ';')

  def expressionz(self) :
    t = self.token()
    if t.lexeme == '=' :
      if self.semcheck :
        success = semantic.opush(t.lexeme)
        if not success[0] :
          self.gensemerror(success[1])
      self.tkgen.next()
      self.assignmentexpression()
    elif t.lexeme in syntaxer.expressionzlexeme :
      if self.semcheck :
        semantic.opush(t.lexeme)
      self.tkgen.next()
      self.expression()

  def argumentlist(self) :
    if self.isexpression(self.token()) :
      self.expression()
    else :
      self.generror('argumentlist', '', 'expression')
    while self.token().lexeme == ',' :
      if self.semcheck :
        success = semantic.arg()
        if not success[0] :
          self.gensemerror(success[1])
      self.tkgen.next()
      if self.isexpression(self.token()) :
        self.expression()
      else :
        self.generror('argumentlist', '', 'expression')
    #argument_list::= expression { "," expression }

  def newdeclaration(self) :
    if self.token().lexeme == '(' :
      if self.semcheck :
        semantic.opush('(')
        semantic.bal()
      self.tkgen.next()
      if self.isexpression(self.token()) :
        self.argumentlist()
      if self.token().lexeme == ')' :
        if self.semcheck :
          success = semantic.eal()
          if not success[0] :
            self.gensemerror(success[1])
          success = semantic.newobj()
          if not success[0] :
            self.gensemerror(success[1])
        self.tkgen.next()
      else :
        self.generror('newdeclaration', '', 'symbol', ')')
    elif self.token().lexeme == '[' :
      if self.semcheck :
        semantic.opush('[')
      self.tkgen.next()
      self.expression()
      if self.token().lexeme == ']' :
        if self.semcheck :
          success = semantic.rbrac()
          if not success[0] :
            self.gensemerror(success[1])
          else :
            success = semantic.newarr()
            if not success[0] :
              self.gensemerror(success[1])
        self.tkgen.next()
      else :
        self.generror('newdeclaration', '', 'symbol',']')
    else :
      self.generror('newdeclaration', '', 'symbol', '( [')
    #new_declaration::=  "(" [ argument_list ] ")"  | "[" expression "]"

  def fnarrmember(self) :
    if self.token().lexeme == '(' :
      if self.semcheck :
        semantic.opush('(')
        semantic.bal()
      self.tkgen.next()
      if self.token().lexeme != ')' :
        self.argumentlist()
      if self.token().lexeme == ')' :
        if self.semcheck :
          success = semantic.eal()
          if not success[0] :
            self.gensemerror(success[1])
          success = semantic.func()
          if not success[0] :
            self.gensemerror(success[1])
        self.tkgen.next()
      else :
        self.generror('fnarrmember', '', 'symbol', ')')
    elif self.token().lexeme == '[' :
      if self.semcheck :
        semantic.opush('[')
      self.tkgen.next()
      self.expression()
      if self.token().lexeme == ']' :
        if self.semcheck :
          success = semantic.rbrac()
          if not success[0] :
            self.gensemerror(success[1])
          else :
            success = semantic.arr()
            if not success[0] :
              self.gensemerror(success[1])
        self.tkgen.next()
      else :
        self.generror('fnarrmember', '', 'symbol', ']')
    else :
      self.generror('fnarrmember', '', 'symbol', '( [')
    #fn_arr_member::= "(" [ argument_list ] ")" | "[" expression "]"

  def memberrefz(self) :
    if self.token().lexeme == '.' :
      self.tkgen.next()
    else :
      self.generror('memberrefz', '', 'punctuation', '.')
    if self.token().type == 'identifier' :
      if self.semcheck :
        semantic.ipush(self.token())
      self.tkgen.next()
    else :
      self.generror('memberrefz', '', 'identifier')
    if self.isfnarrmember(self.token()) :
      self.fnarrmember()
    if self.semcheck :
        success = semantic.rexist()
        if not success[0] :
          self.gensemerror(success[1])
    if self.token().lexeme == '.' :
      self.memberrefz()
    #member_refz::= "." identifier [ fn_arr_member ] [ member_refz ]

  def expression(self) :
    t = self.token()
    if t.lexeme == '(' :
      if self.semcheck :
        semantic.opush('(')
      self.tkgen.next()
      self.expression()
      if self.token().lexeme == ')' :
        if self.semcheck :
          success = semantic.rparen()
          if not success[0] :
            self.gensemerror(success[1])
        self.tkgen.next()
      else :
        self.generror('expression', '', 'symbol', ')')
    elif t.lexeme == 'true' :
      sid = self.symtab.insert(t, 'blit', symtable.data(typ='bool', returntype='bool', param=None, accessmod='public', size=4), scope='g')
      if self.semcheck :
        semantic.lpush(self.symtab.get(sid))
      self.tkgen.next()
    elif t.lexeme == 'false' :
      sid = self.symtab.insert(t, 'blit', symtable.data(typ='bool', returntype='bool', param=None, accessmod='public', size=4), scope='g')
      if self.semcheck :
        semantic.lpush(self.symtab.get(sid))
      self.tkgen.next()
    elif t.lexeme == 'null' :
      sid = self.symtab.insert(t, 'null', symtable.data(typ='null', returntype='null', param=None, accessmod='public', size=4), scope='g')
      if self.semcheck :
        semantic.lpush(self.symtab.get(sid))
      self.tkgen.next()
    elif t.lexeme == 'this' :
      self.tkgen.next()
      if self.semcheck :
        semantic.ipush(t)
        semantic.iexist(self.symtab)
      if self.token().lexeme == '.' :
        self.memberrefz()
    elif t.type == 'number' :
      sid = self.symtab.insert(t, 'ilit', symtable.data(typ='int', returntype='int', param=None, accessmod='public', size=4), scope='g')
      if self.semcheck :
        semantic.lpush(self.symtab.get(sid))
      self.tkgen.next()
    elif t.type == 'character' :
      sid = self.symtab.insert(t, 'clit', symtable.data(typ='char', returntype='char', param=None, accessmod='public', size=1), scope='g')
      if self.semcheck :
        semantic.lpush(self.symtab.get(sid))
      self.tkgen.next()
    elif t.type == 'identifier' :
      if self.semcheck :
        semantic.ipush(t)
      self.tkgen.next()
      if self.isfnarrmember(self.token()) :
        self.fnarrmember()
      if self.semcheck :
        success = semantic.iexist(self.symtab)
        if not success[0] :
          self.gensemerror(success[1])
      if self.token().lexeme == '.' :
        self.memberrefz()
    else :
      self.generror('expression', '', 'keyword, or identifier', '')
    if self.token().lexeme in syntaxer.expressionzlexeme :
      self.expressionz()

    #'expression::= "(" expression ")" [ expressionz ] | "true" [ expressionz ] | "false" [ expressionz ]' +
    #'| "null" [ expressionz ] | "this" [ member_refz ] /* bug fix to kxi 2015 */ | numeric_literal [ expressionz ]' +
    #'| character_literal [ expressionz ] | identifier [ fn_arr_member ] [ member_refz ] [ expressionz ]')
    
  def assignmentexpression(self) :
    if self.isexpression(self.token()) :
      self.expression()
    elif self.token().lexeme == 'new' :
      self.tkgen.next()
      if self.token().type == 'type' or self.token().type == 'identifier' :
        if self.semcheck :
          if self.token().lexeme not in self.classnames :
            self.gensemerror('Type \''+ self.token().lexeme +'\' DNE')
          else :
            semantic.ipush(self.token())
        self.tkgen.next()
      else :
        self.generror("assignmentexpression", '', 'type or classname')
      self.newdeclaration()
    elif self.token().lexeme == 'atoi' :
      self.tkgen.next()
      if self.token().lexeme == '(' :
        self.tkgen.next()
      else :
        self.generror('assignmentexpression', '', 'symbol', '(')
      self.expression()
      if self.token().lexeme == ')' :
        if self.semcheck :
          success = semantic.atoi()
          if not success[0] :
            self.gensemerror(success[1])
        self.tkgen.next()
      else :
        self.generror('assignmentexpression', '', 'symbol', ')')
    elif self.token().lexeme == 'itoa' :
      self.tkgen.next()
      if self.token().lexeme == '(' :
        self.tkgen.next()
      else :
        self.generror('assignmentexpression', '', 'symbol', '(')
      self.expression()
      if self.token().lexeme == ')' :
        if self.semcheck :
          success = semantic.itoa()
          if not success[0] :
            self.gensemerror(success[1])
        self.tkgen.next()
      else :
        self.generror('assignmentexpression', '', 'symbol', ')')
    else :
      self.generror('assignmentexpression', '', 'expression or keyword', 'new atoi itoa')
    #'assignment_expression::= expression | \"new\" type new_declaration | \"atoi\" \"(\" expression \")\" | \"itoa\" \"(\" expression \")\"'
    
  def variabledeclaration(self) :
    if self.token().type == 'type' or self.token().type == 'identifier' :
      typ = self.token().lexeme
      if self.semcheck :
        if typ not in self.classnames :
          gensemerror('Type \''+typ+'\' DNE')
      self.tkgen.next()
    else :
      self.generror('variabledeclaration', '', '\'type\' or classname')
    if self.token().type == 'identifier' :
      t = self.token()
      self.tkgen.next()
    else :
      self.generror('variabledeclaration', '', 'identifier')
    if self.token().lexeme == '[' :
      var = self.symtab.insert(t, 'lvar', symtable.data(typ='@:'+ typ, returntype='@:'+typ, param=None, accessmod='private'))
      if self.semcheck :
        semantic.vpush(var)
      self.tkgen.next()
      if self.token().lexeme == ']' :
        self.tkgen.next()
      else :
        self.generror('variabledeclaration', '', 'symbol', ']')
    else :
      var = self.symtab.insert(t, 'lvar', symtable.data(typ=typ, returntype=typ, param=None, accessmod='private'))
      if self.semcheck :
        semantic.vpush(var)
    if self.token().lexeme == '=' :
      if self.semcheck :
        semantic.opush('=')
      self.tkgen.next()
      self.assignmentexpression()
    self.eoe('variable declaration')
    # 'variable_declaration::=type identifier [\"[\" \"]\"] [\"=\" assignment_expression ] \";\"'
    
  def statement(self) :
    t = self.token()
    if t.lexeme == '{' :
      self.tkgen.next()
      while self.isstatement(self.token()) :
        self.statement()
      if self.token().lexeme == '}' :
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'symbol', '}')
    elif self.isexpression(t) : #if its an expression
      self.expression()
      self.eoe('statement')
      return
    elif t.lexeme == 'if' :
      self.tkgen.next()
      if self.token().lexeme == '(' :
        if self.semcheck :
          semantic.opush('(')
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'symbol', '(')
      self.expression()
      if self.token().lexeme == ')' :
        if self.semcheck :
          success = semantic.rparen()
          if not success[0] :
            self.gensemerror(success[1])
          success = semantic.checkif()
          if not success[0] :
            self.gensemerror(success[1])
          else :
            b = success[1]
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'symbol', ')')
      if self.semcheck :
        semantic.iif(b)
      self.statement()
      if self.semcheck :
        semantic.iskip(self.token().lexeme)
      if self.token().lexeme == 'else' :
        self.tkgen.next()
        self.statement()
        if self.semcheck :
          semantic.ielse()
    elif t.lexeme == 'while' :
      self.tkgen.next()
      if self.token().lexeme == '(' :
        if self.semcheck :
          semantic.ibegin()
          semantic.opush('(')
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'symbol', '(')
      self.expression()
      if self.token().lexeme == ')' :
        if self.semcheck :
          success = semantic.rparen()
          if not success[0] :
            self.gensemerror(success[1])
          success = semantic.checkwhile()
          if not success[0] :
            self.gensemerror(success[1])
          else :
            b = success[1]
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'symbol', ')')
      if self.semcheck :
        semantic.iwhile(b)
      self.statement()
      if self.semcheck :
        semantic.iend()
    elif t.lexeme == 'return' :
      self.tkgen.next()
      if self.isexpression(self.token()) : #if its an expression
        self.expression()
      self.eoe('rtn')
      if self.semcheck :
        success = semantic.rtn()
        if not success[0] :
          self.gensemerror(success[1])
      return
    elif t.lexeme == 'cout' :
      self.tkgen.next()
      if self.token().lexeme == '<<' :
        if self.semcheck :
          semantic.iopush('<<')
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'symbol', '<<')
      self.expression()
      self.eoe('rtn')
      if self.semcheck :
        success = semantic.io()
        if not success[0] :
          self.gensemerror(success[1])
      return
    elif t.lexeme == 'cin' :
      self.tkgen.next()
      if self.token().lexeme == '>>' :
        if self.semcheck :
          semantic.iopush('>>')
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'symbol', '>>')
      self.expression()
      self.eoe('rtn')
      if self.semcheck :
        success = semantic.io()
        if not success[0] :
          self.gensemerror(success[1])
      return
    elif t.lexeme == 'spawn' :
      self.tkgen.next()
      self.expression()
      if self.token().lexeme == 'set' :
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'keyword', 'set')
      if self.token().type == 'identifier' :
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'identifier')
      self.eoe('statement')
      return
    elif t.lexeme == 'block' :
      self.tkgen.next()
      self.eoe('statement')
      return
    elif t.lexeme == 'lock' :
      self.tkgen.next()
      if self.token().type == 'identifier' :
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'identifier')
      self.eoe('statement')
      return
    elif t.lexeme == 'release' :
      self.tkgen.next()
      if self.token().type == 'identifier' :
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'identifier')
      self.eoe('statement')
      return
    else :
      self.generror('', 'statement', 'keyword, or', 'expression')

  def methodbody(self) :
    if self.token().lexeme == '{' :
      self.tkgen.next()
    else :
      self.generror('declaration', 'methodbody', 'symbol', '{')
    while self.token().type == 'type' or self.token().type == 'identifier' :
      if self.nexttoken().type == 'identifier' :
        self.variabledeclaration()
      else :
        break
    while self.isstatement(self.token()) :
      self.statement()
    if self.token().lexeme == '}' :
      if self.semcheck :
        success = semantic.rtn(True)
        if not success[0] :
          self.gensemerror(success[1])
      self.tkgen.next()
    else :
      self.generror('declaration', 'methodbody', 'symbol', '}')
  
  def classname(self) :
    if self.token().type == 'identifier' :
      classname = self.token().lexeme
      self.classnames.add(classname)
      classsymid = self.symtab.insert(self.token(), 'class', symtable.data('class', '', '', '', size=0))
      self.tkgen.next()
      return classsymid, classname
    else :
      self.generror('name', 'classname', 'identifier')

  def constructordeclaration(self) :
    if self.token().type == 'identifier' :
      t = self.token()
      if self.semcheck :
        success = semantic.cdec(t)
        if not success[0] :
          self.gensemerror(success[1])
      self.tkgen.next()
    else :
      self.generror('', 'constructordeclaration', 'classname')
    if self.token().lexeme == '(' :
      self.tkgen.next()
    else :
      self.generror('declaration', 'constructordeclaration', 'symbol', '(')
    param = []
    if self.token().lexeme != ')' :
      self.symtab.scoper(t.lexeme)
      param = self.parameterlist()
      self.symtab.scoper()
    if self.token().lexeme == ')' :
      self.tkgen.next()
    else :
      self.generror('declaration', 'constructordeclaration', 'symbol', ')')
    xid = self.symtab.insert(t, 'xtor', symtable.data(typ='method', returntype=t.lexeme, param=param, accessmod='public'))
    if self.semcheck :
      semantic.rtnpush(t.lexeme, 'xtor')
      semantic.Icode.append([xid, 'FUNC', xid, None, None, ';  Contructor for class ' + t.lexeme])
    else :
      semantic.funcp(self.symtab.get(xid))
    self.symtab.scoper(t.lexeme)
    self.methodbody()
    self.symtab.scoper()

  def parameter(self) :
    if self.token().type == 'type' or self.token().type == 'identifier' :
      typ = self.token().lexeme
      if self.semcheck :
        if typ not in self.classnames :
          self.gensemerror('Type \''+typ+'\' DNE')
      self.tkgen.next()
    else :
      self.generror('parameter', '', 'type')  
    if self.token().type == 'identifier' :
      t = self.token()
      self.tkgen.next()
    else :
      self.generror('parameter', '', 'identifier')
    if self.token().lexeme == '[' :
      self.tkgen.next()
      if self.token().lexeme == ']' :
        typ = '@:'+ typ
        self.tkgen.next()
      else :
        self.generror('parameter', '', 'symbol', ']')  
    return self.symtab.insert(t, 'param', symtable.data(typ, typ, None, 'private'))  

  def parameterlist(self) :
    param = []
    param.append(self.parameter())
    while True :
      if self.token().lexeme == ',' :
        self.tkgen.next()
        param.append(self.parameter())
      else :
        return param
    
  def fielddeclaration(self, mod, typ, t) :
    if self.token().lexeme == '(' :
      self.symtab.scoper(t.lexeme)
      self.tkgen.next()
      param = []
      if self.token().lexeme != ')' :
        param = self.parameterlist()
      if self.token().lexeme == ')' :
        self.symtab.scoper()
        methodid = self.symtab.insert(t, 'method', symtable.data('method', typ, param, mod))
        symbol = self.symtab.get(methodid)
        if self.semcheck :
          semantic.Icode.append([symbol.symid, 'FUNC', symbol.symid, None, None, ';  ' + symbol.data.returntype + ' ' + symbol.value + '(' + str(symbol.data.param) + ')']) # ret func(param)  
        else :
          semantic.funcp(symbol)
        self.tkgen.next()
      else :
        self.generror('declaration', 'field_declaration', 'symbol', ')')
      self.symtab.scoper(t.lexeme)
      if self.semcheck :
        semantic.rtnpush(typ, 'func')
      self.methodbody()
      self.symtab.scoper()
      return
    if self.token().lexeme == '[' :
      typ = '@:' + typ
      self.tkgen.next()
      if self.token().lexeme == ']' :
        self.tkgen.next()
      else :
        self.generror('declaration', 'field_declaration', 'symbol', ']')
    var = self.symtab.insert(t, 'ivar', symtable.data(typ, typ, None, mod))
    if self.semcheck :
      semantic.vpush(var)
    if self.token().lexeme == '=' :
      if self.semcheck :
        semantic.opush('=')
      self.tkgen.next()
      self.assignmentexpression()
      self.eoe('field_declaration')
      return
    self.eoe('field_declaration')

  def classmemberdeclaration(self, cid) :
    if self.token().type == 'modifier' :
      mod = self.token().lexeme
      self.tkgen.next()
    elif self.token().type == 'identifier' :
      self.constructordeclaration()
      return
    else :
      self.generror('declaration', 'class_member_declaration', 'modifier')
    t = self.token()
    if t.type == 'type' or t.type == 'identifier' :
      if self.nexttoken().lexeme == '[' :
        typ = '@:' + self.token().lexeme
        self.tkgen.next()
        self.tkgen.next()
        if self.token().lexeme != ']' :
          self.generror('declaration', 'class_member_declaration', '\']\'')
      else :
        typ = t.lexeme
      if self.semcheck :
        if t.lexeme not in self.classnames :
          self.gensemerror('Type \''+typ+'\' DNE')
      self.tkgen.next()
    else :
      self.generror('declaration', 'class_member_declaration', 'type')
    if self.token().type == 'identifier' :
      t = self.token()
      self.tkgen.next()
    else :
      self.generror('declaration', 'class_member_declaration', 'identifier')
    self.fielddeclaration(mod, typ, t)

  def classdeclaration(self) :
    if self.token().lexeme == 'class' :
      self.tkgen.next()
    else :
      self.generror('declaration', 'class_declaration', 'keyword', 'class')
    cid, cname = self.classname()
    if self.token().lexeme == '{' :
      self.symtab.scoper(cname)
      if self.semcheck :
        semantic.statcon = self.symtab.insert('sc' + cname, 'staticinit', symtable.data('sc' + cname, '', '', '', size=0), override=True)
        semantic.statcons[semantic.statcon] = [[semantic.statcon, 'FUNC', semantic.statcon, None, None, ';  static initializer for class' + cname]]
      self.tkgen.next()
    else :
      self.generror('declaration', 'class_declaration', 'symbol', '{')
    while self.token().lexeme != '}' :
      self.classmemberdeclaration(cid)
    if self.token().lexeme == '}' :
      self.symtab.scoper()
      self.tkgen.next()
      if self.semcheck :
        semantic.statcons[semantic.statcon].append([None, 'RTN', None, None, None, '; return from static initializer for ' + cname])
        semantic.statcon = None
    else :
      self.generror('declaration', 'class_declaration', 'symbol', '}')

  def compilationunit(self) :
    while self.token().lexeme == 'class' :
      self.classdeclaration()
    if self.token().lexeme == 'void' :
      self.tkgen.next()
    else :
      self.generror('compilation_unit', 'main_declaration', 'keyword', '\'void\' or \'class\'')
    if self.token().lexeme == 'kxi2016' :
      self.tkgen.next()
    else :
      self.generror('compilation_unit', 'main_declaration', 'keyword', 'kxi2016')
    if self.token().lexeme == 'main' :
      main = self.symtab.insert(self.token(), 'main', symtable.data('main', returntype='void', param=[], accessmod='public'))
      if self.semcheck :
        semantic.Icode.append([main, 'FUNC', main, None, None, '; void kxi2016 main()'])
        semantic.backpatch('main', main)
      self.tkgen.next()
    else :
      self.generror('compilation_unit', 'main_declaration', 'keyword', 'main')
    if self.token().lexeme == '(' :
      self.tkgen.next()
    else :
      self.generror('compilation_unit', 'main_declaration', 'symbol', '(')
    if self.token().lexeme == ')' :
      self.tkgen.next()
    else :
      self.generror('compilation_unit', 'main_declaration', 'symbol', ')')
    self.symtab.scoper('main')
    if self.semcheck :
      semantic.rtnpush('void', 'main')
    self.methodbody()
    self.symtab.scoper()
    if self.token().type != 'EOF' :
      self.generror('compilation_unit', '', 'EOF', '')
    if self.semcheck:
      semantic.addscons()

  def run(self) :
    semantic.symtab = self.symtab
    self.compilationunit()
    if self.token().type == 'EOF' :
      del self.lexer 
    self.getoffsets()
    self.semcheck = True
    self.symtab.isfull = True
    self.lexer = lexer.lexer(self.thefilename, False)
    self.token = self.lexer.getToken
    self.tkgen = self.lexer.tokengenerator
    self.nexttoken = self.lexer.getNext
    semantic.syntaxer = self
    self.compilationunit()

    if DEBUG:
      semantic.Iprint()
    tcode.symtab = self.symtab
    
    scopes = set('g')
    for sym in self.symtab.table.iteritems() :
      scopes.add(sym[1].scope)
    if DEBUG :
      for scope in scopes :
        s = scope.split('.')
        print '-----------------------------------------------------------'
        print self.symtab.idsymfromlexscope(s[-1], '.'.join(s[0:-1]))
        print scope + '\n', self.symtab.symfromscope(scope)
      print '-----------------------------------------------------------'
    #for n in self.classnames :
    #  print self.symtab.idsymfromlexscope(n, 'g')
    #  print n + '\n', self.symtab.symfromscope('g.'+ n)

    asm = []
    for code in semantic.Icode :
      for c in tcode.get(code) :
        asm.append(c)
    return asm

  def getoffsets(self) :
    for n in self.classnames :
      classid = self.symtab.idsymfromlexscope(n, 'g')
      for _id, sym in self.symtab.symfromscope('g.'+ n).iteritems() :
        if sym.kind == 'ivar' :
          if sym.data.type == 'char' :
            sym.data.size = 1
          else:
            sym.data.size = 4
          sym.data.offset = classid[1].data.size
          classid[1].data.size +=sym.data.size


if __name__ == '__main__' :
  import sys
  if len(sys.argv) > 1 :
    fname = sys.argv[1]
  else :
    fname = 'test.kxi'
  out = 'out' + fname[:-4]  + '.txt'
  output = 'out' + fname[:-4]  + '.asm'
  #analyzer = lexer.lexer(fname)#
  #token = analyzer.tokengenerator
  #getToken = analyzer.getToken
  syntax = syntaxer(fname, False, DEBUG)
  asm = syntax.run()
  op = file(out, 'w')
  for i in semantic.Icode :
    s = ''
    for n in i :
      if n :
        s += str(n) + ' '
    s += '\n'
    op.write(s)
  op.close()
  ot = file(output, 'w')

  for i in asm :
    s = ''
    for n in i :
      if n :
        s += str(n) + ' '
    s += '\n'
    ot.write(s)
  ot.close()
  #while token.next() :
  #  getToken(debug)
  #analyzer.getToken(debug)
  #token.close()


    #if 

