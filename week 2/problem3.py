arr = [2, 1, 6, 9]

sumOfArr = sum(arr)

x = []
y = arr.copy()
valid = sumOfArr % 2 == 0

if valid:
    arr.sort()
    for i in arr:
        x.append(i)
        y.remove(i)
        if sum(x) == (sumOfArr/2):
            break

if valid:
    print(x, y)
else:
    print(valid)
