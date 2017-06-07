class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name1 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    @cups.each_index do |idx|
      unless idx == 6 || idx == 13
        4.times { @cups[idx] << :stone }
      end
    end

    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    valid_pos = (1..6).to_a + (7..12).to_a
    raise "Invalid starting cup" unless valid_pos.include?(start_pos)
  end

  def make_move(start_pos, current_player_name)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
