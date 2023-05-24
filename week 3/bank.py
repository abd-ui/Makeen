import random
import time


class Customer:
    def __init__(self, name, processing_time):
        self.name = name
        self.processing_time = processing_time

    def __str__(self):
        return self.name


class Employee:
    def __init__(self, name):
        self.name = name
        self.is_busy = False

    def serve_customer(self, customer):
        print(self.name + " is serving " +
              customer.name + " for " + str(customer.processing_time) + " seconds")
        self.is_busy = True
        time.sleep(customer.processing_time)


customers = []

employees = [
    Employee("Employee 1"),
    Employee("Employee 2"),
    Employee("Employee 3"),
]


def check_all_employees(employees):
    busy = False
    for employee in employees:
        busy = employee.is_busy
    return busy


for i in range(10):
    processing_time = random.randint(1, 5)
    customers.insert(0, Customer("Customer " + str(i + 1), processing_time))

while customers:
    if not check_all_employees(employees):
        customer = customers.pop()

        for employee in employees:
            if not employee.is_busy:
                employee.serve_customer(customer)
                break
    else:
        for employee in employees:
            employee.is_busy = False

print("All customers have been served")
