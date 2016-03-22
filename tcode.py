tcode.py

def get(code) :
  if code[1] == 'FRAME' :
    return frame(code)
  elif code[1] == 'CALL' :
    return call(code)
  elif code[1] == 'STOP' :
    return stop(code)
  elif code[1] == 'FUNC' :
    return func(code)
    
