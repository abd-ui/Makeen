from math import *

i = 1
v = int(input("Number of vectors: "))
point1 = []
point2 = []
while i <= v:
    print("Enter Coord for S", str(i))
    x1 = int(input("x1 = "))
    point1.append(x1)
    y1 = int(input("y1 = "))
    point1.append(y1)
    x2 = int(input("x2 = "))
    point2.append(x2)
    y2 = int(input("y2 = "))
    point2.append(y2)

    distance = sqrt(((point1[0]-point2[0])**2)+((point1[1]-point2[1])**2))
    print(distance)

    i += 1
