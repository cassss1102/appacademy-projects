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
    valid_pos = (1..12).to_a
    raise "Invalid starting cup" unless valid_pos.include?(start_pos)
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    idx = start_pos + 1
    until stones.empty?
      if current_player_name == @name1 && idx == 13
        next
      elsif current_player_name == @name2 && idx == 6
        next
      else
        @cups[idx] << stones.shift
      end
      idx += 1
    end

    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if @cups[ending_cup_idx].length == 1
      :switch
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      :promt
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
    (0..5).all? { |idx| @cups[idx].empty?} || (7..12).all? { |idx| @cups[idx].empty?}
  end

  def winner
    player1_score = @cups[6].size
    player2_score = @cups[13].size

    if player1_score == player2_score
      :draw
    else
      player1_score > player2_score ? "#{@name1} wins!" : "#{@name2} wins!"
    end
  end 
end
