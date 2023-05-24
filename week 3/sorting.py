
def bubble_sort(list):

    n = len(list)
    for i in range(n - 1):
        for j in range(n - i - 1):
            if list[j] > list[j + 1]:
                list[j], list[j + 1] = list[j + 1], list[j]
    return list


def selection_sort(list):

    n = len(list)
    for i in range(n - 1):
        min_index = i
        for j in range(i + 1, n):
            if list[j] < list[min_index]:
                min_index = j
        list[i], list[min_index] = list[min_index], list[i]
    return list


def merge_sort(list):

    if len(list) <= 1:
        return list

    middle = len(list) // 2
    left = merge_sort(list[:middle])
    right = merge_sort(list[middle:])

    return merge(left, right)


def merge(left, right):

    result = []
    i = 0
    j = 0

    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1

    while i < len(left):
        result.append(left[i])
        i += 1

    while j < len(right):
        result.append(right[j])
        j += 1

    return result


cont = "y"
while cont.upper() == "Y":
    lst = input("Please enter a list of numbers, separated by spaces: ").split()
    sort = int(input(
        "select an algorithm to sort the list 1 or 2 or 3.\n 1. bubble sort \n 2. selection sort \n3. merge sort"))
    if sort == 1:
        print("Bubble sort")
        print(bubble_sort(lst))
    elif sort == 2:
        print("Selection sort")
        print(selection_sort(lst))
    elif sort == 3:
        print("Merge sort")
        print(merge_sort(lst))
    else:
        print("Enter correct option")

    cont = input("Do you want to continue? (y): ")
