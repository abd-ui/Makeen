import random
import time
import threading
import signal
import sys


signal.alarm(30)


class Customer:
    def __init__(self, name, processing_time):
        self.name = name
        self.processing_time = processing_time

    def __str__(self):
        return self.name


customers = []


def add_customers(customers):
    i = 0
    while True:
        processing_time = random.randint(1, 10)
        customers.insert(0, Customer(
            "Customer " + str(i + 1), processing_time))
        time.sleep(random.randint(1, 10))
        i += 1


def employee1(customers):
    while True:
        while customers:
            customer = customers.pop()
            print("employee1 is serving " +
                  customer.name + " for " + str(customer.processing_time) + " seconds\n")
            time.sleep(customer.processing_time)


def employee2(customers):
    while True:
        while customers:
            customer = customers.pop()
            print("employee2 is serving " +
                  customer.name + " for " + str(customer.processing_time) + " seconds\n")
            time.sleep(customer.processing_time)


def employee3(customers):
    while True:
        while customers:
            customer = customers.pop()
            print("employee3 is serving " +
                  customer.name + " for " + str(customer.processing_time) + " seconds\n")
            time.sleep(customer.processing_time)


a = threading.Thread(target=add_customers, args=(customers,))
a.start()
x = threading.Thread(target=employee1, args=(customers,))
x.start()
y = threading.Thread(target=employee2, args=(customers,))
y.start()
z = threading.Thread(target=employee3, args=(customers,))
z.start()

a.join()
x.join()
y.join()
z.join()


print("All customers has been served")
print(threading.active_count())
print(threading.enumerate())
print(time.perf_counter())
