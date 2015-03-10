def knightour(x,y,xmove,ymove,solution,moves)
  next_x = 0
  next_y = 0
  if moves == ($chess_length * $chess_width)
     printsolution(solution)
  else  
  k = 0
  min=8
  degree = 0
    while k < 8
      next_x = x + xmove.at(k)
      next_y = y + ymove.at(k)
      if issafe(next_x,next_y,solution) == true
        degree = squaredegree(next_x,next_y,solution,xmove,ymove)  
      end
      
      if degree <= min
        min = degree
        index = k
      end
    k +=1
    end
    
    x_next = x + xmove.at(index)
    
    y_next = y + ymove.at(index)
    
    solution[x_next][y_next]=moves
    moves +=1
    knightour(x_next,y_next,xmove,ymove,solution,moves)
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
  k =0
  
  while k < 8
    next_x = x + xmove.at(k)
    next_y = y + ymove.at(k)  
    if issafe(next_x,next_y,solution) == true
      degree =degree + 1     
    end
  
    k +=1
  end
 
  return degree
end






def printsolution(solution)
  for x in 0..$chess_length-1
   for y in 0..$chess_width-1
     print solution[x][y]
     print "\t"
   end
 print "\n"
 end 
end


  puts "starting x value"
  start_x = gets.chomp().to_i
  puts "starting y value"
  start_y = gets.chomp().to_i

  puts "chess board width"
  $chess_width=gets.chomp().to_i
  puts "chess board length"
  $chess_length=gets.chomp().to_i
  
  solution = Array.new($chess_length){Array.new($chess_width,-1)}
  puts "solution array"
  solution[start_x][start_y] = 0
  xmove = Array[2,1,-2,-2,2,-1,-1,1]
  ymove = Array[1,2,-1,1,-1,2,-2,-2]
  moves = 1
  knightour(start_x,start_y,xmove,ymove,solution,moves)




