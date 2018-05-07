# First we print the list of students

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
  names.each do |name|
    if name[:name].length < 12
      puts "#{i}. #{name[:name]}"
      i += 1
    end
  end
end

current_student_directory = input_students
print_header
print_footer(current_student_directory)

