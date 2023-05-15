for i in range(8):
    x = str(" " * int((16 - 2*i)))
    print(x, end=" ")
    for j in range(i):
        print(2**j, end=" ")
    for j in range(i, -1, -1):
        print(2**j, end=" ")
    print()
