from math import *

h = 4
r = 6

volume = h*pi*(r**2)
area = round(2*pi*r*(r+h))

print("Heigth of cylinder: ", str(h))
print("Radius of cylnider: ", str(r))
print("Volume is: ", str("%.2f" % volume))
print("Surface area is: ", str("%.2f" % area))
