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
