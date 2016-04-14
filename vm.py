#Project 1

from struct import *
import sys

MEM_SIZE = 2**20
OFFSET = 13
OFFSET_STR = '13x'
Opcodes = {'TRP': 0, 'JMP': 1, 'JMR': 2, 'BNZ': 3, 'BGT': 4, 'BLT': 5, 'BRZ': 6, 'MOV': 7, 'LDA': 8, 'STR': 9, 'LDR': 10, 'STB': 11, 'LDB': 12, 'ADD': 13, 'ADI': 14, 'SUB': 15, 'MUL': 16, 'DIV': 17, 'AND': 18, 'OR': 19, 'CMP': 20 , 'RUN': 25, 'END': 26, 'BLK': 27, 'LCK': 28, 'ULK': 29}
Directives = {'.BYT': -1, '.INT': -2}
Registers = {'R0': 0, 'R1': 1, 'R2': 2, 'R3': 3, 'R4': 4, 'R5': 5, 'R6': 6, 'R7': 7, 'PC': 8, 'SL': 9, 'SP': 10, 'FP': 11, 'SB': 12}

class Assembler :
  def __init__(this) :
    pass
  def GetAssembly(this, fname) :
    this.SymbalTable = this.FirstPass(fname)
    this.mem = this.SecondPass(fname)
    return this.mem
  def FirstPass(this, fname) :
    symbals = {}
    i = OFFSET # start OFFSET bytes in to eliminate label conflicts with register for LDR etc. register indirect
    code = open(fname)
    for line in code :
      asm = line.split()
      if len(asm) > 0 :
        label = asm[0]
        if label in Opcodes : 
          if 'Start' not in symbals :
            symbals['Start'] = i
          i += 12
        elif label in Directives :
          if label == '.BYT' :
            i += 1
          else :
            i += 4
        elif label == ';' : # is comment ignore
          pass
        else :
          symbals[label] = i
          label = asm[1]
          if label in Opcodes : 
            i += 12
          elif label in Directives :
            if label == '.BYT' :
              i += 1
            else :
              i += 4
    if 'End' not in symbals :
      print i
      symbals['End'] = i
    return symbals
  def SecondPass(this, fname) :
    length = 0
    memory = bytearray()
    memory.extend(pack(OFFSET_STR))
    length += OFFSET #offset to avoid addressing conflict with registers
    code = open(fname)
    for line in code :
      asm = line.split()
      if len(asm) > 0 :
        instruction = this.GetInstruction(asm)
        if instruction :
          memory.extend(instruction)
          length += 12
    i = MEM_SIZE - length
    memory.extend(pack(''.join([str(i), 'x'])))
    return memory
  
  def GetInstruction(this, asm) :
    i = 0
    opcode = 0
    destination = 0
    source = 0
    label = asm[i]
    if debug :
      print asm
  # getting opcode or returning data if directive
    i += 1
    if label in this.SymbalTable :
      label = asm[i]
      i += 1
    if label in Opcodes :
      opcode = Opcodes.get(label)
    elif label in Directives :
      value = asm[i]
      if label == '.BYT' :
        value = asm[i].strip('\'')
        if value == '' :
          value = ' '
        if value.isdigit() :
          return pack('c', chr(int(value)))
        else : 
          return pack('c', value)
      else :
        return pack('i', int(value))
    elif label == ';' : # is comment
      return None
    else :
      print 'error expected Opcode or Directive, got: ', label, asm
      return None
    if opcode is 26 or opcode is 27 :
      return pack('iii', opcode, 0, 0)
    label = asm[i]
    i += 1

  # getting destination register
    if opcode is 0 :    # is trap return instruction with immediate value
      return pack('iii', opcode, int(label), 0)
    elif opcode is 1 or opcode is 28 or opcode is 29 or opcode is 25 :
      destination =  this.SymbalTable[label]
      return   pack('iii', opcode, destination, 0)
    elif opcode is 2 :
      destination = Registers.get(label)
      return pack('iii', opcode, destination, 0)
    elif label in Registers :
      destination = Registers.get(label)
    elif label in this.SymbalTable :
      destination = this.SymbalTable[label]
      return pack('iii', opcode, destination, 0)
    elif int(label) >= 0 and int(label) < 9 : # use immediate value as Register
      destination = int(label)
    else  : # destination is not valid
      print 'error expected Register or Immediate value, got: ', label
  # getting source
    label = asm[i].strip('()')
    if label in this.SymbalTable : # source is a label use its address
      source = this.SymbalTable[label]
      return pack('iii', opcode, destination, source)
    elif label in Registers : # source is a Register get register
      source = Registers[label]
      if opcode > 8 and opcode < 13 : # use register indirect opcode
        opcode += 12
      return pack('iii', opcode, destination, source)
    else : # use immediate value as
      source = int(label)
      if opcode > 8 and opcode < 13 : # use register indirect opcode
        opcode += 12
      return pack('iii', opcode, destination, source)
    #else  :
    #  print 'error expected Register or Label, got: ', label
    #  return None
  def GetStart(this) :
    return this.SymbalTable['Start'], this.SymbalTable['End']

