infile = open("c.txt")

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
# print(numbers)

#

for i in numbers:
    num = []
    rep = []
    for j in i[1]:
        if j in num:
            if j not in rep:
                rep.append(j)
        num.append(j)
    print(rep[1])

infile.close()
