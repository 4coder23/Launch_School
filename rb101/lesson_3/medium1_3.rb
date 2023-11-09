def factors(number)
  divisor = number
  factors = []
  loop 
    factors << number / divisor
    divisor -= 1
    if number % divisor == 0 && number * 1 > 0
    break if divisor == 0
    end
  end
  factors
end

p factors(10)