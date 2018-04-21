from array import array

def recursion(arg):
	if arg != 0:
		recursion(arg/10)
	print arg%10
recursion(1993)

def is_num(q):
	t = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
	if t.count(q) != 0:
		return 1
	else:
		return 0

def filefun():
	arg2 = open('/home/mark/classwork/bairasheva/stl2/in.txt', 'r')
	buf = []
	s = array('c')
	tmp = 0
	for char in arg2.read():
		if char == '+':
			while len(buf) > 0:
				tmp += int( buf[0].tostring() )
				buf.pop(0)
			print "DBG:+ tmp = ", tmp
		elif char == '-':
			while len(buf) > 0:
				tmp -= int( buf[0].tostring() )
				buf.pop(0)
			print "DBG:- tmp = ", tmp
		elif char == '*':
			while len(buf) > 0:
				tmp *= int( buf[0].tostring() )
				buf.pop(0)
			print "DBG:* tmp = ", tmp
		else:
			if is_num(char) == 1:
				s.append(char)
			elif len(s) != 0:
				buf.append(s)
				del s
				s = array('c')
	print "Result = ", tmp
	arg2.close()
filefun()