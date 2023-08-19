loop do
  puts "Give a number no less than 3:"
  num = gets.chomp.to_i
  
  if num < 3
    puts "That's not enough lines. "
  else 
    num.times { puts "Launch School is the best!" }
    break
  end

end