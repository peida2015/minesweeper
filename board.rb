class Board

  attr_reader :grid, :bomb_num

  def initialize(size = 10, bomb_num = 8)
    @grid = Array.new(size){ Array.new(size)}
    @bomb_num = bomb_num
  end
  
end
