def eliminate_duplicates(list):

    new_list = []
    for number in list:
        if number not in new_list:
            new_list.append(number)
    return new_list


numbers = []
for i in range(10):
    number = int(input("Enter a number: "))
    numbers.append(number)
new_list = eliminate_duplicates(numbers)
print("The distinct numbers are: {}".format(new_list))
