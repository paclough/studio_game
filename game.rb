require_relative "player"
require_relative "game_turn"

class Game

  attr_reader :game_name

  def initialize( name )
    @game_name = name
    @players = []
  end

  def add_player( player )
    @players << player
  end

  def play( rounds )


    puts "\nThere are #{@players.size} players in #{@game_name}:"
    @players.each { |player| puts player }

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each { |treasure| puts "A #{treasure.name} is worth #{treasure.points} points" }

    1.upto( rounds ) do |round|
      if block_given?
        break if yield
      end
      puts "\n Round: #{round}"
      @players.each do |player|
        GameTurn.take_turn( player )
        # puts player
      end
    end

# knuckleheads.play(10) do
#   knuckleheads.total_points >= 2000
# end

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

  def print_name_and_health( player )
    puts "#{player.name} (#{player.health})" 
  end

  def print_stats
    strong, wimpy = @players.partition { |p| p.strong? }

    puts "\n#{game_name} Statistics:"

    puts "\n#{total_points} total points from treasures found"

    @players.sort.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end

    puts "\n#{strong.size} strong players:"
    strong.each { |p| print_name_and_health( p ) }

    puts "\n#{wimpy.size} wimpy players:"
    wimpy.each { |p| print_name_and_health( p ) }

    puts "\n#{game_name} High Scores:"
    @players.sort.each do |p|
      name_formatted = p.name.ljust( 20, '.' )
      puts "#{ name_formatted } #{ p.score }"
    end
  end

  def total_points
    @players.reduce(0) { |sum, p| sum += p.points }
  end

end
