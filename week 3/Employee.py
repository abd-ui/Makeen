class Employee:
    def __init__(self, emp_id, emp_name, emp_salary, emp_department):
        self.__emp_id = emp_id
        self.__emp_name = emp_name
        self.__emp_salary = emp_salary
        self.__emp_department = emp_department

    def calculate_salary(self, hour: float, emp_salary):
        overtime_amount = 0
        if hour > 50:
            overtime = hour - 50
            overtime_amount = (overtime*(emp_salary/50))
        return emp_salary + overtime_amount

    def assign_department(self, new_department):
        self.__emp_department = new_department

    def print_emp_details(self):
        print(self.__emp_id, self.__emp_name,
              self.__emp_salary, self.__emp_department)


e1 = Employee("abdu", "e001", 4500, "sales")
e2 = Employee("muaeen", "e002", 2000, "acounting")
e3 = Employee("ahmed", "e003", 3400, "marketing")
e4 = Employee("mohammed", "e004", 4000, "research")

print(e2.calculate_salary(67, 3000))
