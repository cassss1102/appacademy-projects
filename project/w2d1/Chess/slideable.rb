module Slideable

  def moves
    case move_dirs
    when :straight
      moves_straight
    when :diagonal
      moves_diagonal
    when :both
      moves_straight + moves_diagonal
    end
  end

  def moves_holder(row_diff, col_diff)
    valid_moves = []

    row, col = @pos
    position = [row, col]

    row += row_diff
    col += col_diff

    while @board[position].is_a?(NullPiece)
      valid_moves << position
      row += row_diff
      col += col_diff
    end

    if @board[position].color != self.color
      valid_moves << position
    end

    valid_moves
  end

  def moves_straight
    valid_moves = []
    valid_moves += moves_holder(0, 1)
    valid_moves += moves_holder(0, -1)
    valid_moves += moves_holder(-1, 0)
    valid_moves += moves_holder(1, 0)
    valid_moves
  end

  def moves_diagonal
    valid_moves = []
    valid_moves += moves_holder(1, 1)
    valid_moves += moves_holder(1, -1)
    valid_moves += moves_holder(-1, -1)
    valid_moves += moves_holder(-1, 1)
    valid_moves
  end
#
#   def moves_straight
#     valid_moves = []
#     # Right positions
#     row, col = @pos
#     right_pos = [row, col]
#     col += 1
#
#     while @board[right_pos].is_a?(NullPiece)
#       valid_moves << right_pos
#       col += 1
#     end
#
#     if @board[right_pos].color != self.color
#       valid_moves << right_pos
#     end
#
#     # Left positions
#     row, col = @pos
#     left_pos = [row, col]
#     col -= 1
#
#     while @board[left_pos].is_a?(NullPiece)
#       valid_moves << left_pos
#       col -= 1
#     end
#
#     if @board[left_pos].color != self.color
#       valid_moves << left_pos
#     end
#
#     # Down positions
#     row, col = @pos
#     down_pos = [row, col]
#     row += 1
#
#     while @board[down_pos].is_a?(NullPiece)
#       valid_moves << down_pos
#       row += 1
#     end
#
#     if @board[down_pos].color != self.color
#       valid_moves << down_pos
#     end
#
#     # Up positions
#     row, col = @pos
#     up_pos = [row, col]
#     row -= 1
#
#     while @board[up_pos].is_a?(NullPiece)
#       valid_moves << up_pos
#       row -= 1
#     end
#
#     if @board[up_pos].color != self.color
#       valid_moves << up_pos
#     end
#
#     valid_moves
#   end
#
#   def moves_diagonal
#     valid_moves = []
#
#     row, col = @pos
#     upright_pos = [row, col]
#     row -= 1
#     col += 1
#
#     while @board[upright_pos].is_a?(NullPiece)
#       valid_moves << upright_pos
#       row -= 1
#       col += 1
#     end
#
#     if @board[upright_pos].color != self.color
#       valid_moves << upright_pos
#     end
#
#     # Left positions
#     row, col = @pos
#     downright_pos = [row, col]
#     row += 1
#     col += 1
#
#     while @board[downright_right].is_a?(NullPiece)
#       valid_moves << downright_right
#       row += 1
#       col += 1
#     end
#
#     if @board[downright_right].color != self.color
#       valid_moves << downright_right
#     end
#
#     # Down positions
#     row, col = @pos
#     downleft_pos = [row, col]
#     row += 1
#     col -= 1
#
#     while @board[downleft_pos].is_a?(NullPiece)
#       valid_moves << downleft_pos
#       row += 1
#       col -= 1
#     end
#
#     if @board[downleft_pos].color != self.color
#       valid_moves << downleft_pos
#     end
#
#     # Up positions
#     row, col = @pos
#     upleft_pos = [row, col]
#     row -= 1
#     col -= 1
#
#     while @board[upleft_pos].is_a?(NullPiece)
#       valid_moves << upleft_pos
#       row -= 1
#       col -= 1
#     end
#
#     if @board[upleft_pos].color != self.color
#       valid_moves << upleft_pos
#     end
#
#     valid_moves
#   end
# end
end
