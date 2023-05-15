# def sumDigits(x):
#     num = str(x)
#     total = 0
#     for i in num:
#         total += int(i)
#     print(total)

def sumDigits(x):
    if x == 0:
        return 0
    numbers = []
    while x > 0:
        numbers.append(x % 10)
        x = x // 10
    return (sum(numbers))


sumDigits(2345)
