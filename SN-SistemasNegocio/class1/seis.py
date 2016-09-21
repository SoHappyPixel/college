import matplotlib.pyplot as plt
f = lambda y: y * y
sqr = map(f,range(1,21))
plt.plot(range(1,21),sqr)
plt.show()
