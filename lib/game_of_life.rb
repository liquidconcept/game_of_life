#
# Conway's Game of Life
# http://en.wikipedia.org/wiki/Conway's_Game_of_Life
#
module GameOfLife
  class Game
    def initialize(board="")
      @board=board
    end
    def run(nb=1)
      r=""
      nb.times do
        r+=@board
      end
      return r
    end
    
    def board
      @board
    end
    def to_s
      @board
    end
  end
end
