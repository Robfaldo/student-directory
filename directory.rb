# First we print the list of students

def get_user_input
  # Asks the user for a string, repeats until a blank line is entered. Returns the string 
  # given unless a blank line is returned where it will return "stop" 
  # @rtype: string 
  # >>> get_user_input 
  # Ben 
  # >>> get_user_input 
  # stop 
  # puts question_string

  user_input = gets.chomp 

  if user_input.empty? 
    return "stop"
  else
    return user_input
  end
end




def input_students 

  # array of hash tables to store each student. 
  students = []

  puts "Enter new student name, to finish hit return twice: "

  while true
    input = get_user_input
    if input == "stop"
      break
    else
      students << { name: input }
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
      puts "#{i}. #{names[name_index][:name]}"
      i += 1
    end
    name_index += 1
  end

end

current_student_directory = input_students
print_header
print_footer(current_student_directory)

