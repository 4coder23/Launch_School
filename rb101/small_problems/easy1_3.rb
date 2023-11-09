def stringy(number)
  strings = ''
  number.times do |x|
    if x.even? 
      string = '1'
    else
     string = '0'
    end
      strings << string
  end
   return strings
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

