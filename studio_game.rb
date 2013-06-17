require_relative "game"

player1 = Player.new( "moe" )
player2 = Player.new( "larry", 60 )
player3 = Player.new( "curly", 125 )

knuckleheads = Game.new( "Knuckleheads" )

knuckleheads.load_players( ARGV.shift || "players.csv" )
# knuckleheads.add_player( player1 )
# knuckleheads.add_player( player2 )
# knuckleheads.add_player( player3 )

loop do
  puts "\nHow many rounds would you like to play? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when 'quit', 'q', 'exit'
    knuckleheads.print_stats
    break
  when /^\d+$/
    knuckleheads.play( answer.to_i )
  else
    puts "\nEnter the number of rounds to play or 'quit' to exit."
  end
end

knuckleheads.save_high_scores