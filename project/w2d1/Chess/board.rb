require_relative 'piece'
class Board
  attr_reader :grid

  def initialize(grid = Array.new(8) { Array.new(8) } )
    @grid = grid
    # @piece = piece
    @null_piece = NullPiece.instance
    make_starting_grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def dup
  end

  def move_piece(color, from_pos, to_pos)

  end

  def move_piece!(from_pos, to_pos)
    if self[from_pos].is_a?(NullPiece)
      raise "No piece at current position"
    end

    # if !self[from_pos].valid_moves.include?(to_pos)
    #   raise "Invalid move"
    # end

    self[to_pos] = self[from_pos]
    self[from_pos] = @null_piece
  end

  def checkmate?

  end

  protected

  def make_starting_grid
    @grid[1].each_index do |idx|
      pos = [1, idx]
      self[pos] = Pawn.new(self, pos, :black)
    end

    @grid[6].each_index do |idx|
      pos = [6, idx]
      self[pos] = Pawn.new(self, pos, :white)
    end

    self[[0, 0]] = Rook.new(self, [0, 0], :black)
    self[[0, 7]] = Rook.new(self, [0, 7], :black)
    self[[7, 7]] = Rook.new(self, [7, 7], :white)
    self[[7, 0]] = Rook.new(self, [7, 0], :white)

    self[[0, 1]] = Knight.new(self, [0, 1], :black)
    self[[0, 6]] = Knight.new(self, [0, 6], :black)
    self[[7, 1]] = Knight.new(self, [7, 1], :white)
    self[[7, 6]] = Knight.new(self, [7, 6], :white)

    self[[0, 2]] = Bishop.new(self, [0, 2], :black)
    self[[0, 5]] = Bishop.new(self, [0, 5], :black)
    self[[7, 2]] = Bishop.new(self, [7, 2], :white)
    self[[7, 5]] = Bishop.new(self, [7, 5], :white)

    self[[0, 3]] = Queen.new(self, [0, 3], :black)
    self[[7, 3]] = Queen.new(self, [7, 3], :white)

    self[[0, 4]] = King.new(self, [0, 4], :black)
    self[[7, 4]] = King.new(self, [7, 4], :white)

    for row in 2..5
      @grid[row].each_index do |idx|
        pos = [row, idx]
        self[pos] = @null_piece
      end
    end


  end

  def find_king(color)
  end
end
