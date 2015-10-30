class Tile

  attr_reader :value, :pos, :board
  attr_accessor :revealed

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
  end

  def reveal
    @revealed = true
    @value
  end

  def neighbors
    NEIGHBOR_STEPS.map { |step| p [pos[0] + step[0], pos[1] + step[1]]  }
  end

  def neighbor_bomb_count
    neighbors.count {|neighbor| neighbor.value == :B }
  end
end
