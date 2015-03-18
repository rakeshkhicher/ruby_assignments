module Shop
  def list()
    File.open("inventory.txt").readlines.each do |line|
    puts line
    end
  end

  def search()
    puts "enter the name of product for search"
    name = gets.chomp
    File.open("inventory.txt").readlines.each do |line|
    puts line if (line[name])
    end
  end  
end   

  
class Shopkeepar
  include Shop
   
  def add()
    file1 = File.open("inventory.txt",'a+')
    puts "enter product id"
    p_id= gets.chomp
    puts "enter product name"
    name = gets.chomp
    puts "enter product price"
    price = gets.chomp
    puts "enter company of product"
    company = gets.chomp
    puts "enter no of items in stock"
    stockItem = gets.chomp
    file1.puts p_id+","+name+","+price+","+company+","+stockItem+"\n"
    file1.close
  end  
  
  def remove()
    puts "enter id of product you want to remove"
    p_id = gets.chomp
    File.open('temp.txt', 'w') do |file|
    File.open('inventory.txt', 'r').each do |line|
    columns=line.split(",")
    if !(columns[0]==p_id)
    file.print line
    end
    end
    end
    File.rename("temp.txt","inventory.txt")
  end

  def edit() 
    puts "enter the id of product for edit"
    p_id = gets.chomp
    puts "enter new product name"
    name = gets.chomp
    puts "enter new product price"
    price = gets.chomp
    puts "enter company of new product"
    company = gets.chomp
    puts "enter no of items in stock"
    stockItem = gets.chomp 
    File.open('temp.txt', 'w') do |file|
    File.open('inventory.txt', 'r').each do |line|
    columns=line.split(",")
    if columns[0]==p_id
      file.print p_id+","+name+","+price+","+company+","+stockItem+"\n"
    else
      file.print line
    end
    end
    end
    File.rename("temp.txt","inventory.txt")
  end
  
end
  


class Customer
  include Shop
  
  def buy()
    puts "enter the name of product to buy"
    name = gets.chomp
    puts "enter the id of product to buy"
    p_id = gets.chomp
    puts "enter credit card number"
    cardno = gets.chomp 
    puts "enter cvv"
    cvv = gets.chomp 
    puts "enter quantity of product"
    quantity = gets.chomp 
    File.open('temp.txt','w') do |file|
    File.open('inventory.txt','r').each do |line|
    columns = line.split(",")
    if columns[0] == p_id
      if columns[4].to_i >= quantity.to_i
        orders_file = File.open("orders.txt",'a+')
        orders_file.puts p_id+","+name+","+cardno+","+cvv+","+quantity+"\n"
        orders_file.close
        stockItem = (columns[4].to_i - quantity.to_i)
        puts "after buying all"
        file.puts columns[0]+","+columns[1]+","+columns[2]+","+columns[3]+","+stockItem.to_s
      elsif columns[4].to_i > 0 && columns[4].to_i < quantity.to_i
        puts "Only #{columns[4]} #{name} are available"
      else
        puts "product is out of stock"
      end
    else
      file.puts line
    end
    end
    end
    File.rename("temp.txt","inventory.txt")
  end   

end
  


  role = 0
  while role != 3
    puts "ENTER\n"
    puts "1.shoopkeepar  2. customer  3. exit"
    role = gets.chomp().to_i
  
    case role
    when 1
      shop1 = Shopkeepar.new()
      shop_option = 0
      while shop_option != 6
        puts "ENTER\n"
        puts "1.ADD 2.REMOVE 3.LIST 4.SEARCH 5.EDIT 6.EXIT"
        shop_option = gets.chomp().to_i
        case shop_option
        when 1
          shop1.add()
        when 2
          shop1.remove()
        when 3
          shop1.list()
        when 4
          shop1.search()
        when 5
          shop1.edit()
        when 6
          puts "thanks"
       else
          puts "enter valid choice"
       end
     end    
    when 2
      cust_option = 0
      while cust_option !=4
        puts "ENTER\n" 
        puts "1.LIST 2.SEARCH 3.BUY 4.EXIT"
        cust_option = gets.chomp().to_i
        customer1 = Customer.new()
        case cust_option
        when 1
          customer1.list()
        when 2
          customer1.search()
        when 3
          customer1.buy()
        when 4
          puts "thanks"
        else
        puts "enter valid choice"
        end
      end   
    when 3
      puts "thanks"
    else
      puts "enter valid option"
    end
  end
