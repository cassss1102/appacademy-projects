class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @seq = []
    @game_over = false

  end

  def play
    until @game_over
      take_turn
      system("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep(1)
      system("clear")
      sleep(1)
    end
  end

  def require_sequence
    puts "please input a color"
    @seq.each do |color|
      user_input = gets.chomp
      if color != user_input
        @game_over = true
        break
      end
    end

  end

  def add_random_color
    @seq << COLORS.sample

  end

  def round_success_message
    puts "success round!"
  end

  def game_over_message
    puts "Game is over!"
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1
  end
end

simon = Simon.new
simon.play
