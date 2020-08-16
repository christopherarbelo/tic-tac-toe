# frozen_string_literal: true

require_relative 'output'

# Tic Tac Toe class
class TicTacToe
  include Output
  attr_accessor :current_turn, :board
  attr_reader :player_one, :player_two
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_turn = player_one
    @board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  def play_game
    display_game
    result = nil
    until result
      board[ask_player_turn] = current_turn.marker
      display_game
      result = winner || tie
      self.current_turn = current_turn == player_one ? player_two : player_one
    end
    display_result(result)
  end

  def ask_player_turn
    loop do
      print "#{current_turn.name}[#{current_turn.marker}] "\
      "choose an available position #{available_positions}:\t"
      input = gets.chomp.to_i
      return input if board[input].nil? && (0..8).include?(input)
    end
  end

  def winner
    return player_one if winning_combo?(player_one)
    return player_two if winning_combo?(player_two)
  end

  def tie
    return 'tie' unless board.include? nil
  end

  def winning_combo?(player)
    possible_winning_combos = [[0, 1, 2], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6], [6, 7, 8]]
    possible_winning_combos.any? do |combo|
      combo.all? { |position| board[position] == player.marker }
    end
  end

  def available_positions
    available_index = []
    board.each_with_index { |value, index| available_index << index unless value }
    available_index
  end
end
