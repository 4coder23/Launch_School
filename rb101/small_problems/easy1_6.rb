def triangle(number)
  count = 1
  loop do
    puts ' ' * (number - count) + '*' * count
    count += 1
    break if number < count
  end
end

triangle(5)
triangle(9)
