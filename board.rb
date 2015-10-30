require_relative 'tile'
class Board

  attr_reader :grid, :bomb_num, :size

  def initialize(size = 10, bomb_num = 8)
    @grid = Array.new(size){ Array.new(size)}
    @bomb_num = bomb_num
    @size = size
    place_bomb
  end

  def display
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def flag(pos)
    @grid[pos].nil?
  end

  def bomb_spots
    already_placed = []
    size_range = (0...size).to_a
    until bomb_num == already_placed.size
      x, y = size_range.sample, size_range.sample
      already_placed << [x, y] unless already_placed.include?([x, y])
    end
    already_placed
  end

  def place_bomb
      bomb_spots.each do |pos|
        x, y = pos[0], pos[1]
        @grid[x][y] = Tile.new(:b, [x, y], self)
      end
  end


end
