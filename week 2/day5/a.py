
infile = open("a.txt")

data = []
for line in infile:
    line = line.strip()
    item = line.split(":")
    data.append(item)

salary = 0
maxSalary = []

for i in data:
    if int(i[1]) > salary:
        maxSalary = i
    salary = int(i[1])

print(maxSalary[0], maxSalary[1])
infile.close()
