import random
import time
import threading

begin = time.time()


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
        end = time.time()
        if end-begin < 30:
            processing_time = random.randint(1, 5)
            customers.insert(0, Customer(
                "Customer " + str(i + 1), processing_time))
            time.sleep(processing_time)
            i += 1
        else:
            break


def employee1(customers):
    end = time.time()
    while end-begin < 30:
        end = time.time()
        while customers:
            customer = customers.pop()
            print("employee1 is serving " +
                  customer.name + " for " + str(customer.processing_time) + " seconds\n")
            time.sleep(customer.processing_time)


def employee2(customers):
    end = time.time()
    while end-begin < 30:
        end = time.time()
        while customers:
            customer = customers.pop()
            print("employee2 is serving " +
                  customer.name + " for " + str(customer.processing_time) + " seconds\n")
            time.sleep(customer.processing_time)


def employee3(customers):
    end = time.time()
    while end-begin < 30:
        end = time.time()
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


x.join()
y.join()
z.join()


print("All customers has been served")
print(time.time() - begin)
