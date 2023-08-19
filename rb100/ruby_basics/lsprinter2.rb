loop do 
  puts ">> How many output lines do you want? Enter a number >= 3 (Q to Quit):"
  num = gets.chomp.downcase
  break if num == 'q'

    if num.to_i < 3
      puts ">> That's not enough lines. "
    else
      num.to_i.times { puts "Launch School is the best!" }
    end
end