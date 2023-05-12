a = input("a = ")
b = input("b = ")
c = input("c = ")

num = [a, b, c]
num.sort()

if a == b or b == c or c == a:
    print("Entered numbers are equal")
else:
    print(num[2])
