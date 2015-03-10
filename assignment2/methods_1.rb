puts "*******STRING********"
def stmethod(string1,string2)
  puts string2.capitalize
  puts string1.downcase
  puts string1.concat(string2)
  puts string2.reverse
  string1.each_char{|c| print c,' '}
end
puts "enter the string1"
string1 = gets().chomp
puts "enter the string2"
string2 = gets().chomp
stmethod(string1,string2)


puts "*******ARRAY********"

def arrmethods(array1,array2)
   puts "#{array1}"
   puts "#{array2}"
   puts "array minus:"
   puts array1-array2
   puts "array concatinate:"
   puts array1+array2
   puts "array intersection:"
   puts array1&array2
   puts "array union"
   puts array1|array2
   puts "element at given position in array"
   puts array1.at(2)
end
digit1 = []
digit2 = []
puts "enter the no of elements in array1"
n1 = gets.chomp().to_i
puts "enter the elements of array1"
n1.times do |x|
digit1[x]=gets.chomp
end
puts "enter the no of elements in array2"
n2 = gets.chomp().to_i
puts "enter the elements of array2"
n2.times do |y|
digit2[y] = gets.chomp()
end
arrmethods(digit1,digit2)

puts "*******HASH********"

def hashmethods(months,days)
        puts "length of hash:"
	puts months.length
	puts "keys of hash:"
	puts months.keys
	puts "inverted hash:"
	puts months.invert
	puts "replaced:"
        months.replace(days)
        puts months
	puts "shifting:"
        puts months.shift
        puts "adding new pair:"
	months.store(1 , "december")
        puts months
        
end
$, = ", "
months = Hash.new( "months" )
months = {"1" => "january","2" => "february"}
days = Hash.new( "days" )
days = {"1" => "monday","2" => "tuesday","3" => "wednesday","4" => "thrusday"}
hashmethods(months,days)

puts "*******AREA OF SQUARE********"

def area(side)
 	puts "area of square:"
	side * side
end
puts "enter side of square"
side = gets.chomp().to_i
puts area(side)

