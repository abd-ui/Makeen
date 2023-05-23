class BankAccount:

    accounts = {}

    def __init__(self, account_number, balance, date_of_opening, customer_name):
        self.account_number = account_number
        self.balance = balance
        self.date_of_opening = date_of_opening
        self.customer_name = customer_name
        BankAccount.accounts[self.account_number] = self.customer_name, self.date_of_opening, self.balance

    def deposit(self, amount):
        self.balance += amount

    def withdraw(self, amount):
        if self.balance < amount:
            print("Insufficint funds")
        else:
            self.balance -= amount

    def check_balance(self):
        return self.balance

    def print_details(self):
        print("Account number:", self.account_number)
        print("Customer name:", self.customer_name)
        print("Balance:", self.balance)
        print("Date of open:", self.date_of_opening)


x = BankAccount("01", 0, "04-05-2022", "abdullah")
y = BankAccount("02", 0, "19-07-2020", "muaeen")
z = BankAccount("03", 0, "28-01-2023", "ahmed")

print(BankAccount.accounts["02"])

x.deposit(300)
x.withdraw(400)
print(x.check_balance())
