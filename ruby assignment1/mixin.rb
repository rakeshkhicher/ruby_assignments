module Calculate
    def percentage (marks_scored,total_marks)
  	( marks_scored * 100 ) / total_marks  
    end

    def interest (principal,rate,period)
 	(principal * rate * period) /100
    end
end

class Score
  
  include Calculate
end

class Interest
  
  include Calculate
end

puts "enter marks scored"
marks_scored = gets.chomp().to_i

puts "enter total marks"
total_marks = gets.chomp().to_i

scr = Score.new()
puts scr.percentage(marks_scored,total_marks)

puts "enter principal_amount"
principal = gets.chomp().to_i

puts "enter rate of interest"
rate = gets.chomp().to_i

puts "enter time for interest"
period = gets.chomp().to_i

intrst = Interest.new()
puts intrst.interest(principal,rate,period) 
