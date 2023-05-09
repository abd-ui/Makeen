from math import *

i = 1
v = int(input("Number of vectors: "))
point1 = []
point2 = []

# to get the max and min y value
y_values = []
while i <= v:
    print("Enter Coordinates for S", str(i))

    x1 = int(input("x1 = "))
    point1.append(x1)
    y1 = int(input("y1 = "))
    point1.append(y1)
    y_values.append(y1)
    x2 = int(input("x2 = "))
    point2.append(x2)
    y2 = int(input("y2 = "))
    point2.append(y2)
    y_values.append(y2)

    # calculte distance
    distance = sqrt(((point1[0]-point2[0])**2)+((point1[1]-point2[1])**2))
    print("Distance is : ", str("%.2f" % distance))

# calculate scope
    def slope(x1, y1, x2, y2):
        if (x2 - x1 != 0):
            return round((float)(y2-y1)/(x2-x1), 1)

    print("Slope is : ", str(slope(x1, y1, x2, y2)))

# reset points
    point1 = []
    point2 = []

# incerment i
    i += 1

y_values.sort()
min_y = y_values[0]
max_y = y_values[len(y_values)-1]

print(" Y max : ", str(max_y))
print(" Y min : ", str(min_y))
