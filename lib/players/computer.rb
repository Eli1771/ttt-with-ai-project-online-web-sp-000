require 'pry'

module Players 
  class Computer < Player 
    def move(board) 
      moves = ["1", "5", "3", "9", "7", "2", "4", "6", "8"]
      moves.find {|m| !board.taken?(m)}
    end 
  end 
end 

#binding.pry