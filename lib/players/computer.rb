require 'pry'

module Players 
  class Computer < Player 
    
    #looks for 2 of 3 win combo positions for a particular token
    #3rd space in combo must be !taken?
    #returns false if no almost win present 
    #returns FIRST almost win detected
    def almost_win(token)
      combos = Game::WIN_COMBINATIONS
      
    end 
    
    def move(board) 
      moves = ["1", "3", "5", "9", "7", "2", "4", "6", "8"]
      moves.find {|m| !board.taken?(m)}
    end 
  end 
end 

#binding.pry