puts "Do you want me to print something? (y/n) "
ans = gets.chomp.downcase

loop do 
  if ans == "y"
    puts "It's printed" 
  break

  elsif ans == "n"
    break

  else
    puts "Invalid input! Please enter y or n"
    ans = gets.chomp
  end
end
