class KnightPathFinder
  DELTA = [[1, 2], [2, 1], [2, -1], [1, -1],
          [-1, -2],[ -2, -1], [-2, 1], [-1, 2]]
  attr_reader :start_pos, :children, :visited_positions
  attr_accessor :parent

  def initialize(start_pos)
    @start_pos = start_pos
    build_move_tree
    @visited_positions = [start_pos]
  end

  def self.valid_moves(pos)
    possible_move = []
    valid_moves = []
    x, y = pos
    DELTA.each do |delta|
      dx, dy = delta
      possible_move << [x + dx, y + dy]
   end
    possible_move.each do |move|
      valid_moves << move if self.class.valid?(move)
    end
    valid_moves
  end

  def self.valid?(pos)
    pos.first.between?(0,8) && pos.last.between?(0, 8)
  end

  def new_move_positions(pos)
    self.class.valid_moves(pos).reject do |move|
      @visited_positions.include?(move)
    end
    @visited_positions << pos
    pos
  end



  def build_move_tree

  end

  # def find_path
  # end

end



kpf = KnightPathFinder.new([0, 0])
# p kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
