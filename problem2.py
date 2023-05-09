i = 1
v = int(input("Number of vectors: "))

while i <= v:
    print("Enter Coord for S", str(i))
    x1 = input("x1 = ")
    y1 = input("y1 = ")
    x2 = input("x2 = ")
    y2 = input("y2 = ")

    Vectors = f"S{i}"
    vector = [x1, y1]

    globals()[Vectors] = vector
    print(Vectors, vector)

    i += 1
