status = ['awake', 'tired'].sample

sleep = 
  if status == 'awake'
    puts 'Be productive!'
  else
    puts 'Go to sleep!'
  end

puts sleep