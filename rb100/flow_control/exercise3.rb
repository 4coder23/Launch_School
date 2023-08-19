puts "What's your number between 0 and 100?"
num = gets.chomp.to_i

if num >= 0 && num <= 50
  puts " It's between 0 and 50"
elsif num >= 51 && num <= 100
  puts "It's between 51 and 100"
else num > 100
  puts " It should not be greater than 100"
end