PC, SL, SP, FP, SB = 8, 9, 10, 11, 12
step = 12
THREADS = 1
class VirtualMachine :
  def __init__(this, memory, keys) :
    this.Regs = {0: pack('4x'), 1: pack('4x'), 2: pack('4x'), 3: pack('4x'), 4: pack('4x'), 5: pack('4x'), 6: pack('4x'), 7: pack('4x'), PC: pack('4x'), SL: pack('4x'), SP: pack('4x'), FP: pack('4x'), SB: pack('4x')}
    this.mem = memory
    this.offset = len(this.Regs)*4
    this.stackbase =  len(memory) - OFFSET - this.offset
    this.Regs[SB] = pack('i', this.stackbase)
    this.Regs[SP] = pack('i', this.stackbase - 4)
    this.Regs[FP] = this.Regs[SP]
    this.Regs[PC], stacklimit = pack('i', keys[0]), keys[1]
    this.stacksize = (this.stackbase-stacklimit - this.offset)/THREADS
    this.Regs[SL] = pack('i', (this.stackbase - this.stacksize - this.offset))
    this.threads = {}
    for x in range(THREADS + 1) :
      this.threads[x] = False
    this.threads[0] = True

  def Run(this) :
    run = True
    this.threads[0] = True
    threadID=0
    newthread=-1
    this.storeThread(threadID)
    count = 0
    while run :
      #fetch
      count += 1
      this.restoreThread(threadID)
      pc,  = unpack('i', this.Regs[PC])
      opcode, destination, source = unpack('iii', this.mem[pc:pc+step])
      this.Regs[PC] = pack('i', pc + step)
      if debug :
        for k in Opcodes :
          if Opcodes[k] == opcode :
            o = k
        print '\nPC =', pc, '\n', o, destination, source, "ThreadID =", threadID
        print '\nR0 =', unpack('i', this.Regs[0])[0], 'R1 =', unpack('i', this.Regs[1])[0],'R2 =', unpack('i', this.Regs[2])[0], 'R3 =', unpack('i', this.Regs[3])[0], 'R4 =', unpack('i', this.Regs[4])[0]
        print 'R5 =', unpack('i', this.Regs[5])[0], 'R6 =', unpack('i', this.Regs[6])[0], 'R7 =', unpack('i', this.Regs[7])[0], 'PC =', unpack('i', this.Regs[PC])[0]
        print 'SP =', unpack('i', this.Regs[SP])[0], 'FP =', unpack('i', this.Regs[FP])[0], 'SL =', unpack('i', this.Regs[SL])[0], 'SB =', unpack('i', this.Regs[SB])[0]
          
      #decode
      if opcode is 0 : #trap TRP
        #print 'TRP', destination
        if destination is 0 :
          run = False
        elif destination is 1 : # write int
          sys.stdout.write(str(unpack('i', this.Regs[3])[0]))
        elif destination is 2 : # input int
          this.Regs[3] = pack('i', int(raw_input()))
        elif destination is 3 : # write char 
          c = chr(this.Regs[3][0])
          sys.stdout.write(c)
        elif destination is 4 : # read char
          this.Regs[3] = pack('cxxx', raw_input()[0])
        elif destination is 10 :
          this.Regs[3] = pack('cxxx', chr(unpack('i', this.Regs[3])))
        elif destination is 11 :
          this.Regs[3] = pack('i', int(unpack('c', this.Regs[3])))
        elif destination is 99 :
          print "tID =", threadID, opcode, destination, source
          print 'R0 =', unpack('i', this.Regs[0])[0], 'R1 =', unpack('i', this.Regs[1])[0], 'R2 =', unpack('i', this.Regs[2])[0], 'R3 =', unpack('i', this.Regs[3])[0], 'R4 =', unpack('i', this.Regs[4])[0]
          print 'R5 =', unpack('i', this.Regs[5])[0], 'R6 =', unpack('i', this.Regs[6])[0], 'R7 =', unpack('i', this.Regs[7])[0], 'PC =', unpack('i', this.Regs[PC])[0]
          print 'SP =', unpack('i', this.Regs[SP])[0], 'FP =', unpack('i', this.Regs[FP])[0], 'SL =', unpack('i', this.Regs[SL])[0], 'SB =', unpack('i', this.Regs[SB])[0]
          i, = unpack('i', this.Regs[FP])
          limit, = unpack('i', this.Regs[SP])
          print 'Stack: '
          fp = i
          while i >= limit :
            print 'FP', i - fp, ':' ,unpack('i', this.mem[i:i+4])[0]# unpack('c', this.mem[i:i+1])[0],
            i -= 4  
          print '\n'
      elif opcode is 1 : #jump JMP to label
        this.Regs[PC] = pack('i', destination)
      elif opcode is 2 : # JMR to register
        this.Regs[PC] = pack('i', unpack('i', this.Regs[destination][0:4])[0])
      elif opcode is 3 : # Branch BNZ to label if Register is not 0
        if unpack('i', this.Regs[destination])[0] != 0 :
          this.Regs[PC] = pack('i', source)
      elif opcode is 4 : # Branch BGT
        if unpack('i', this.Regs[destination])[0] > 0 :
          this.Regs[PC] = pack('i', source)
      elif opcode is 5 : # Brach BLT
        if unpack('i', this.Regs[destination])[0] < 0 :
          this.Regs[PC] = pack('i', source)
      elif opcode is 6 : # BRZ
        if unpack('i', this.Regs[destination])[0] == 0 :
          this.Regs[PC] = pack('i', source)
      elif opcode is 7 : # 'MOV'
        #print 'MOV', destination, source
        this.Regs[destination] = this.Regs[source]
      elif opcode is 8 : # 'LDA' 
        this.Regs[destination] = pack('i', source)
      elif opcode is 9 : # 'STR' stor int
        this.mem[source:source+4] = this.Regs[destination][0:4]
      elif opcode is 10 : # 'LDR'
        num, = unpack('i', this.mem[source:source+4])
        this.Regs[destination] = pack('i', num)
      elif opcode is 11 : # 'STB'
        this.mem[source:source+1] = this.Regs[destination][0:1]
      elif opcode is 12 : # 'LDB'
        this.Regs[destination] = pack('cxxx', unpack('c', this.mem[source:source + 1])[0])
      elif opcode is 13 : # 'ADD'
        #print 'ADD', destination, source
        this.Regs[destination] = pack('i', (unpack('i', this.Regs[destination])[0] + unpack('i', this.Regs[source])[0]))
      elif opcode is 14 : # 'ADI'
        this.Regs[destination] = pack('i', (unpack('i', this.Regs[destination])[0] + int(source)))
      elif opcode is 15 : # 'SUB'
        this.Regs[destination] = pack('i', (unpack('i', this.Regs[destination])[0] - unpack('i', this.Regs[source])[0]))
      elif opcode is 16 : # 'MUL'
        #print 'MUL', destination, source
        this.Regs[destination] = pack('i', (unpack('i', this.Regs[destination])[0] * unpack('i', this.Regs[source])[0]))
      elif opcode is 17 : # 'DIV'
        #print 'DIV', destination, source
        this.Regs[destination] = pack('i', (unpack('i', this.Regs[destination])[0] / unpack('i', this.Regs[source])[0]))
      elif opcode is 18 : # 'AND'
        if unpack('i', this.Regs[destination])[0] and unpack('i', this.Regs[source])[0] :
          this.Regs[destination] = pack('i', 1)
        else :
          this.Regs[destination] = pack('i', 0)
        #print 'AND', destination, source
      elif opcode is 19 : # 'OR'
        if unpack('i', this.Regs[destination])[0] or unpack('i', this.Regs[source])[0] :
          this.Regs[destination] = pack('i', 1)
        else :
          this.Regs[destination] = pack('i', 0)
        #print 'OR', destination, source
      elif opcode is 20 : # 'CMP'
        #print this.Regs, 'D: ', destination, 'S: ', source
        this.Regs[destination] = pack('i', (unpack('i', this.Regs[destination])[0] - unpack('i', this.Regs[source])[0]))
      elif opcode > 20 and opcode < 25:
        _address, = unpack('i', this.Regs[source])
        if opcode is 21 : # 'STR' stor int register indirect address
          num, = unpack('i', this.Regs[destination][0:4])
          #print "STR ", num, _address
          this.mem[_address:_address+4] = pack('i', num)
        elif opcode is 22 : # 'LDR' load int register indirect addressing
          num, = unpack('i', this.mem[_address:_address+4])
          #print 'LDR', num, _address
          this.Regs[destination] = pack('i', num)
        elif opcode is 23 : # 'STB' store byte register indirect addressing
          byte, = unpack('c', this.Regs[destination][0:1])
          #print 'Byte = ', byte, _address, pack('c', byte)
          this.mem[_address:_address+1] = pack('c', byte)
        elif opcode is 24 : # 'LDB' load byte register indirect addressing
          c, = unpack('c', this.mem[_address:_address+1])
          #print 'Byte = ', c, _address
          this.Regs[destination] = pack('cxxx', unpack('c', this.mem[_address:_address+1])[0])
      elif opcode is 25 : #  'RUN'
        newthread = this.nextID()
        if newthread > 0 :
          this.storeThread(threadID)
          this.Regs[4] = pack('i', newthread)
          this.threads[newthread] = True
          this.Regs[PC] = pack('i', destination)
          sbase = this.stackbase - this.stacksize*newthread
          slimit = sbase - this.stacksize - this.offset
          this.Regs[SB] = pack('i', sbase)
          this.Regs[SP] = pack('i', sbase - 4)
          this.Regs[FP] = this.Regs[SP]
          this.Regs[SL] = pack('i', slimit)
          #print this.Regs
          this.storeThread(newthread)
          this.restoreThread(threadID)
          #print 'spawning thread', newthread, 'with PC', destination
          newthread = -1
      elif opcode is 26 : # 'END'
        if threadID != 0 :
          this.threads[threadID] = False
          #print 'ending thread', threadID
      elif opcode is 27 : # 'BLK'
        if threadID is 0 :
          others = 0
          for b in this.threads :
            if this.threads[b] :
              others += 1
          if others > 1 :
            this.Regs[PC] = pack('i', pc)
            #print 'Waiting for threads to terminate'
      elif opcode is 28 : # 'LCK'
        lkID, = unpack('i', this.mem[destination:destination + 4])
        if lkID is -1 or lkID == threadID :
          this.mem[destination:destination+4] = pack('i', threadID)
          #print 'Getting lock for', threadID
        else :
          this.Regs[PC] = pack('i', pc)
          #print 'waiting for lock', lkID, "has it."
      elif opcode is 29 : # 'ULK'
        lkID, = unpack('i', this.mem[destination:destination + 4])
        if lkID is threadID :
          this.mem[destination:destination+4] = pack('i', -1)
          #print 'Unlocking for', threadID
      else :
        print "Line: ", count, "Error, Opcode not valid, got: ", opcode

      this.storeThread(threadID)
      threadID += 1

      

      
      while True :
        if threadID > THREADS : #putscheduler here
          threadID = 0
        elif this.threads[threadID] :
          break
        else :
          threadID += 1

  def nextID(this) :
    for x in range(1, THREADS) :
      if not this.threads[x] :
        return x
    return -1

  def storeThread(this, tID) :
    end = this.stackbase - this.stacksize*tID
    for i in range(len(this.Regs)) :
      this.mem[end:end+4] = this.Regs[i]
      end += 4

  def restoreThread(this, tID) :
    tstack = this.stackbase - this.stacksize*tID
    for i in range(len(this.Regs)) :
      this.Regs[i] = this.mem[tstack:tstack+4]
      tstack += 4

# Main

if len(sys.argv) > 1 :
  fname = sys.argv[1]
else :
  fname = 'proj3.asm'
if len(sys.argv) > 2 :
  debug = True
else:
  debug = False
code = open(fname)
assembler = Assembler()
mem = assembler.GetAssembly(fname)
vm = VirtualMachine(mem, assembler.GetStart())
vm.Run()



