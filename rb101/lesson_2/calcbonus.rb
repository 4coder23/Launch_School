require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def operation_to_message(op)
  case op
  when '1' then 'Adding'
  when '2' then 'Subtracting'
  when '3' then 'Multiplying'
  when '4' then 'Dividing'
  end
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  num1 = " "
  loop do
    prompt(MESSAGES['num1'])
    num1 = Kernel.gets().chomp()
    if valid_number?(num1)
      break
    else
      prompt(MESSAGES['valid_num'])
    end
  end

  ops = ''
  num2 = " "
  loop do
    loop do
      prompt(MESSAGES['num2'])
      num2 = Kernel.gets().chomp()
      if valid_number?(num2)
        break
      else
        prompt(MESSAGES['valid_num'])
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
    ops = ''
    loop do
      ops = Kernel.gets().chomp()
      if %w(1 2 3 4).include?(ops)
        break
      else
        prompt(MESSAGES['choice'])
      end
    end

    if num2 == '0' && ops == '4'
      prompt(MESSAGES['denom'])
    else
      break
    end
  end

  prompt(" #{operation_to_message(ops)} the two numbers...")
  result =  case ops
            when '1'
              num1.to_f + num2.to_f
            when '2'
              num1.to_f - num2.to_f
            when '3'
              num1.to_f * num2.to_f
            when '4'
              num1.to_f / num2.to_f
            end

  prompt("The result is #{result}.")
  prompt(MESSAGES['recalc'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
