require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
  attr_reader :board, :grid

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end
  def move(new_pos)
  end

  def render
    @board.grid.each do |row|
      row.each do |object|
        if object.is_a?(NullPiece)
          print "  "
        else
          print "#{object.symbol} "
        end
      end

      puts ""
    end

  end
end


display = Display.new(Board.new)
display.render
