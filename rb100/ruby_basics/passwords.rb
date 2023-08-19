PW = "yay"

loop do
  puts "Please enter your password:"
  password = gets.chomp

  if password != PW
  puts "Invalid password!"
  else
    puts "Welcome!" if password == PW
    break
  end
  
end