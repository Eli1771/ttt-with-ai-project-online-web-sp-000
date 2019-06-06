require 'pry'

module Players 
  class Computer < Player 
    
    #looks for 2 of 3 win combo positions for a particular token
    #3rd space in combo must be !taken?
    #returns false if no almost win present 
    #returns FIRST almost win detected
    def almost_win(token)
      combos = Game::WIN_COMBINATIONS
      xs = 0
      os = 0 
      blanks = 0 
      combos.each do |c|
        
      end 
      
    end 
    
    def move(board) 
      moves = ["1", "5", "3", "9", "7", "2", "4", "6", "8"]
      moves.find {|m| !board.taken?(m)}
    end 
  end 
end 

#binding.pry