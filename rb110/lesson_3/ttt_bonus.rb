system('clear')
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(message)
  puts("=> #{message}")
end

def get_name
  prompt("What is your name?")
  loop do
    name = gets.chomp
    if name.empty? || name.strip.empty?
      prompt("Please enter a valid name")
    else
      prompt("Hi #{name}! Win five rounds against the computer and you'll be the grand winner!")
      prompt("You or the computer will be randomly chosen to decide who goes first.")
      prompt("Enter any key when you're ready.")
      gets.chomp
      return name
    end
  end
end

def order_of_play(name)
  who_chooses = ['Computer', 'Player'].sample
  if who_chooses == 'Player'
    loop do
      prompt("#{name}, who should go first this round? Enter computer or #{name}")
      player_chooses = gets.chomp
      prompt("You chose #{player_chooses} to go first this round.")
      return player_chooses if ['computer', name].include?(player_chooses)
      prompt("Please return a valid choice. computer or #{name}")
    end
  else
    computer_chooses = ['computer', name].sample
    prompt("The computer chose #{computer_chooses} to go first this round.")
    computer_chooses
  end
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array, delimiter=', ', word='or')
  if array.size == 0
    ''
  elsif array.size == 1
    array.first.to_s
  elsif array.size == 2
    array.join(" #{word} ")
  else
    array[-1] = "#{word} #{array.last}"
    array.join(delimiter)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd), delimiter = ', ', word = 'or')}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece!(brd)
  square = nil

  # offense first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # pick 5
  if brd[5] == INITIAL_MARKER
    square = 5
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end

def place_piece!(board, who_plays_first, name)
  loop do
    display_board(board)
    if who_plays_first == name
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      display_board(board)
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

    else
      display_board(board)
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      display_board(board)
      player_places_piece!(board)
    end
    break if someone_won?(board) || board_full?(board)
  end
end

def display_round_winner(brd)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won this round!"
  else
    prompt "It's a tie!"
  end
end

def increment_score(winner, scoreboard)
  if winner == "Player"
    scoreboard['Player'] += 1
  elsif winner == "Computer"
    scoreboard['Computer'] += 1
  end
end

def display_scoreboard(scoreboard)
  prompt("Player score: #{scoreboard['Player']} Computer score: #{scoreboard['Computer']}")
end

def display_grand_winner(name, scoreboard)
  if scoreboard['Player'] == 5
    prompt "#{name} is the grand winner!"
  else
    prompt "Computer is the grand winner!"
  end
end

# start
prompt "Let's play Tic Tac Toe!"
name = get_name

loop do # main loop
  scoreboard = { 'Player' => 0,
                 'Computer' => 0 }
  loop do
    board = initialize_board
    who_plays_first = order_of_play(name)
    prompt("Enter any key to continue.")
    gets.chomp
    place_piece!(board, who_plays_first, name)
    display_board(board)
    display_round_winner(board)
    winner = detect_winner(board)
    increment_score(winner, scoreboard)
    display_scoreboard(scoreboard)
    prompt("Enter any key to continue.")
    gets.chomp
    break if scoreboard['Player'] == 5 || scoreboard['Computer'] == 5
  end
  display_grand_winner(name, scoreboard)
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "#{name}, Thanks for playing Tic Tac Toe! Good bye!"
