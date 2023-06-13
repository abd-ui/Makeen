def count_elements(lst):
    count = 0

    for i in lst:
        if isinstance(i, list):
            count += count_elements(i)
        else:
            count += 1 

    return count

print(count_elements([1,2,[3,[4,5,[6,7],8]],9]))
