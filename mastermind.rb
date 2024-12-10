class Mastermind
  COLORS = %w[red blue green yellow orange purple].freeze
  TURNS = 12

  def initialize
    @secret_code = Array.new(4) { COLORS.sample }
    @turns_left = TURNS
  end

  def play
    puts "Welcome to Mastermind!"
    puts "Guess the secret code consisting of 4 colors: #{COLORS.join(', ')}"
    puts "You have #{TURNS} turns to guess the code."

    until @turns_left.zero?
      guess = player_guess
      feedback = provide_feedback(guess)
      display_feedback(feedback)

      if feedback[:exact] == 4
        puts "Congratulations! You've guessed the secret code!"
        return
      else
        @turns_left -= 1
        puts "Turns left: #{@turns_left}"
      end
    end

    puts "Sorry, you've run out of turns. The secret code was: #{@secret_code.join(', ')}"
  end

  private

  def player_guess
    loop do
      puts "Enter your guess (4 colors separated by spaces):"
      guess = gets.chomp.split
      if valid_guess?(guess)
        return guess
      else
        puts "Invalid guess. Please enter 4 colors from: #{COLORS.join(', ')}"
      end
    end
  end

  def valid_guess?(guess)
    guess.size == 4 && guess.all? { |color| COLORS.include?(color) }
  end

  def provide_feedback(guess)
    exact = 0
    near = 0
    secret_code_copy = @secret_code.dup
    guess_copy = guess.dup

    # Check for exact matches
    guess.each_with_index do |color, index|
      if color == @secret_code[index]
        exact += 1
        secret_code_copy[index] = nil
        guess_copy[index] = nil
      end
    end

    # Check for near matches
    guess_copy.compact.each do |color|
      if secret_code_copy.include?(color)
        near += 1
        secret_code_copy[secret_code_copy.index(color)] = nil
      end
    end

    { exact: exact, near: near }
  end

  def display_feedback(feedback)
    puts "Exact matches: #{feedback[:exact]}"
    puts "Near matches: #{feedback[:near]}"
  end
end

game = Mastermind.new
game.play