infile = open("h.txt")

#
data = []
for line in infile:
    line = line.strip()
    data.append(line.split())

#
numbers = []
for i in range(len(data)):
    if i % 2 == 0:
        numbers.append([data[i], data[i+1]])

for i in numbers:
    for j in i[1]:
        print(j[::-1], end=" ")
    print()


infile.close()
