class Restuarant:

    reservation = []

    def __init__(self, menu_items: list, book_table, customer_order: list = []):
        self.menu_items = menu_items
        self.book_table = book_table
        self.customer_order = customer_order
        Restuarant.reservation.append(self.book_table)

    def add_item_to_menu(self, item):
        self.menu_items.append(item)

    def add_order(self, item):
        self.customer_order.append(item)

    def print_menu(self):
        for i in self.menu_items:
            print(i)

    def print_order(self):
        for i in self.customer_order:
            print(i)

    def print_reservations(self):
        print(Restuarant.reservation)


menu = ["apple", "bannana", "burger",
        "pizza", "rice", "coke", "water", "pasta"]


def take_order(table: Restuarant):
    order = input("Add to order: ")
    while order != "":
        table.add_order(order)
        order = input("Add to order: ")


table = Restuarant(menu, "A 1")
table2 = Restuarant(menu, "A 2")

take_order(table)
table.print_order()
