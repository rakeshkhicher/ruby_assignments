def reduce(string1)
	string2 =String.new
	string2 = string1.each_char{''}
	puts string2
	begin
		i=0
		str2len = string2.length
		string3 = String.new
		while i < str2len
  			string3 = string3 + string2[i]
  			i = i + 2
 		end
 		puts string3
 		string2 = string3.each_char{''}
	end while string2.length > 1 
end
puts "enter the string"
string1 = gets.chomp
reduce(string1)
