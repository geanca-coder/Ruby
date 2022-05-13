#rb informativo acerca de la sintaxis de ruby
#Imprimir en consola
puts "Hello world"

#variables
puts "variables"
age = 34
name = "José Bermudez Blandón"
course = "Paradigmas de Programacion"
casado = false
heigth = 1.73
puts age.to_s+" "+name+" "+course+" "+casado.to_s+" "+heigth.to_s

#strings
puts "strings"
x = "Universidad Nacional de Costa Rica"
puts x.upcase()
puts x.downcase()
puts x.length()
puts x.include? "Nacional"
puts x[9]
puts x[0,10]
puts x.index("U")


#math
#basic operations
puts "Basic operations"
puts 5+3
puts 2/2
puts 2**2
puts 2*3
puts 5-2
puts 4%2
puts 5/2.0


puts "some methods"
num = 20.9
puts num.ceil()
puts num.floor()
puts num.round()
puts Math.sqrt(20)


#input del usuario por consola
puts "enter you name: "
name = gets.chomp()
puts "Age"
age = gets.chomp()
puts "Hello "+name+", you are cool"

#arrays
numbers = Array[1,2,3,4,5,65]
names = Array["Geancarlo","Frank","Oldemar","Diana"]
others = Array[numbers,names,"different datatypes"]
puts numbers
puts names
puts others

#array methods
puts "array methods"
puts numbers[0]
puts names[1,2] 
others[0,2]= "Paradigmas"
puts others
courses = Array.new #array vacio sin nada
courses[0] = 4
courses[1] = 1
puts courses
puts courses.sort()
puts courses.sort!
puts courses.reverse
puts courses.length()

#Hashes    
states ={
    :Pennysilvania => "PA",
    :New_york => "NY",
    :Oregon => "OR"
}
puts states[:New_york]

#funciones
def sayhi(x="User")
    puts "Hello "+x
end

sayhi

def cube(num)
    return num**3,43
end
puts cube(3)


#conditionals

male = true
tall = true
# and 
# or
# !negation
if male and tall
    puts "you are a tall male"
elsif !male
    put "You are not male"
else
    puts "not male or not tall"
end
    
def get_day_name(day)
    day_name =""
    case day
    when "mon"
        day_name ="Monday"
    else
        day_name ="invalid"
    end
    return day_name
end

puts get_day_name("msd")


#loops

index =1

while index <= 5
    puts index
    index +=1
end

for element in numbers
    print(element)
end

numbers.each do |number|
    puts numbers
end

for number in 0..5
    puts number
end

6.times do |index|
    puts index
end

var = 7
until var == 11 do 
  puts var * 10
  var = var + 1  
end

File.open("personal.txt","r") do |file|
    for line in file.readlines()
        puts line
    end
end

File.open("personal.txt","a") do |file|
    file.write("\nOscar, accounting")
end

l = Array[1,2,3,4,5]
begin
    num = 10 /0
    l["numero"]
rescue ZeroDivisionError => e
    puts e
rescue TypeError => e
    puts e
end

#Objects
class Book
    attr_accessor :title, :author, :pages
    def initialize(title,author,pages)
        @title = title
        @author  = author
        @pages = pages
    end
    def is_long
        if @pages>300
            return true
        end
            return false
    end
end
book1 = Book.new("Harry Potter","JK rowling",400)
puts book1.is_long

class HorrorBook < Book
   
end
hbook = HorrorBook.new("Nun","Geancarlo",700)
puts hbook.is_long()
