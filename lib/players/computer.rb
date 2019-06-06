require 'pry'

module Players 
  class Computer < Player 
    
    #looks for 2 of 3 win combo positions for a particular token
    #3rd space in combo must be !taken?
    #returns false if no almost win present 
    #returns FIRST almost win detected
    def almost_win(token)
      combos = Game::WIN_COMBINATIONS
      board = Game.board.cells
      combos.each do |c|
        tokens = 0
        blanks = 0 
        win_space = ""
        c.each do |position|
          if board[position] == token
            tokens += 1 
          elsif board[position] == " "
            blanks += 1 
            win_space = (position + 1).to_s
          end 
        end 
        #after each combo check for an almost win and reset counters
        if tokens == 2 && blanks == 1 
          return 
        end 
      end 
      
    end 
    
    def move(board) 
      moves = ["1", "5", "3", "9", "7", "2", "4", "6", "8"]
      moves.find {|m| !board.taken?(m)}
    end 
  end 
end 

#binding.pry