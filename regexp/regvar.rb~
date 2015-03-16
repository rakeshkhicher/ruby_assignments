def variable_count(path)
  class_variables = 0
  instance_variables = 0
  globl_variables = 0
  locl_variables = 0
  if /rb$/ =~ path
    File.open(path).readlines.each do |line|
    if /[^@@]\@\w+/ =~ line
      instance_variables += 1
    end
    if /\@@\w+/ =~ line
      class_variables += 1
    end
    if /\$\w+/ =~ line
      globl_variables += 1 
    end  
    if /[^@@\w+]([a-zA-Z0-9]+ =)/ =~ line
      locl_variables += 1 
    end
    end   
    
    puts "total instance variables:"
    puts instance_variables
    puts "total class variables:"
    puts class_variables
    puts "total global variables:"
    puts globl_variables
    puts "total local variables:"
    puts locl_variables
  else
    puts "enter path of a ruby file"
  end
end     
  puts "enter file path"
  path = gets.chomp
  variable_count(path)
