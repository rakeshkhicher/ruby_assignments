puts "enter string mississipi"
str = gets.chomp
if /s{2}/.match(str)
  puts "match found in string"
else
  puts "match not found"
end

puts "enter string to check whether string start with St or not"
str1 = gets.chomp

if /^\St/.match(str1)
  puts "string start with St"
else
  puts "string not start with St"
end

puts "enter to check whether string ends with art or not"
str2 = gets.chomp

if /art$/.match(str2)
  puts "string end with art"
else
  puts "match not found"
end


puts "enter  string to check whether string have non-alphanumeric characters in it or not"
str3 = gets.chomp
if /[^a-zA-Z0-9]/.match(str3)
  puts"string have non-alphanumeric characters in it"
else
  puts "string don't have non-alphanumeric characters in"
end


puts "enter  string to check whether string have whitespace characters or not"
str4 = gets.chomp

if /\s/ =~ str4
  puts "string have whitespace characters"
else 
  puts "not any whitespace characters in string"
end

puts "enter  sentence in which  replace 'Mrs' with 'Ms'"
str5 = gets.chomp
if /Mrs/ =~ str5
  str5.gsub! 'Mrs', 'Ms'
  puts str5
else 
  puts "match not found"
end   


puts "enter the string in which  replace non-alphanumeric characters with '-'"
str6 = gets.chomp
if /\W/ =~ str6
  str6.gsub! /\W/, '-'
  puts str6
else
  puts "match not found"
end


puts "file path"
string1 = gets.chomp()
File.open(string1).readlines.each do |line|
words = line.split(/\W+/)
puts "third word:"+words[2]
end


