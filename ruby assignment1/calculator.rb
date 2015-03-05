def calculator(operand1, operand2, operator)
 operand1.send(operator,operand2)
end
puts "enter first operand"
operand1 = gets.chomp().to_i

puts "enter second operand"
operand2 = gets.chomp().to_i

puts "enter operator"
operator = gets.chomp()

puts calculator(operand1, operand2, operator)
