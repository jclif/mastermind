class Mastermind
  @@colors = %w(R G B Y O P)

  def initialize
    @combo = []
    4.times { @combo << @@colors.sample }
    @guesses = []
    @match_info = []
  end

  def play
    until end?
      display
      input
    end
    if win?
      puts "You Win! DANCE PARTY!!!"
    else
      puts "You Lose!"
    end
  end

  def end?
    win? || @guesses.length > 9
  end

  def win?
    @guesses.include?(@combo)
  end

  def display
    @guesses.length.times do |i|
      puts "#{i} #{@guesses[i]} #{@match_info[i]}"
    end
  end

  def match(guess_i)
    result = []
    @guesses[guess_i].each_with_index do |peg, i|
      if peg == @combo[i]
        result << "R"
      elsif @combo[i].include?(peg)
        result << "W"
      end
    end

    result
  end

  def input
    puts "Next Move? (i.e. 'R G Y O')"
    move = gets.chomp.split
    is_valid = move.all? { |peg| @@colors.include?(peg) }
    until move.length == 4 && is_valid
      puts "Invalid move, try again."
      move = gets.chomp.split
      is_valid = move.all? { |peg| @@colors.include?(peg) }
    end
    @guesses << move
    @match_info << match(@guesses.length-1)
  end
end

if __FILE__ == $PROGRAM_NAME
  h = Hangman.new(1)
  h.play
  p "adef"
end
