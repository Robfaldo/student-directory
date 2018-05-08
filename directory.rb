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
  name = gets.capitalize.gsub("\n","")

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

  puts "We have #{names.count} #{names.count > 1 || names.count == 0 ? "students" : "student"}!" 
  
  valid_months = [:january, :february, :march, :april, :may, :june, :july, :august, 
    :september, :october, :november, :december]
  this_months_cohort = []
  index_counter = 1

  # go through the months, and at each month I want to see if there are are students
  # in the names array that have the key/value pair m:cohort/month. If so, puts it 

  unless names.count == 0  

    valid_months.each do |month|
      names.each_with_index do |student, index|
        if names[index][:cohort] == month.to_sym
          puts "#{index_counter}. #{names[index][:name]} is in the #{names[index][:cohort]} cohort!"
          index_counter += 1 
        end 
      end
    end
  end

end


current_student_directory = input_students
print_header
print_footer(current_student_directory)

