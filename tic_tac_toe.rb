class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    @current_player = 'X'
  end

  def play
    loop do
      display_board
      player_move
      if winner?
        display_board
        puts "Player #{@current_player} wins!"
        break
      elsif draw?
        display_board
        puts "It's a draw!"
        break
      end
      switch_player
    end
  end

  private

  def display_board
    puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
    puts "---+---+---"
    puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
    puts "---+---+---"
    puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "
  end

  def player_move
    loop do
      puts "Player #{@current_player}, enter your move (row and column) as 'row,col': "
      move = gets.chomp.split(',').map(&:to_i)
      if valid_move?(move)
        @board[move[0]][move[1]] = @current_player
        break
      else
        puts "Invalid move. Try again."
      end
    end
  end

  def valid_move?(move)
    move.size == 2 &&
      move.all? { |x| x.between?(0, 2) } &&
      @board[move[0]][move[1]] == ' '
  end

  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end

  def winner?
    winning_combinations.any? do |combo|
      combo.all? { |cell| @board[cell[0]][cell[1]] == @current_player }
    end
  end

  def draw?
    @board.flatten.none? { |cell| cell == ' ' }
  end

  def winning_combinations
    rows = [[0, 0], [0, 1], [0, 2]], [[1, 0], [1, 1], [1, 2]], [[2, 0], [2, 1], [2, 2]]
    cols = [[0, 0], [1, 0], [2, 0]], [[0, 1], [1, 1], [2, 1]], [[0, 2], [1, 2], [2, 2]]
    diags = [[0, 0], [1, 1], [2, 2]], [[0, 2], [1, 1], [2, 0]]
    rows + cols + diags
  end
end

game = TicTacToe.new
game.play