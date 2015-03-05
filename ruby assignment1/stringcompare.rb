def string_compare(string1,string2)
  if string1 == string2
    puts "both string are equal"
  else
    puts "strings are not equal"
  end
end

puts "enter string1"
string1 = gets.chomp

puts "enter string2"
string2 = gets.chomp

puts string_compare(string1,string2)
