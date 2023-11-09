def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

puts square(5)
puts square(-8)

def square(num, power)
  multiply(num, 1) ** power
end