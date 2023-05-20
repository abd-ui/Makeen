import random


point = None
while True:
    die1 = random.randint(1, 6)
    die2 = random.randint(1, 6)
    total = die1 + die2
    if total in (2, 3, 12):
        print("You rolled {} , {}".format(die1, die2))
        print("You lose.")
        break
    elif total in (7, 11):
        print("You rolled {} , {}".format(die1, die2))
        print("You win!")
        break
    elif point is None:
        point = total
        print("You rolled {} , {}".format(die1, die2))
        print("The point is {}.".format(point))
    else:
        if total == point:
            print("You rolled {} , {}".format(die1, die2))
            print("You win!")
            break
        elif total == 7:
            print("You rolled {} , {}".format(die1, die2))
            print("You lose.")
            break
