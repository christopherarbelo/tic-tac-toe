# frozen_string_literal: true

require './lib/tic_tac_toe'
require './lib/player'

describe TicTacToe do
  player_one = Player.new('John', 'x')
  player_two = Player.new('Emily', 'o')
  game = TicTacToe.new(player_one, player_two)
  describe '#winner?' do
    it 'Player one wins' do
      game.board = ['x', 'x', 'x', 'o', 'o', nil, nil, nil, nil]
      expect(game.winner).to eql(player_one)
    end
    it 'Player two wins' do
      game.board = %w[x o x x o o o o x]
      expect(game.winner).to eql(player_two)
    end
  end

  describe '#tie' do
    it 'Result is a tie' do
      game.board = %w[x o x x o o o x x]
      expect(game.tie).to eql('tie')
    end
  end
end
