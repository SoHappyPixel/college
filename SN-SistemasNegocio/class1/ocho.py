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
