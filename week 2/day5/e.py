import math
infile = open("e.txt")

data = []
for line in infile:
    line = line.strip()
    data.append(line.split())

for i in data:
    num1 = int(i[0])
    num2 = int(i[1])
    print(math.gcd(num1, num2))


infile.close()
