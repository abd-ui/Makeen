infile = open("d.txt")

data = []
for line in infile:
    line = line.strip()
    data.append(line.split())

for i in data:
    x = int(i[0])
    n = int(i[1])
    y = int(i[2])
    space = n * y
    if x > space:
        print("YES")
    else:
        print("NO")

infile.close()
