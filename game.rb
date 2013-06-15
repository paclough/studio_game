require_relative "player"
require_relative "die"

class Game

  attr_reader :game_name

  def initialize( name )
    @game_name = name
    @players = []
  end

  def add_player( player )
    @players << player
  end

  def play

    puts "There are #{@players.size} players in #{@game_name}:"
    @players.each { |player| puts player }

    @players.each do |player|
      die = Die.new

      case die.roll
        when 5..6
          player.w00t
        when 3..4
          puts "#{player.name} was skipped"
        when 1..2
          player.blam
      end
      puts player
    end

    # @players.each do |player|
    #   rounds = 1 + rand( 4 )
    #   rounds.times do
    #     blam_or_w00t = rand( 10 )
    #     if blam_or_w00t < 5
    #       player.blam
    #     else
    #       player.w00t
    #     end
    #   end
    #   puts player
    # end

  end

end
