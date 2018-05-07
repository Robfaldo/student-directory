# First we print the list of students

# create a student class, with variables for name, age, height, nationality 
# until the user quits, prompt the user to create 
# prompt the user for input and assign it to
# use that input to set the variables of the instance of student 
# return the 


class Student 
  def initialize(name) #, cohort, height, nationality)
    @name = name
    #@cohort = cohort.to_sym
    #@height = height
    #@nationality = nationality
  end 

  def return_name 
    return @name.capitalize 
  end

  def age(age)
    @age = age
  end

  def return_age
    return @age
  end
end


def create_new_student

  puts "Enter student name: "
  user_input = gets.chomp.capitalize

  if user_input.empty? 
    return "stop"
  else
    student = Student.new(user_input)
  end

  puts "How old is #{student.return_name}? "
  student.age(gets.chomp)

  return student
end




def input_students 

  # array of hash tables to store each student. 
  students = []


  while true
    current_student = create_new_student

    if current_student == "stop"
      break
    else
      students << { name: current_student.return_name, age: current_student.return_age }
    end
  end

  puts "Enter student age" 



  p students
  return students 
end


def print_header
  puts "The students of Villains Academy"
  puts "----------"
end 

def print(names)
    names.each do |name|
    puts "#{name[:name]}, (#{name[:cohort]} cohort)" 
  end
end 

def print_footer(names)
  i = 1
  name_index = 0
  while name_index < names.length
    
    if names[name_index][:name].length < 12
      puts "#{i}. #{names[name_index][:name]} who is #{names[name_index][:age]} years old!"
      i += 1
    end
    name_index += 1
  end

end

current_student_directory = input_students
print_header
print_footer(current_student_directory)

