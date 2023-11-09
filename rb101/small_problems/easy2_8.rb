puts ">> Please enter an integer greater than 0:"
number = gets.to_i
puts ">>Enter 's' to compute the sum, 'p' to compute the product."
operator = gets.chomp


if operator == 's'
  value = 0
  number.times do |x|
    value << value + x
  end
    puts "The sum of the integers between 1 and #{number} is #{value}."
  
else operator == 'p'
  number.times do |x|
    value << value * x
    puts "The product of the integers between 1 and #{number} is #{value}."
  end
end
