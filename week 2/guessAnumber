from random import *

valid = True
x = randint(1, 100)

while valid:
    guess = int(input("Enter a number between 1 and 100 : "))

    if guess > 100:
        print("Over 100")
    else:
        if guess > x:
            print("Go lower")
        elif guess < x:
            print("Go higher")
        else:
            print("Congrats!!")
            valid = False
