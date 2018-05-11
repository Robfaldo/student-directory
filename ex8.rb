var = ["this", "is", "a", "test"]

var2 = var.join(" ")

File.foreach($0).with_index do |line, line_num|
   puts "#{line_num}: #{line}"
end
