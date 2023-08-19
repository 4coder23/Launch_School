PW = "yay"
NAME = "jh"

loop do
  puts "Please enter user name:"
  user = gets.chomp
  puts "Please enter your password:"
  password = gets.chomp

  break if password == PW && user == NAME
  puts "Authorization failed!"
end

    puts "Welcome!"