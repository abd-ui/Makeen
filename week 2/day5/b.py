

infile = open("b.txt")

data = []
for line in infile:
    data.append(line.strip())

for i in data:
    for j in range(1, int(i)+1):
        if int(i) % j == 0:
            print(j, end=" ")
    print()

infile.close()
