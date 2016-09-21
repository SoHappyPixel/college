# 1.- Count the number of items in a list with the result in a dictionary.
l = ["a","b","c","d","d","a","d"]
for i in l:
    c[i] = l.count(i)
print c

# 2.- Print only odd numbers.
for i in range(1,10):
    if i%2==1:
        print i

# 3.- Answers to: py args.py 34,67,55,33,12,98 / AND /  py args.py 23 24 22
import sys
if (len(sys.argv)>2):
    li=[]
    for num in sys.argv[1:]:
        li.append(num)
else:
    li=sys.argv[1].split(".")
print li
print tuple(li)

# 4.- Compute word frequency of a text file and print it ordered.
import sys
words = open(sys.argv[1]).read().split()
freq={}
for w in words:
    freq.update({w:words.count(w)})
for i in sorted(freq.iterkeys()) :
    print i,freq[i]

# 5.- Matrix from file. / block read & numpy /
import sys
def mat_calc(matrix):
    for l in matrix:
        for n in l.split():
            yield int(n)
with open(sys.argv[1]) as matrix: # add EOF while
    print mat_calc(matrix).next() * 2
    print mat_calc(matrix).next() * 2

# 6.- A list whose elements are square of numbers.
import matplotlib.pyplot as plt
f = lambda y: y * y
sqr = map(f,range(1,21))
plt.plot(range(1,21),sqr)
plt.show()

# 7.- Permutations.
import itertools
print([x for x in itertools.permutations('1234')]) # on a tuple.
print map("".join, itertools.permutations('1234')) # on a string.

# 8.- Define a class which has at least two methods.
class ocho:
    def __init__(self):
        self.cadena=''
    def getString(self):
        self.cadena = raw_input("Your desires are orders to me:  ")
    def printString(self):
        print "Here's your sentence:  {cadena}".format(cadena=self.cadena)
oct = ocho()
oct.getString()
oct.printString()

# 9.- A game of roulette.
import random
from datetime import datetime

random.seed(datetime.now())
user_num = ''

while True :
    user_num = raw_input("Tell me a number:  ")
    if user_num == 'q':
        print "\nSe acabo el programa"
        exit()
    elif user_num.isdigit() :
        roulette = random.randint(0,9)
        if int(user_num) == roulette :
            print "R: {r} | Y: {y}. You win! :D".format(r=roulette,y=user_num)
        else :
            print "R: {r} | Y: {y}. You lose! :(".format(r=roulette,y=user_num)
    else :
        print "Haha! Nice try but... Try again."

# 10.-
