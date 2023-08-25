require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def prompt_user_name
  loop do
    name = Kernel.gets().chomp()
    if name.empty?() || name.strip.empty?()
      prompt(MESSAGES['valid_name'])
    else
      return name
    end
  end
end

def prompt_number(number)
  loop do
    number = Kernel.gets().chomp()
    if valid_number?(number)
      return number
    else
      prompt(MESSAGES['valid_number'])
    end
  end
end

def valid_number?(number)
  number.to_i.to_s == number || number.to_f.to_s == number
end

operation_to_message = {  '1' => 'Adding',
                          '2' => 'Subtracting',
                          '3' => 'Multiplying',
                          '4' => 'Dividing' }

prompt(MESSAGES['welcome'])
name = prompt_user_name()
prompt("Hi #{name}!")

loop do # main loop
  prompt(MESSAGES['number1'])
  number1 = prompt_number(number1)
  prompt("Your first number is #{number1}.")
  number2 = ''
  operator = ''
  loop do
    prompt(MESSAGES['number2'])
    number2 = prompt_number(number2)
    prompt("Your second number is #{number2}.")
    prompt(MESSAGES['op_prompt'])
    loop do
      operator = Kernel.gets().chomp()
      if %w(1 2 3 4).include?(operator)
        break
      else
        prompt(MESSAGES['choice'])
      end
    end

    if (number2 == '0' || number2 == '0.0') && operator == '4'
      prompt(MESSAGES['denominator'])
    else
      break
    end
  end

  prompt("#{operation_to_message[operator]} the two numbers...")
  result =  case operator
            when '1'
              number1.to_f + number2.to_f
            when '2'
              number1.to_f - number2.to_f
            when '3'
              number1.to_f * number2.to_f
            when '4'
              number1.to_f / number2.to_f
            end

  prompt("The result is #{result}.")
  prompt(MESSAGES['recalculate'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
