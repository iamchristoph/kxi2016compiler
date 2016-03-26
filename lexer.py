# Lexical analyzer

import re
from collections import namedtuple

class lexer :
  token = namedtuple('token', ['lexeme', 'type', 'line', 'bit'])
  keywords = ('atoi','bool', 'class', 'char', 'cin', 'cout', 'else', 'false', 'if', 'int',
    'itoa', 'main', 'new', 'null','object', 'public', 'private', 'return', 'string', 'this', 
    'true', 'void', 'while', 'spawn', 'lock', 'release', 'block', 'sym', 'kxi2016', 'protected', 
    'unprotected', 'and', 'or')
  types = ('int', 'char', 'bool', 'void', 'sym')
  modifiers = ('public', 'private')
  whitespace = re.compile(r'[\s]')
  numbers = re.compile(r'[+-]*\d+')
  characters = re.compile(r'\'[\w\d]\'|\'\\[nabrtfvx0]\'|\'\s\'')
  identifiers = re.compile(r'[\w]+[\w\d]*')
  punctuation = re.compile(r'[.,;:?!\'"]')
  symbols = re.compile(r'!=|==|>=|<=|<<|>>|[][\](){}+-/*<>=]')
  comment = re.compile(r'//.*')
  wasvalid = False

  def __init__(self, fn, d=False) :
    self.file = open(fn, 'r')
    self.tokens = []
    self.curline = ''
    self.curtoken = ()
    self.nexttoken = ()
    self.line = 0
    self.bit = 0
    self.tokengenerator = self.nextToken()
    self.tokengenerator.next()
    self.tokengenerator.next()
    self.debug = d

  def getLine(self) :
    pass
    
  def nextToken(self) :
    self.line = 0
    for line in self.file :
      self.bit = 0
      self.line += 1
      while self.bit < len(line) :
        token = self.parseToken(line[self.bit:])
        if token :
          self.bit += len(token.lexeme)
          self.tokens.append(token)
          self.curtoken = self.nexttoken
          self.nexttoken = token
          yield True
        else :
          self.bit += 1
    self.curtoken = self.nexttoken
    self.nexttoken = lexer.token('EOF','EOF', self.line, self.bit)    
    yield True
    self.curtoken = self.nexttoken  
    yield False
  def getToken(self, d=False) :
    if self.debug :
      print 'current: ', self.curtoken.line, '\t', self.curtoken.type , '   \t', self.curtoken.lexeme
      print 'next: ', self.nexttoken.line, '\t', self.nexttoken.type , '   \t', self.nexttoken.lexeme
    return self.curtoken  
  def getNext(self, d=False) :
    if self.debug :
      print self.nexttoken.line, '\t', self.nexttoken.type , '   \t', self.nexttoken.lexeme
    return self.nexttoken  
  def parseToken(self, s) :
    if lexer.comment.match(s) :
      self.bit += len(lexer.comment.match(s).group(0))
      return None
    elif lexer.whitespace.match(s) :
      return None
    elif lexer.numbers.match(s) :
      m = lexer.numbers.match(s).group(0)
      return lexer.token(m, 'number', self.line, self.bit)
    elif lexer.characters.match(s) :
      m = lexer.characters.match(s).group(0)
      return lexer.token(m, 'character', self.line, self.bit)
    elif lexer.identifiers.match(s) :
      m = lexer.identifiers.match(s).group(0)
      if m in lexer.keywords :
        if m in lexer.types :
          return lexer.token(m, 'type', self.line, self.bit)
        if m in lexer.modifiers :
          return lexer.token(m, 'modifier', self.line, self.bit)
        return lexer.token(m, 'keyword', self.line, self.bit)
      return lexer.token(m, 'identifier', self.line, self.bit)
    elif lexer.symbols.match(s) :
      m = lexer.symbols.match(s).group(0)
      return lexer.token(m, 'symbol', self.line, self.bit)
    elif lexer.punctuation.match(s) :
      m = lexer.punctuation.match(s).group(0)
      return lexer.token(m, 'punctuation', self.line, self.bit)
    else :
      return lexer.token(s[0], 'unknown', self.line, self.bit)


if __name__ == '__main__' :
  import sys
  if len(sys.argv) > 1 :
    fname = sys.argv[1]
  else :
    fname = 'test.kxi'
  analyzer = lexer(fname, 1)#
  token = analyzer.tokengenerator
  getToken = analyzer.getToken
  #syntax = syntaxer(fname, debug)
  #syntax.compilationunit()
  while token.next() :
    getToken()
  analyzer.getToken()
  token.close()


    #if 
