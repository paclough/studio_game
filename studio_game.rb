class Player

  attr_accessor :name
  attr_reader   :health

  def initialize( name, health = 100 )
    @name = name.capitalize
    @health = health
  end

  def name=( new_name )
    @name = new_name.capitalize
  end
  
  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end
  
  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def score
    @name.length + @health
  end
  
end

class Game

  attr_reader :game_name

  def initialize( name )
    @game_name = name
    @players = []
  end

  def add_player( player )
    @players.push( player )
  end

  def play
    puts "There are #{@players.size} players in #{@game_name}:"
    @players.each { |player| puts player }

    @players.each do |player|
      rounds = 1 + rand( 4 )
      rounds.times do
        blam_or_w00t = rand( 10 )
        if blam_or_w00t < 5
          player.blam
        else
          player.w00t
        end
      end
      puts player
    end

  end

end

player1 = Player.new( "moe" )
player2 = Player.new( "larry", 60 )
player3 = Player.new( "curly", 125 )

knuckleheads = Game.new( "Knuckleheads" )
knuckleheads.add_player( player1 )
knuckleheads.add_player( player2 )
knuckleheads.add_player( player3 )
knuckleheads.play

chipmunks = Game.new( "Chipmunks" )
chipmunks.add_player( Player.new( "alvin" ) )
chipmunks.add_player( Player.new( "simon", 80 ) )
chipmunks.add_player( Player.new( "theodore", 77 ) )
chipmunks.play