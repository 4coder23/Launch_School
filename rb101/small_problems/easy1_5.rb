def print_in_box(string)
  puts "+" + "-" * (string.chars.length + 2) + "+"
  puts "|" + " " * (string.chars.length + 2) + "|"
  puts "| " + string + " |"
  puts "|" + " " * (string.chars.length + 2) + "|"
  puts "+" + "-" * (string.chars.length + 2) + "+"
end

  print_in_box('To boldly go where no one has gone before.')
  print_in_box('')