puts "What is your name?"
name = gets.chomp

age = rand(20..20)
if name.empty?
  puts "Teddy is #{age} years old!"
else 
  puts "#{name} is #{age} years old!"
end
