def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def notzero
  loop do
    puts ">> Please enter a positive or negative integer:"
    num = gets.chomp
    return num.to_i if valid_number?(num)
      puts ">> Invalid input.  Only non-zero integers are allowed."
  end
end

int1 = nil
int2 = nil

  loop do
    int1 = notzero
    int2 = notzero

    if ( int1.negative? && int2.negative? ) || ( int1.positive? && int2.positive? )
    puts ">> Sorry. One integer must be positive, one must be negative."
    puts ">> Please start over."
    else
      break
    end
  end
    
    ans = int1 + int2
    puts "#{int1} + #{int2} = #{ans}"
  


    




  
  
  


    
  