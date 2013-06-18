module StudioGame
  require_relative "player"
  require_relative "game_turn"
  require 'csv'

  class Game

    attr_reader :game_name

    def initialize( name )
      @game_name = name
      @players = []
    end

    def load_players( from_file )
      # file_players = File.readlines( from_file )
      # file_players.each do |p|
      #   add_player( Player.from_csv( p ) )
      # end
      CSV.foreach( from_file ) do |name, health|
        player = Player.new( name, Integer( health ) )
        add_player( player )
      end
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

    def print_high_scores
      output = "\n#{game_name} High Scores:"
      @players.sort.each do |p|
        name_formatted = p.name.ljust( 20, '.' )
        output += "\n#{ name_formatted } #{ p.score }"
      end
      output
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

      puts print_high_scores
    end

    def total_points
      @players.reduce(0) { |sum, p| sum += p.points }
    end

    def save_high_scores( to_file="high_scores.txt")
      File.open( to_file, "w" ) do |file|
        file.puts print_high_scores
      end
    end

  end
end