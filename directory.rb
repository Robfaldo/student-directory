# First we print the list of students

def get_user_input(question_string)
  puts question_string
  while true 
    new_input = gets.chomp

    if new_input.empty? 
      break
    else
      return new_input
    end
  end 
end

def input_students 
  students = []
  puts "Enter new student name, to finish hit return twice: "

  while true 
    new_name = gets.chomp.capitalize

    if new_name.empty?
      break
    else
      students << {name: new_name, cohort: :november} 
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

