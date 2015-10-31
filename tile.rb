require_relative 'board.rb'

class Tile

  attr_reader :value, :pos, :board
  attr_accessor :revealed, :flagged

  NEIGHBOR_STEPS = [[0,  1],
                    [0, -1],
                    [-1, 1],
                    [-1, 0],
                    [-1,-1],
                    [1,  1],
                    [1,  0],
                    [1, -1] ]

  def initialize(value = nil, pos = [0,0], board)
    @value = value
    @pos = pos
    @board = board
    @revealed = false
    @flagged = false
  end

  def reveal
    @revealed = true
    @value
  end

  def neighbors
    all_neighbors = NEIGHBOR_STEPS.map { |step| [pos[0] + step[0], pos[1] + step[1]]  }
    all_neighbors.select do |pos|
      (pos[0] >= 0 && pos[0] < @board.grid.size) &&
      (pos[1] >= 0 && pos[1] < @board.grid.size)
    end
  end

  def inspect
    if flagged
      "f"
    else
      "#{@value}"
    end
  end

  def neighbor_bomb_count ####FIX THIS
    neighbors.count {|neighbor| !@board[neighbor].nil? && board[neighbor].value == :b }
  end
end
