print "Preg1...\n\n"


print "A:\n"

c = {}
l = ['a','b','f','f','b','b']
print "lista = {}".format(l) 
for x in l:
    c[x] = l.count(x)
print "conteo = {}".format(c)
print "\n"


print "B:\n"

import numpy as np
with open('binum.txt') as f:
    lines = [[int(x) for x in line.split()] for line in f]
multiarray = np.array(lines)
print multiarray
