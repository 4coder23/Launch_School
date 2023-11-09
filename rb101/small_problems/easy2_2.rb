puts "Enter the length of the room in meters:"
length_meters = gets.chomp.to_i
puts "Enter the width of the room in meters:"
width_meters = gets.chomp.to_i

square_meter = length_meters * width_meters
square_feet = ((length_meters * 10.7639) * (width_meters * 10.7639)).round(2)

puts "The area of the room is #{square_meter} square meters (#{square_feet} square feet)."