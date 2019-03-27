WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board(board = [" "," "," "," "," "," "," "," "," "])

  lines = "-----------"
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "#{lines}"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "#{lines}"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board, index, value ="X")
board[index] = value
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  def position_taken?(array, ind)
    if array[ind] == " " || array[ind] == "" || array[ind] == nil
      return false
    else
      return true
    end
  end

  def on_board?(num)
    if num.between?(0, 8) == true
      return true
    else
      return false
    end
  end

  if (position_taken?(board, index)) == false && (on_board?(index) == true)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(board, index) == true
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
    return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    current_player = "X"
  else
    current_player = "O"
  end
      return current_player
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 =="O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
  false
end

def full?(board)
   board.all? {|filler| filler == "X" || filler == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  (won?(board) || (full?(board)) || (draw?(board)))
end

def winner(board)
  if winner = won?(board)
    board[winner.first]
  else
    nil
  end
end

def play(board)
  until over?(board) == true || won?(board) != false
  puts 'turn'
    turn(board)
  end
  if winner(board)
    puts "Congratulations#{winner}!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
    return nil
  end
end
