puts "What is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
tip_percent = gets.chomp.to_f

tip = sprintf('%.2f', (bill * (tip_percent / 100)))
total = sprintf('%.2f', (bill + tip.to_f))
puts "The tip is $#{tip}"
puts "The total is $#{total}"