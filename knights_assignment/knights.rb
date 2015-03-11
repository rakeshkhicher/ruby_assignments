def knightour(x,y,xmove,ymove,solution,moves)
  next_x = 0
  next_y = 0
  if moves == ($chess_length * $chess_width)
     printsolution(solution)
  else  
  array_index = 0
  min=8
  degree = 0
    while array_index < 8
      next_x = x + xmove.at(array_index)
      next_y = y + ymove.at(array_index)
      if issafe(next_x,next_y,solution) == true
        degree = squaredegree(next_x,next_y,solution,xmove,ymove)
	if degree <= min
          min = degree
          select_index = array_index
        end  
      end    
    array_index +=1
    end
    if min == 8
      #printsolution(solution)
      puts "solution does not exist"
      return
    end
    x_new = x + xmove.at(select_index)
    y_new = y + ymove.at(select_index)
    solution[x_new][y_new]=moves
    moves +=1
    knightour(x_new,y_new,xmove,ymove,solution,moves)
  end 

end



def issafe(next_x,next_y,solution)
  if next_x < $chess_length && next_x >=0 && next_y < $chess_width && next_y >=0 && solution[next_x][next_y]==-1
    return true
  end
  return false
end



def squaredegree(x,y,solution,xmove,ymove)
  degree = 0
  next_x = 0
  next_y = 0
  array_index =0
  while array_index < 8
    next_x = x + xmove.at(array_index)
    next_y = y + ymove.at(array_index)  
    if issafe(next_x,next_y,solution) == true
      degree =degree + 1     
    end 
    array_index +=1
  end
  return degree
end



def printsolution(solution)
  puts "solution array"
  for x in 0..$chess_length-1
    for y in 0..$chess_width-1
      print solution[x][y]
      print "\t"
    end
  print "\n"
  end 
end

def main
  puts "starting x value"
  start_x = gets.chomp().to_i
  puts "starting y value"
  start_y = gets.chomp().to_i
  puts "chess board rows"
  $chess_length=gets.chomp().to_i
  puts "chess board columns"
  $chess_width=gets.chomp().to_i
  solution = Array.new($chess_length){Array.new($chess_width,-1)}
  solution[start_x][start_y] = 0
  xmove = Array[2,1,-2,-2,2,-1,-1,1]
  ymove = Array[1,2,-1,1,-1,2,-2,-2]
  moves = 1
  knightour(start_x,start_y,xmove,ymove,solution,moves)
end

main()



