# frozen_string_literal: true

# Output methods for game
module Output
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

  def display_result(result)
    return 'TIE!' if result == 'tie'

    "#{result.name} WINS!"
  end
end
