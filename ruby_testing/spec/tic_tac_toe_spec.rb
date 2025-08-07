require './tic_tac_toe'

RSpec.describe 'Tic Tac Toe' do
  describe '#play_game' do
    it 'returns the winner when player X wins' do
      board = [
        ['X', 'O', 'X'],
        ['O', 'X', 'O'],
        ['O', 'X', 'X']
      ]
      expect(play_game(board)).to eq('Player X wins!')
    end

    it 'returns the winner when player O wins' do
      board = [
        ['X', 'O', nil],
        ['O', 'O', 'X'],
        ['X', 'O', 'O']
      ]
      expect(play_game(board)).to eq('Player O wins!')
    end

    it 'returns a draw when the board is full and no winner' do
      board = [
        ['X', 'O', 'X'],
        ['O', 'X', 'O'],
        ['O', 'X', 'O']
      ]
      expect(play_game(board)).to eq('It\'s a draw!')
    end

    it 'returns ongoing when the game is still in progress' do
      board = [
        ['X', 'O', nil],
        ['O', nil, 'X'],
        [nil, 'X', 'O']
      ]
      expect(play_game(board)).to eq('Game is still ongoing.')
    end
  end
end