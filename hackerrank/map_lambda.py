def cube(x): return x * x * x


def fibonacci(n):
    ar = [0, 1]
    if n < 2:
        return ar[:n]
    for i in range(2, n):
        ar.append(ar[i - 1] + ar[i - 2])
    return ar


if __name__ == "__main__":
    n = int(input())
    print(list(map(cube, fibonacci(n))))
