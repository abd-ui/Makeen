def index_of_smallest_element(list):

    smallest_element = min(list)
    smallest_index = list.index(smallest_element)
    return smallest_index


numbers = []
for i in range(10):
    number = int(input("Enter a number: "))
    numbers.append(number)
smallest_index = index_of_smallest_element(numbers)
print("The smallest element is at index {}.".format(smallest_index))


# print hello
