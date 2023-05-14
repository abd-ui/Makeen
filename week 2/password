string = input("Enter password : ")

valid = len(string) >= 8
upper = 0
lower = 0
num = 0
char = 0

for i in string:
    if i.islower():
        lower += 1
    elif i.isupper():
        upper += 1
    elif i.isdigit():
        num += 1
    elif i in "[@$#_]":
        char += 1
    else:
        valid = False

if upper > 0 and lower > 0 and num > 0 and char > 0 and valid:
    print("Valid")
else:
    print("Invalid")
