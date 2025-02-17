require 'pry'

class Game 
  attr_accessor :board, :player_1, :player_2
  
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
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1 
    @player_2 = player_2 
    @board = board 
  end 

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end 
  def won?
    #binding.pry
    WIN_COMBINATIONS.any? do |combo|
      if @board.taken?(combo[0] + 1) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
        return combo
      else 
        false
      end 
    end 
  end 
  def draw?
    @board.full? && !won? ? true : false
  end 
  def over?
    won? || draw? ? true : false
  end 
  def winner
    won? ? @board.cells[won?.first] : nil
  end 
  def turn 
    player = current_player
    puts "#{player.token}'s turn."
    move = player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, player)
      @board.display
    else 
      puts "Invalid move!"
      turn 
    end 
  end 
  def play 
    until over? 
      turn
    end 
    if won? 
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end 
  end 
end 