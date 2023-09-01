require 'yaml'
MESSAGES = YAML.load_file('mortgagecalc_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  (number.to_i.to_s == number || number.to_f.to_s == number) &&
    (number != '0' && number != '0.0') && number * 1 > '0'
end

def valid_apr?(apr)
  (apr.to_i.to_s == apr || apr.to_f.to_s == apr) &&
    (apr * 1 > '0' || apr == '0')
end

def prompt_loan_amount
  loop do
    loan_amount = Kernel.gets.chomp

    if valid_number?(loan_amount)
      return loan_amount
    else
      prompt(MESSAGES['invalid_loanamount'])
    end
  end
end

def prompt_apr
  loop do
    apr = Kernel.gets.chomp

    if valid_apr?(apr)
      return apr
    else
      prompt(MESSAGES['invalid_apr'])
    end
  end
end

def prompt_loan_length
  loop do
    loan_length = Kernel.gets.chomp

    if valid_number?(loan_length)
      return loan_length
    else
      prompt(MESSAGES['invalid_loanlength'])
    end
  end
end

def calculate_monthly_payment(apr, loan_amount, loan_length)
  months_in_year = 12.00
  if apr == 0
    loan_amount.to_f / loan_length.to_i
  else
    monthly_interest = apr.to_f / 100 / months_in_year
    loan_amount.to_i *
      (monthly_interest /
      (1 - ((1 + monthly_interest)**(-loan_length.to_i))))
  end
end

def prompt_recalc
  loop do
    recalc = Kernel.gets().chomp()

    if %w(yes y no n).include?(recalc)
      return recalc
    else
      prompt(MESSAGES['invalid_answer'])
    end
  end
end

prompt(MESSAGES['welcome'])

loop do # main loop
  prompt(MESSAGES['loan_amount'])
  loan_amount = prompt_loan_amount
  prompt("Your loan amount is $#{loan_amount}.")

  prompt(MESSAGES['apr'])
  apr = prompt_apr.to_f.round(1)
  prompt("Your APR is #{apr}%.")

  prompt(MESSAGES['loan_length'])
  loan_length = prompt_loan_length
  prompt("Your loan duration is #{loan_length} in months.")

  monthly_payment = calculate_monthly_payment(apr, loan_amount, loan_length)
  prompt("Your monthly mortgage payment is: $#{monthly_payment.round(2)}.")

  prompt(MESSAGES['recalc'])
  recalc = prompt_recalc
  if recalc == 'no' || recalc == 'n'
    prompt(MESSAGES['bye'])
    break
  else
    recalc == 'yes' || 'y'
    prompt(MESSAGES['yes_recalc'])
  end
end
