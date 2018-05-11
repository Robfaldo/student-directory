require 'csv'
@students = []

def add_students_array(name, age, cohort, height, nationality)
  @students << {name: name, cohort: cohort, age: age, height: height, nationality: nationality}
end

def get_file_from_user
  puts "Enter file name (or else it will default to students.csv)"
  this_file = gets.chomp


  if File.exists?(this_file)
    puts File.basename(this_file)
    return File.basename(this_file)
  else 
    return false 
  end
end 


def load_file(file)
  CSV.foreach(file) do |row|
    name, cohort, age, height, nationality = row
    add_students_array(name, age, cohort.to_sym, height, nationality)
  end
end

def load_students(filename = "students.csv")
  new_file = get_file_from_user

  if new_file == false 
    load_file(filename)
  else
    load_file(new_file)
  end
    
  puts "Students successfully loaded, we now have #{@students.count} students!"
end

def save_file(file)
  CSV.open(file, "wb") do |this_file| 
      @students.each do |student|
        student_data = [student[:name], student[:cohort], student[:age], student[:height], student[:nationality]]
        this_file << student_data
      end
    end
end

def save_students(filename = "students.csv")
  new_file = get_file_from_user

  if new_file == false 
    save_file(filename)
  else 
    save_file(new_file)
  end
  puts "Students saved successfully!, we now have #{@students.count} students"

end 


def input_students 
  # unless user stops entering names, prompt the user to create a new student and store 
  # the instance of the student class in an array of students 
  while true
    current_student = create_new_student
    if current_student == "stop"
      break
    else
      add_students_array(current_student.return_name, current_student.age, current_student.return_cohort, current_student.height, current_student.nationality)
    end
  end
  return @students 
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = "students.csv"
  end
  if File.exists?(filename)
    puts "#{filename} exists, continuing to load students..."
    load_students(filename)
  else # if it doesn't exists 
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
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

def ask_name
  puts "Enter student name: "
  name = $stdin.gets.chomp.capitalize
  return name
end

def ask_cohort(name)
  puts "What cohort is #{name} in?"
  cohort = $stdin.gets.chomp.downcase.to_sym
end

def ask_age(student)
  puts "How old is #{student.return_name}? "
  student.age = $stdin.gets.chomp
end

def ask_height(student)
  puts "How tall is #{student.return_name} in cm's?"
  student.height = $stdin.gets.chomp
end

def get_nationality(student)
  puts "What nationality is #{student.return_name}?"
  student.nationality = $stdin.gets.chomp
end

def like_to_continue 
  puts "No matching cohort, default set to november. Are you sure you'd like to submit (type yes/no)?"
  wants_to_submit_anyway = $stdin.gets.chomp.downcase 
end


def create_new_student
  name = ask_name

  if name.empty? 
    puts "Thank you for entering students!"
    return "stop"
  end

  cohort = ask_cohort(name)

  # check cohort is valid and set to default if not & prompt user if they'd like to try again
  until is_valid_cohort(cohort)
    cohort = :november
    wants_to_submit_anyway = like_to_continue

    if wants_to_submit_anyway == "yes"
      break
    else
      cohort = $stdin.gets.chomp.downcase.to_sym
    end
  end 

  #create an instance of Student class with name & cohort given above
  student = Student.new(name, cohort)
  # get the remaining details about new student 
  age = ask_age(student)
  height = ask_height(student)
  nationality = get_nationality(student)

  return student
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------------"
end 

def valid_months_list 
  valid_months = [:january, :february, :march, :april, :may, :june, :july, :august, 
    :september, :october, :november, :december]
    return valid_months
end


def print_student_list
  valid_months = valid_months_list
  this_months_cohort = []
  index_counter = 1

  unless @students.count == 0  

    valid_months.each do |month|
      @students.each_with_index do |student, index|
        if @students[index][:cohort] == month.to_sym
          puts "#{index_counter}. #{@students[index][:name]} is in the #{@students[index][:cohort]} cohort!"
          puts "     Personal description: They are #{@students[index][:nationality]} and #{@students[index][:height]} 
          cm's tall and #{@students[index][:age]} years old"
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
end

def show_students
  print_header
  print_student_list
  print_footer
  puts "Student list loaded successfully!"
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
    selection($stdin.gets.chomp)
  end
end

try_load_students
interactive_menu
# current_student_directory = input_students
#print_header
#print_footer(current_student_directory)

