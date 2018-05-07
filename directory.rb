# Create a student class with variables 
class Student 
  attr_accessor :age, :height, :nationality

  def initialize(name, cohort) 
    @name = name
    @cohort = cohort 
  end 

  def return_name 
    return @name.capitalize 
  end

  def return_cohort 
    return @cohort.downcase
  end
end

def is_valid_cohort(cohort)
  # If the cohort value is a month then return true, else return false 
  # @type: string
  # @rtype bool 
  valid_months = [:january, :february, :march, :april, :may, :june, :july, :august, 
  :september, :october, :november, :december]

  return valid_months.include?(cohort)

end


def create_new_student

  puts "Enter student name: "
  name = gets.chomp.capitalize

  if name.empty? 
    return "stop"
  end

  puts "What cohort is #{name} in?"
  cohort = gets.chomp.downcase.to_sym


  # check cohort is valid and set to default if not & prompt user if they'd like to try again
  until is_valid_cohort(cohort)
    cohort = :november
    puts "No matching cohort, default set to november. Are you sure you'd like to submit (type yes/no)?"
    wants_to_submit_anyway = gets.chomp.downcase 

    if wants_to_submit_anyway == "yes"
      break
    else
      cohort = gets.chomp.downcase.to_sym
    end
  end 

  student = Student.new(name, cohort)

  puts "How old is #{student.return_name}? "
  student.age = gets.chomp

  puts "How tall is #{student.return_name} in cm's?"
  student.height = gets.chomp

  puts "What nationality is #{student.return_name}?"
  student.nationality = gets.chomp

  return student
end




def input_students 

  # array of hash tables to store each student. 
  students = []

  # unless user stops entering names, prompt the user to create a new student and store 
  # the instance of the student class in an array of students 
  while true
    current_student = create_new_student

    if current_student == "stop"
      break
    else
      students << { name: current_student.return_name, age: current_student.age, height: current_student.height, nationality: current_student.nationality, cohort: current_student.return_cohort }
    end
  end

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
      list = "#{i}. #{names[name_index][:name]} who is #{names[name_index][:age]} years old! Hes in the #{names[name_index][:cohort]} cohort"
      puts list.center(15)
      i += 1
    end
    name_index += 1
  end

end


current_student_directory = input_students
print_header
print_footer(current_student_directory)

