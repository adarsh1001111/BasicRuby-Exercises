# Company class to sttore the employees in the company in an employee table
class Company
  attr_accessor :employee_table
  def initialize
    @employee_table = []
  end

  def store(emp)
    employee_table << emp
  end

  def hash_get_emp
    hash = employee_table.group_by(&:designation)
    hash.sort
  end
end
# Employee class to store Employee's info
class Employee
  attr_accessor :designation, :name, :emp_id
  def initialize(designation, emp_id, name)
    @designation = designation
    @emp_id = emp_id
    @name = name
  end
end
company = Company.new
File.foreach('Test.txt') do |line|
  name, emp_id, designation = line.strip.split(',')
  company.store(Employee.new(designation, emp_id, name))
end
File.open('Test2.txt', 'w') do |file|
  company.hash_get_emp.each do |designation, employees|
    heading = employees.size > 1 ? "#{designation}s" : designation
    file.puts(heading.strip)
    employees.each do |emp|
      file.puts("#{emp.name} (EmpId: #{emp.emp_id})")
    end
    file.puts
  end
end