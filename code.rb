require 'json'
class Person
    attr_accessor :name, :last_name, :code, :salary
    def initialize(name,last_name,code,salary)
        @name = name
        @last_name = last_name
        @code = code
        @salary = salary
    end
end

class Employee < Person
    #attr_writer :name, last_name
    #attr_reader :name, last_name
    attr_accessor :name, :last_name, :code,:salary
    def initialize(name,last_name,code,salary,number)
        super(name,last_name,code,salary)
        @number = number
    end
    #def name
        #@name
    #end
    #def name=(name)
        #@name = name
    #end
end


class Employer < Person
    attr_accessor :name, :last_name, :code,:salary
    def initialize(name,last_name,code,salary,email)
        super(name,last_name,code, salary)
        @email = email
    end
end
class Manager
           
def read_employees
    file = File.read('employee.json')
    data_hash = JSON.parse(file)
    employees = Array.new 
    l = data_hash.length-1
    for n in 0..l
        employee = Employee.new(data_hash[n]['first_name'],data_hash[n]['last_name'],data_hash[n]['code'],data_hash[n]['salary'],data_hash[n]['number'])
        employees.append(employee)
    end
    return employees
end
def read_employers
    file = File.read('employer.json')
    data_hash = JSON.parse(file)
    employers = Array.new 
    l = data_hash.length-1
    for n in 0..l
        employer = Employee.new(data_hash[n]['first_name'],data_hash[n]['last_name'],data_hash[n]['code'],data_hash[n]['salary'],data_hash[n]['email'])
        employers.append(employer)
    end
    return employers
end

def salaries
    employers = read_employers()
    employees = read_employees()
    salaries = Array.new
    for n in 0..employers.length-1
        salaries.append(employers[n].salary)
    end
    for n in 0..employees.length-1
        salaries.append(employees[n].salary)
    end
    return salaries
end


end

class Statistics
    def average_salary(array)
        total = 0
        for i in 0..array.length-1
            total+= array[i]
        end
        return total / array.length
    end
    def max_salary(array)
        max =array[0]
        for i in 1..array.length-1
            if max < array[i]
                max = array[i]
            end
        end
        return max
    end
    def min_salary(array)
        min =array[0]
        for i in 1..array.length-1
            if min > array[i]
                min = array[i]
            end
        end
        return min
    end
    def median(array)
        return array[array.length/2]
    end
end
manager = Manager.new
statistician = Statistics.new
puts statistician.average_salary(manager.salaries)
puts statistician.max_salary(manager.salaries)
puts statistician.min_salary(manager.salaries)
puts statistician.median(manager.salaries.sort)