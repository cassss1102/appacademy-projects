require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) {[]}
    @cups.each_with_index do |cup, i|
      unless i == 6 || i == 13
        4.times { cup << :stone }
      end
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1,5) || start_pos.between?(7, 12)
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    # debugger
    i = start_pos
    until stones.empty?
      i += 1
      i = 0 if i > 13
      if i == 6
        @cups[6] << stones.shift if current_player_name == @name1
      elsif i == 13
        @cups[13] << stones.shift if current_player_name == @name2
      else
        @cups[i] << stones.shift
      end
    end
    # cup_idx = start_pos
    # until stones.empty?
    #   cup_idx += 1
    #   cup_idx = 0 if cup_idx > 13
    #   # places stones in the correct current player's cups
    #   if cup_idx == 6
    #     @cups[6] << stones.pop if current_player_name == @name1
    #   elsif cup_idx == 13
    #     @cups[13] << stones.pop if current_player_name == @name2
    #   else
    #     @cups[cup_idx] << stones.pop
    #   end
    # end

    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif
      @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |i| @cups[i].empty? } || (7..12).all? { |i| @cups[i].empty? }
  end

  def winner
    x = @cups[6].count
    y = @cups[13].count
    case x <=> y
    when 0
      :draw
    when -1
      @name2
    when 1
      @name1
    end
  end
end
