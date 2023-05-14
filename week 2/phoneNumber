
number = input("Enter phone number (xxx)xxx-xxxx : ")
valid = len(number) == 13
position = 0
while valid and position < len(number):
    if position == 0:
        valid = number[position] == "("
    elif position == 4:
        valid = number[position] == ")"
    elif position == 8:
        valid = number[position] == "-"
    else:
        valid = number[position].isdigit()
    position += 1

if valid:
    print("Valid")
else:
    print("Invalid")
