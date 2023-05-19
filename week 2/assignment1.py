
amount = 10000
rate = 5

for i in range(10):
    amount = amount * (1 + rate / 100)

total = amount * 4

print("The tuition in ten years : ", amount)
print("The total cost of four years after ten years : ", total)
