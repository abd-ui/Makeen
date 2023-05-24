from functools import reduce

lst = [1, 2, 3, 4]
sum_sqr = reduce(lambda total, num: total + num**2, lst, 0)
print(sum_sqr)
