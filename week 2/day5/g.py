infile = open("g.txt")

data = []
for line in infile:
    line = line.strip()
    data.append(line.split())

for i in data:
    n = int(i[0])
    x = int(i[1])
    y = int(i[2])
    time = n * x
    if y > time:
        print("YES")
    else:
        print("NO")

infile.close()
