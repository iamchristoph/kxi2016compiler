#syntaxer.py
import lexer
from collections import namedtuple
import semantic



class symtable :
  symbol = namedtuple('sym', ['scope', 'symid', 'value', 'kind', 'data'])
  data = namedtuple('data', ['type', 'returntype', 'param', 'accessmod'])
  def __init__(self, d=False) :
    self.debug = d
    self.table = {}
    self.isfull = False
    self.scope = 'g'
    self.currentid = 100

  def idsymfromlex(self, lexem) :
    for _id, sym in self.table.iteritems() :
      if lexem == sym.value :
        return _id, sym
  def get(self, symid) :
    return self.table.get(symid)
  def getid(self, kind) :
    self.currentid += 1
    c = kind[0].upper()
    if kind == 'ilit' :
      c = 'N'
    if kind == 'clit' :
      c = 'H'
    return c + str(self.currentid)
  def insert(self, t, kind, data=None, scope=None, override=False) :
    if not self.isfull and not override :
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
      for _id, sym in self.table.iteritems() :
        if sym.value == t.lexeme :
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
    self.classnames = []
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
    if self.token().lexeme == ';' :
      if self.semcheck :
        success = semantic.eoe()
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
      self.tkgen.next()
      if self.isexpression(self.token()) :
        self.expression()
      else :
        self.generror('argumentlist', '', 'expression')
    #argument_list::= expression { "," expression }

  def newdeclaration(self) :
    if self.token().lexeme == '(' :
      self.tkgen.next()
      if self.isexpression(self.token()) :
        self.argumentlist()
      if self.token().lexeme == ')' :
        self.tkgen.next()
      else :
        self.generror('newdeclaration', '', 'symbol', ')')
    elif self.token().lexeme == '[' :
      self.tkgen.next()
      self.expression()
      if self.token().lexeme == ']' :
        self.tkgen.next()
      else :
        self.generror('newdeclaration', '', 'symbol',']')
    else :
      self.generror('newdeclaration', '', 'symbol', '( [')
    #new_declaration::=  "(" [ argument_list ] ")"  | "[" expression "]"

  def fnarrmember(self) :
    if self.token().lexeme == '(' :
      self.tkgen.next()
      self.argumentlist()
      if self.token().lexeme == ')' :
        self.tkgen.next()
      else :
        self.generror('fnarrmember', '', 'symbol', ')')
    elif self.token().lexeme == '[' :
      self.tkgen.next()
      self.expression()
      if self.token().lexeme == ']' :
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
      self.tkgen.next()
    else :
      self.generror('memberrefz', '', 'identifier')
    if self.isfnarrmember(self.token()) :
      self.fnarrmember()
    if self.token().lexeme == '.' :
      self.memberrefz()
    #member_refz::= "." identifier [ fn_arr_member ] [ member_refz ]

  def expression(self) :
    t = self.token()
    if t.lexeme == '(' :
      self.tkgen.next()
      self.expression()
      if self.token().lexeme == ')' :
        self.tkgen.next()
      else :
        self.generror('expression', '', 'symbol', ')')
    elif t.lexeme == 'true' :
      self.tkgen.next()
    elif t.lexeme == 'false' :
      self.tkgen.next()
    elif t.lexeme == 'null' :
      self.tkgen.next()
    elif t.lexeme == 'this' :
      self.tkgen.next()
      if self.token().lexeme == '.' :
        self.memberrefz()
      return
    elif t.type == 'number' :
      sid = self.symtab.insert(t, 'ilit', symtable.data(type='int', returntype='int', param=None, accessmod='public'), scope='g')
      if self.semcheck :
        semantic.lpush(self.symtab.get(sid))
      self.tkgen.next()
    elif t.type == 'character' :
      sid = self.symtab.insert(t, 'clit', symtable.data(type='char', returntype='char', param=None, accessmod='public'), scope='g')
      if self.semcheck :
        semantic.lpush(self.symtab.get(sid))
      self.tkgen.next()
    elif t.type == 'identifier' :
      if self.semcheck :
        semantic.ipush(t)
        success = semantic.iexist(self.symtab)
        if not success[0] :
          self.gensemerror(success[1])
      self.tkgen.next()
      if self.isfnarrmember(self.token()) :
        self.fnarrmember()
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
        self.tkgen.next()
      else :
        self.generror("assignmentexpression", '', 'type or classname')
      self.newdeclaration()
    elif self.token().lexeme == 'atoi' :
      self.tkgen.next()
      if t.lexeme == '(' :
        self.tkgen.next()
      else :
        self.generror('assignmentexpression', '', 'symbol', '(')
      self.expression()
      if self.token().lexeme == ')' :
        self.tkgen.next()
      else :
        self.generror('assignmentexpression', '', 'symbol', ')')
    elif self.token().lexeme == 'itoa' :
      self.tkgen.next()
      if t.lexeme == '(' :
        self.tkgen.next()
      else :
        self.generror('assignmentexpression', '', 'symbol', '(')
      self.expression()
      if self.token().lexeme == ')' :
        self.tkgen.next()
      else :
        self.generror('assignmentexpression', '', 'symbol', ')')
    else :
      self.generror('assignmentexpression', '', 'expression or keyword', 'new atoi itoa')
    #'assignment_expression::= expression | \"new\" type new_declaration | \"atoi\" \"(\" expression \")\" | \"itoa\" \"(\" expression \")\"'
    
  def variabledeclaration(self) :
    if self.token().type == 'type' or self.token().type == 'identifier' :
      typ = self.token().lexeme
      self.tkgen.next()
    else :
      self.generror('variabledeclaration', '', '\'type\' or classname')
    if self.token().type == 'identifier' :
      t = self.token()
      self.tkgen.next()
    else :
      self.generror('variabledeclaration', '', 'identifier')
    if self.token().lexeme == '[' :
      self.symtab.insert(t, 'lvar', symtable.data(type='@:'+ typ, returntype='@:'+typ, param=None, accessmod='private'))
      self.tkgen.next()
      if self.token().lexeme == ']' :
        self.tkgen.next()
      else :
        self.generror('variabledeclaration', '', 'symbol', ']')
    else :
      self.symtab.insert(t, 'lvar', symtable.data(type=typ, returntype=typ, param=None, accessmod='private'))
    if self.token().lexeme == '=' :
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
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'symbol', '(')
      self.expression()
      if self.token().lexeme == ')' :
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'symbol', ')')
      self.statement()
      if self.token().lexeme == 'else' :
        self.tkgen.next()
        self.statement
    elif t.lexeme == 'while' :
      self.tkgen.next()
      if self.token().lexeme == '(' :
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'symbol', '(')
      self.expression()
      if self.token().lexeme == ')' :
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'symbol', ')')
      self.statement()
    elif t.lexeme == 'return' :
      self.tkgen.next()
      if self.isexpression(self.token()) : #if its an expression
        self.expression()
      self.eoe('statement')
      return
    elif t.lexeme == 'cout' :
      self.tkgen.next()
      if self.token().lexeme == '<<' :
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'symbol', '<<')
      self.expression()
      self.eoe('statement')
      return
    elif t.lexeme == 'cin' :
      self.tkgen.next()
      if self.token().lexeme == '>>' :
        self.tkgen.next()
      else :
        self.generror('', 'statement', 'symbol', '>>')
      self.expression()
      self.eoe('statement')
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
      self.tkgen.next()
    else :
      self.generror('declaration', 'methodbody', 'symbol', '}')
  
  def classname(self) :
    if self.token().type == 'identifier' :
      classname = self.token().lexeme
      self.classnames.append(classname)
      self.symtab.insert(self.token(), 'class')
      self.tkgen.next()
      return classname
    else :
      self.generror('name', 'classname', 'identifier')

  def constructordeclaration(self) :
    if self.token().type == 'identifier' :
      t = self.token()
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
    self.symtab.insert(t, 'xtor', symtable.data(type='method', returntype=t.lexeme, param=param, accessmod='public'))
    self.symtab.scoper(t.lexeme)
    self.methodbody()
    self.symtab.scoper()

  def parameter(self) :
    if self.token().type == 'type' or self.token().type == 'identifier' :
      typ = self.token().lexeme
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
        self.symtab.insert(t, 'method', symtable.data('method', typ, param, mod))
        self.tkgen.next()
      else :
        self.generror('declaration', 'field_declaration', 'symbol', ')')
      self.symtab.scoper(t.lexeme)
      self.methodbody()
      self.symtab.scoper()
      return
    self.symtab.insert(t, 'ivar', symtable.data(typ, typ, None, mod))
    if self.token().lexeme == '[' :
      self.tkgen.next()
      if self.token().lexeme == ']' :
        self.tkgen.next()
      else :
        self.generror('declaration', 'field_declaration', 'symbol', ']')
      if self.token().lexeme == '=' :
        self.tkgen.next()
        self.assignmentexpression()
      self.eoe('field_declaration')
      return
    if self.token().lexeme == '=' :
      self.tkgen.next()
      self.assignmentexpression()
      self.eoe('field_declaration')
      return
    self.eoe('field_declaration')

  def classmemberdeclaration(self) :
    if self.token().type == 'modifier' :
      mod = self.token().lexeme
      self.tkgen.next()
    elif self.token().type == 'identifier' :
      self.constructordeclaration()
      return
    else :
      self.generror('declaration', 'class_member_declaration', 'modifier')
    if self.token().type == 'type' or self.token().type == 'identifier' :
      typ = self.token().lexeme
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
    cname = self.classname()
    if self.token().lexeme == '{' :
      self.symtab.scoper(cname)
      self.tkgen.next()
    else :
      self.generror('declaration', 'class_declaration', 'symbol', '{')
    while self.token().lexeme != '}' :
      self.classmemberdeclaration()
    if self.token().lexeme == '}' :
      self.symtab.scoper()
      self.tkgen.next()
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
      self.symtab.insert(self.token(), 'main', symtable.data(None, returntype='void', param=[], accessmod='public'))
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
    self.methodbody()
    self.symtab.scoper()
    if self.token().type != 'EOF' :
      self.generror('compilation_unit', '', 'EOF', '')

  def run(self) :
    self.compilationunit()
    if self.token().type == 'EOF' :
      del self.lexer 
    self.semcheck = True
    self.symtab.isfull = True
    self.lexer = lexer.lexer(self.thefilename, False)
    self.token = self.lexer.getToken
    self.tkgen = self.lexer.tokengenerator
    self.nexttoken = self.lexer.getNext
    semantic.symtab = self.symtab
    self.compilationunit()

if __name__ == '__main__' :
  import sys
  if len(sys.argv) > 1 :
    fname = sys.argv[1]
  else :
    fname = 'test.kxi'

  #analyzer = lexer.lexer(fname)#
  #token = analyzer.tokengenerator
  #getToken = analyzer.getToken
  syntax = syntaxer(fname, False, False)
  syntax.run()
  #while token.next() :
  #  getToken(debug)
  #analyzer.getToken(debug)
  #token.close()


    #if 

