print "Preg2...\n"

# imports
import random

# A
class Employee( object ):
    def __init__( self, first_name, last_name, staff_number ):
        self.first_name = first_name
        self.last_name = last_name
        self.staff_number = staff_number
    def GetEmployee( self ):
        return "This is: '{}, {}' with Staff Number: {}.".format(self.first_name,self.last_name,self.staff_number)

# B
def RandStaffNum():
    return random.randint(0,100)

E = []
a = Employee("Daniel", "Camba Lamas", RandStaffNum())
E.append(a)
b = Employee("Pepe", "Chiringo", RandStaffNum())
E.append(b)

for x in E:
    print x.GetEmployee()
