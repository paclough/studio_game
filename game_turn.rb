require_relative 'player'
require_relative 'die'

module GameTurn

  def self.take_turn( player )
    die = Die.new

    case die.roll
      when 5..6
        player.w00t
      when 3..4
        puts "#{player.name} was skipped"
      when 1..2
        player.blam
    end
  end
end