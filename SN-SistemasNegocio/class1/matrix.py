import sys
def mat_calc(matrix):
    for l in matrix:
        for n in l.split():
            yield int(n)
with open(sys.argv[1]) as matrix:
    print mat_calc(matrix).next() * 2
    print mat_calc(matrix).next() * 2
