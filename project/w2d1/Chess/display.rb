require_relative 'board'
require_relative 'cursor'
require 'colorize'
require 'byebug'

class Display
  attr_reader :board, :grid

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def move(new_pos)
  end

  def square_color(pos)
    row, col = pos

    if (row.even? && col.odd?) || (row.odd? && col.even?)
      :light_black
    else
      :white
    end
  end

  def render
    i = 8

    @board.grid.each_with_index do |row, row_i|
      print "#{i} "
      row.each_with_index do |object, col_i|
        if @cursor.cursor_pos == [row_i, col_i]
          color = :blue
        else
          color = square_color([row_i, col_i])
        end

        if object.is_a?(NullPiece)
          print "  ".colorize(:background => color)
        else
          print "#{object.symbol} ".colorize(:background => color)
        end
      end

      i -= 1
      puts ""
    end

    puts "  a b c d e f g h"
  end

  def cursor_test
    loop do
      render
      @cursor.get_input
      system("clear")
    end
  end
end

board = Board.new
display = Display.new(board)
p board[[7, 7]].moves
