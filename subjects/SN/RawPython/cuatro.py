import sys
words = open(sys.argv[1]).read().split()
freq={}
for w in words:
    freq.update({w:words.count(w)})
for i in sorted(freq.iterkeys()) :
    print i,freq[i]
