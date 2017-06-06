require 'singleton'
# require 'slideable'

class Piece
  attr_reader :color

  def initialize(color = nil)
    @color = color
  end

  def to_s
    self.symbol
  end

  def empty?
  end

  def symbol
  end

  def valid_moves
  end

  private

  def move_into_check(to_pos)
  end
end

class Pawn < Piece
  def symbol
    if color == :white
      :♙
    else
      :♟
    end
  end

  def moves
  end

  protected
  def at_start_row?
  end

  def forward_dir
  end

  def forward_steps
  end

  def side_attacks
  end
end

class NullPiece < Piece
  include Singleton
  def moves
  end
end

class Bishop < Piece
  # include Slideable
  def symbol
    if color == :white
      :♗
    else
      :♝
    end
  end

  protected

  def move_dirs
  end
end

class Rook < Piece
  # include Slideable

  def symbol
    if color == :white
      :♖
    else
      :♜
    end
  end
  protected

  def move_dirs
  end

end

class Queen < Piece
# include Slideable

  def symbol
    if color == :white
      :♕
    else
      :♛
    end
  end
  protected

  def move_dirs
  end
end

class King < Piece
  # include Stepable

  def symbol
    if color == :white
      :♔
    else
      :♚
    end
  end

  protected

  def move_dirs
  end
end

class Knight < Piece
  # include Stepable

  def symbol
    if color == :white
      :♘
    else
      :♞
    end
  end

  protected
  def move_dirs
  end
end
