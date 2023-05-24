import random
import time
import threading


class Customer:
    def __init__(self, name, processing_time):
        self.name = name
        self.processing_time = processing_time

    def __str__(self):
        return self.name


customers = []
for i in range(10):
    processing_time = random.randint(1, 5)
    customers.insert(0, Customer("Customer " + str(i + 1), processing_time))


def employee1(customers):
    while customers:
        customer = customers.pop()
        print("employee1 is serving " +
              customer.name + " for " + str(customer.processing_time) + " seconds\n")
        time.sleep(customer.processing_time)


def employee2(customers):
    while customers:
        customer = customers.pop()
        print("employee2 is serving " +
              customer.name + " for " + str(customer.processing_time) + " seconds\n")
        time.sleep(customer.processing_time)


def employee3(customers):
    while customers:
        customer = customers.pop()
        print("employee3 is serving " +
              customer.name + " for " + str(customer.processing_time) + " seconds\n")
        time.sleep(customer.processing_time)


x = threading.Thread(target=employee1, args=(customers,))
x.start()
y = threading.Thread(target=employee2, args=(customers,))
y.start()
z = threading.Thread(target=employee3, args=(customers,))
z.start()


x.join()
y.join()
z.join()


print("All customers has been served")
print(threading.active_count())
print(threading.enumerate())
print(time.perf_counter())
