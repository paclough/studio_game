module StudioGame
  require_relative 'player'
  require_relative 'die'
  require_relative 'treasure_trove'
  require_relative 'loaded_die'

  module GameTurn

    def self.take_turn( player )
      die = Die.new
      # die = LoadedDie.new

      case die.roll
        when 1..2
          player.blam
        when 3..4
          puts "#{player.name} was skipped"
        when 5..6
          player.w00t
      end

      treasure = TreasureTrove.random
      player.found_treasure( treasure )

    end
  end
end