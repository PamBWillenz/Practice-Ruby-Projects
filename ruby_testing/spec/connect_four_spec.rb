require './connect_four'

RSpec.describe ConnectFour do
  before do
    @game = ConnectFour.new
  end

  describe '#initialize' do
    it 'creates a 6x7 board' do
      expect(@game.board.size).to eq(6)
      expect(@game.board[0].size).to eq(7)
    end

    it 'sets the current player to red' do
      expect(@game.current_player).to eq(:red)
    end
  end

  describe '#drop_piece' do
    it 'drops a piece into the selected column' do
      @game.drop_piece(0)
      expect(@game.board[5][0]).to eq(:red)
    end

    it 'switches players after a piece is dropped' do
      @game.drop_piece(0)
      expect(@game.current_player).to eq(:yellow)
    end

    it 'does not allow a piece to be dropped in a full column' do
      6.times { @game.drop_piece(0) }
      expect(@game.board[0][0]).to eq(:yellow)
      expect(@game.board[1][0]).to eq(:red)
      expect(@game.board[2][0]).to eq(:yellow)
      expect(@game.board[3][0]).to eq(:red)
      expect(@game.board[4][0]).to eq(:yellow)
      expect(@game.board[5][0]).to eq(:red)
      expect { @game.drop_piece(0) }.to output("Column full!\n").to_stdout
    end
  end

  describe '#winner?' do
    it 'returns nil if there is no winner' do
      expect(@game.winner?).to be_nil
    end

    it 'detects a horizontal win' do
      @game.drop_piece(0)
      @game.drop_piece(0)
      @game.drop_piece(1)
      @game.drop_piece(1)
      @game.drop_piece(2)
      @game.drop_piece(2)
      @game.drop_piece(3)
      expect(@game.winner?).to eq(:red)
    end

    it 'detects a vertical win' do
      4.times do
        @game.drop_piece(0)
        @game.drop_piece(1) if @game.current_player == :yellow
      end
      expect(@game.winner?).to eq(:red)
    end

    it 'detects a diagonal win' do
      # Create a diagonal win pattern for red
      @game.drop_piece(3)  # red at [5,3]
      @game.drop_piece(2)  # yellow at [5,2]
      @game.drop_piece(2)  # red at [4,2]
      @game.drop_piece(1)  # yellow at [5,1]
      @game.drop_piece(1)  # red at [4,1]
      @game.drop_piece(0)  # yellow at [5,0]
      @game.drop_piece(1)  # red at [3,1]
      @game.drop_piece(0)  # yellow at [4,0]
      @game.drop_piece(0)  # red at [3,0]
      @game.drop_piece(4)  # yellow at [5,4]
      @game.drop_piece(0)  # red at [2,0] - completes diagonal win
      expect(@game.winner?).to eq(:red)
    end
  end
end