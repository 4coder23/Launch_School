array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array.each { |x| puts x }

array.each do |x|
  if x > 5 
    puts x
  end
end
  
new_array = array.select { |x| x % 2 != 0}
puts new_array

array.push(11)
arry.unshift(0)

array.pop(11)
array.push(3)
array.uniq

hash = {key1 => 1. key2 => 2, key3 => 3}
hash1 = {key1: 1, key2: 2, key3: 3}
