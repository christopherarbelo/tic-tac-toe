# frozen_string_literal: true

# class for Player creation
class Player
  attr_reader :name, :marker
  @@player_number = 0
  def initialize(name, marker)
    @name = name
    @marker = marker
    @@player_number += 1
  end

  def to_s
    "Player #{@@player_number == 1 ? 'One' : 'Two'}: #{name}, Marker: #{marker}"
  end
end

# class for Game creation
class Game
  attr_accessor :current_turn, :board
  attr_reader :player_one, :player_two
  @@round = 0
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_turn = player_one
    @board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @@round += 1
  end

  def display_guide
    puts '   Guide   '
    puts ' 0 | 1 | 2 '
    puts '-----------'
    puts ' 3 | 4 | 5 '
    puts '-----------'
    puts ' 6 | 7 | 8 '
  end

  def display_board
    puts 'Game Board'
    puts " #{display_slot 0} | #{display_slot 1} | #{display_slot 2} "
    puts '-----------'
    puts " #{display_slot 3} | #{display_slot 4} | #{display_slot 5} "
    puts '-----------'
    puts " #{display_slot 6} | #{display_slot 7} | #{display_slot 8} "
  end

  def display_game
    display_guide
    puts
    display_board
    puts
  end

  def display_slot(index)
    board[index] || ' '
  end

  def play_game
    display_game
    winner = false
    until winner
      move = ask_player_turn
      board[move] = current_turn.marker
      display_game
      winner = check_for_winner
      return winner if winner

      self.current_turn = current_turn == player_one ? player_two : player_one
    end
  end

  def ask_player_turn
    loop do
      print "#{current_turn.name}[#{current_turn.marker}] "\
      "choose an available position #{available_positions}:\t"
      input = gets.chomp.to_i
      return input if board[input].nil? && (input < 9 && !input.negative?)
    end
  end

  def check_for_winner
    possible_winning_combos = [[0, 1, 2], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6], [6, 7, 8]]
    result = possible_winning_combos.any? do |combo|
      combo.all? { |position| board[position] == current_turn.marker }
    end

    if result
      "#{current_turn.name} wins!"
    elsif !board.include?(nil)
      'tie'
    end
  end

  def available_positions
    available_index = []
    board.each_with_index { |value, index| available_index << index unless value }
    available_index
  end
end

print "Enter Players One Name:\t"
player_one_name = gets.chomp
print "Enter Players One Marker (x or o):\t"
player_one_marker = gets.chomp
player_one = Player.new player_one_name, player_one_marker
puts player_one
print "Enter Players Two Name:\t"
player_two_name = gets.chomp
player_two_marker = player_one.marker == 'x' ? 'o' : 'x'
player_two = Player.new player_two_name, player_two_marker
puts player_two
sleep 4
round = Game.new player_one, player_two
puts round.play_game
