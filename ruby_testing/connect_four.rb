class ConnectFour
  attr_accessor :board, :current_player

  def initialize
    @board = Array.new(6) { Array.new(7, nil) }
    @current_player = :red
  end

  def drop_piece(column)
    row = @board.rindex { |r| r[column].nil? }
    if row
      @board[row][column] = @current_player
      switch_player
      true
    else
      puts "Column full!"
      false
    end
  end

  def switch_player
    @current_player = @current_player == :red ? :yellow : :red
  end

  def winner?
    # Check horizontal wins
    (0..5).each do |row|
      (0..3).each do |col|
        if @board[row][col] && 
           @board[row][col] == @board[row][col+1] &&
           @board[row][col] == @board[row][col+2] &&
           @board[row][col] == @board[row][col+3]
          return @board[row][col]
        end
      end
    end

    # Check vertical wins
    (0..2).each do |row|
      (0..6).each do |col|
        if @board[row][col] && 
           @board[row][col] == @board[row+1][col] &&
           @board[row][col] == @board[row+2][col] &&
           @board[row][col] == @board[row+3][col]
          return @board[row][col]
        end
      end
    end

    # Check diagonal wins (top-left to bottom-right)
    (0..2).each do |row|
      (0..3).each do |col|
        if @board[row][col] && 
           @board[row][col] == @board[row+1][col+1] &&
           @board[row][col] == @board[row+2][col+2] &&
           @board[row][col] == @board[row+3][col+3]
          return @board[row][col]
        end
      end
    end

    # Check diagonal wins (top-right to bottom-left)
    (0..2).each do |row|
      (3..6).each do |col|
        if @board[row][col] && 
           @board[row][col] == @board[row+1][col-1] &&
           @board[row][col] == @board[row+2][col-2] &&
           @board[row][col] == @board[row+3][col-3]
          return @board[row][col]
        end
      end
    end

    nil
  end
end