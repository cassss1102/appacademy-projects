module Steppable

  def moves
    case move_dirs
    when :king
      valid_moves = []
      valid_moves += moves_holder(0, -1)
      valid_moves += moves_holder(0, 1)
      valid_moves += moves_holder(-1, -1)
      valid_moves += moves_holder(1, 1)
      valid_moves += moves_holder(1, -1)
      valid_moves += moves_holder(-1, 1)
      valid_moves += moves_holder(-1, 0)
      valid_moves += moves_holder(1, 0)
      valid_moves
    when :knight
      valid_moves = []
      valid_moves += moves_holder(2, -1)
      valid_moves += moves_holder(2, 1)
      valid_moves += moves_holder(-2, -1)
      valid_moves += moves_holder(-2, 1)
      valid_moves += moves_holder(1, -2)
      valid_moves += moves_holder(1, 2)
      valid_moves += moves_holder(-1, -2)
      valid_moves += moves_holder(-1, 2)
      valid_moves
    end
  end

  def moves_holder(row_diff, col_diff)
    valid_moves = []

    row, col = @pos
    position = [row, col]

    row += row_diff
    col += col_diff

    if @board[position].is_a?(NullPiece)
      valid_moves << position
    elsif @board[position].color != self.color
      valid_moves << position
    end

    valid_moves
  end

end
