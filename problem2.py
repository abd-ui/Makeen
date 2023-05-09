i = 1
v = int(input("Number of vectors: "))
all_vetors = []

while i <= v:
    print("Enter Coord for S", str(i))
    x1 = input("x1 = ")
    y1 = input("y1 = ")
    x2 = input("x2 = ")
    y2 = input("y2 = ")

    name = f"S{i}"
    vector = [x1, y1, x2, y2]

    globals()[name] = vector
    print(" ")
    print(name, vector)
    print(" ")
    all_vetors.append(vector)

    i += 1
print(all_vetors)
