def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
endd

def operation_to_message(op)
  case op
  when '1' then 'Adding'
  when '2' then 'Subtracting'
  when '3' then 'Multiplying'
  when '4' then 'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  num1 = " "
  loop do
    prompt("What is your first number?")
    num1 = Kernel.gets().chomp()
    if valid_number?(num1)
      break
    else
      prompt("That is not a valid number.")
    end
  end

  num2 = " "
  loop do
    prompt("What is your second number?")
    num2 = Kernel.gets().chomp()
    if valid_number?(num2)
      break
    else
      prompt("That's not a valid number.")
    end
  end

  op_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(op_prompt)

  op = ''
  loop do
    op = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(op)
      break
    else
      prompt("Must choose 1, 2, 3, 4")
    end
  end

  prompt(" #{operation_to_message(op)} the two numbers...")
  result =  case op
            when '1'
              num1.to_i + num2.to_i
            when '2'
              num1.to_i - num2.to_i
            when '3'
              num1.to_i * num2.to_i
            when '4'
              num1.to_f / num2.to_f
            end

  prompt("The result is #{result}.")
  prompt("Do you want to perform another calculation? (Y for yes)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
