@students = []

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line| 
    name, cohort = line.chomp.split(",")
      @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

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

  # unless user stops entering names, prompt the user to create a new student and store 
  # the instance of the student class in an array of students 
  while true
    current_student = create_new_student

    if current_student == "stop"
      break
    else
      @students << { name: current_student.return_name, age: current_student.age, height: current_student.height, nationality: current_student.nationality, cohort: current_student.return_cohort }
    end
  end

  return @students 
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------------"
end 


def print_student_list
  valid_months = [:january, :february, :march, :april, :may, :june, :july, :august, 
    :september, :october, :november, :december]
  this_months_cohort = []
  index_counter = 1

  unless @students.count == 0  

    valid_months.each do |month|
      @students.each_with_index do |student, index|
        if @students[index][:cohort] == month.to_sym
          puts "#{index_counter}. #{@students[index][:name]} is in the #{@students[index][:cohort]} cohort!"
          index_counter += 1 
        end 
      end
    end
  end
end 

def print_footer
  puts "We have #{@students.count} #{@students.count > 1 || @students.count == 0 ? "students" : "student"}!" 
  puts "-------------------"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save students"
  puts "4. Load students"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students 
  # Open the file for writing 
  file = File.open("students.csv", "w")
  # iterate over the array of students 
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end 


def selection(process)
  case process
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
    end
end

def interactive_menu
  loop do 
    print_menu
    # Ask user what opton in the menu they'd like to do and execute 
    selection(gets.chomp)
  end
end

interactive_menu
# current_student_directory = input_students
#print_header
#print_footer(current_student_directory)

