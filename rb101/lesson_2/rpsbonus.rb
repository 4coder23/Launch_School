system('clear')
require 'yaml'
MESSAGES = YAML.load_file('rpsbonus_messages.yml')
VALID_CHOICES = %w(r rock p paper s scissors sp spock l lizard)
VALID_REPLAY = %w(y yes n no)

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
      return name
    end
  end
end

def get_choice
  prompt(MESSAGES['game_rule'])
  loop do
    user_choice = Kernel.gets().chomp().downcase()

    if VALID_CHOICES.include?(user_choice)
      return user_choice
    else
      prompt(MESSAGES['valid_choice'])
    end
  end
end

WIN_FORMULA = { 'r' => ['s', 'scissors', 'l', 'lizard'],
                'rock' => ['s', 'scissors', 'l', 'lizard'],
                's' => ['p', 'paper', 'l', 'lizard'],
                'scissors' => ['p', 'paper', 'l', 'lizard'],
                'p' => ['r', 'rock', 'sp', 'spock'],
                'paper' => ['r', 'rock', 'sp', 'spock'],
                'l' => ['sp', 'spock', 'p', 'paper'],
                'lizard' => ['sp', 'spock', 'p', 'paper'],
                'sp' => ['s', 'scissors', 'r', 'rock'],
                'spock' => ['s', 'scissors', 'r', 'rock'] }

CHOICE_TO_MESSAGE = { 'r' => 'rock',
                      'rock' => 'rock',
                      'p' => 'paper',
                      'paper' => 'paper',
                      's' => 'scissors',
                      'scissors' => 'scissors',
                      'sp' => 'spock',
                      'spock' => 'spock',
                      'l' => 'lizard',
                      'lizard' => 'lizard' }

def determine_winner(user_choice, computer_choice)
  if WIN_FORMULA.fetch(user_choice).include?(computer_choice)
    "You"
  elsif WIN_FORMULA.fetch(computer_choice).include?(user_choice)
    "Computer"
  end
end

def display_winner(winner)
  if winner == "You"
    prompt('You win!')
  elsif winner == "Computer"
    prompt('Computer wins!')
  else
    prompt("It's a tie!")
  end
end

scoreboard = { 'You' => 0,
               'Computer' => 0 }

def increment_score(winner, scoreboard)
  if winner == "You"
    scoreboard['You'] += 1
  elsif winner == "Computer"
    scoreboard['Computer'] += 1
  end
  prompt("Your score: #{scoreboard['You']} Computer score: #{scoreboard['Computer']}")
end

def get_replay_choice
  prompt(MESSAGES['replay'])
  loop do
    replay_choice = Kernel.gets().chomp().downcase()
    if VALID_REPLAY.include?(replay_choice)
      return replay_choice
    else
      prompt(MESSAGES['valid_replay_choice'])
    end
  end
end

def set_replay(replay_choice, scoreboard)
  puts
  if replay_choice.start_with?('y')
    scoreboard["You"] = 0
    scoreboard["Computer"] = 0
    system('clear')
  end
end

prompt(MESSAGES['greeting'])
name = get_name
puts

loop do # main loop
  loop do
    user_choice = get_choice
    computer_choice = VALID_CHOICES.sample
    system('clear')
    prompt("You chose: #{CHOICE_TO_MESSAGE[user_choice]} Computer chose: #{CHOICE_TO_MESSAGE[computer_choice]}")

    winner = determine_winner(user_choice, computer_choice)
    display_winner(winner)
    increment_score(winner, scoreboard)
    if scoreboard["You"] == 3
      prompt(MESSAGES['you_win'])
      break
    elsif scoreboard["Computer"] == 3
      prompt(MESSAGES['computer_win'])
      break
    end
    puts
  end

  replay_choice = get_replay_choice
  set_replay(replay_choice, scoreboard)
  if replay_choice == 'n' || replay_choice == 'no'
    prompt("#{name}, thank you for playing. Good bye!")
    break
  end
end
