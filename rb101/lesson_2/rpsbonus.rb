system('clear')
require 'yaml'
MESSAGES = YAML.load_file('rpsbonus_messages.yml')
VALID_CHOICES = %w(r p s sp l)

choice = ''

def prompt(message)
  Kernel.puts("=> #{message}")
end

def get_name
  prompt(MESSAGES['prompt_name'])
  loop do
    name = Kernel.gets().chomp()

    if name.empty?() || name.strip.empty?()
      prompt(MESSAGES['valid_name'])
    else
      prompt("Hi #{name}!  Win three times and you'll be the grand winner!")
      break
    end
  end
end

def get_choice
  prompt(MESSAGES['game_rule'])
  loop do
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      return choice
    else
      prompt(MESSAGES['valid_choice'])
    end
  end
end

win = { 'r' => ['s', 'l'],
        's' => ['p', 'l'],
        'p' => ['r', 'sp'],
        'l' => ['sp', 'p'],
        'sp' => ['s', 'r'] }

choice_to_message = { 'r' => 'rock',
                      'p' => 'paper',
                      's' => 'scissors',
                      'sp' => 'spock',
                      'l' => 'lizard' }

prompt(MESSAGES['greeting'])
get_name
puts

loop do # main loop
  your_score = 0
  computer_score = 0
  loop do
    choice = get_choice
    computer_choice = VALID_CHOICES.sample
    puts
    prompt("You chose: #{choice_to_message[choice]} Computer chose: #{choice_to_message[computer_choice]}")

    if win.fetch(choice).include?(computer_choice)
      prompt('You win!')
      your_score += 1
    elsif win.fetch(computer_choice).include?(choice)
      prompt('Computer wins!')
      computer_score += 1
    else
      prompt("It's a tie!")
      (your_score + 0) && (computer_score + 0)
    end

    prompt("Your score: #{your_score} Computer score: #{computer_score}")
    break if your_score == 3 || computer_score == 3
    puts
  end

  if your_score == 3
    prompt(MESSAGES['you_win'])
  else
    prompt(MESSAGES['computer_win'])
  end
  puts

  prompt(MESSAGES['replay'])
  replay = Kernel.gets().chomp()
  puts
  if replay.downcase.start_with?('y')
    your_score = 0
    computer_score = 0
  else
    prompt(MESSAGES['goodbye'])
    break
  end
end
