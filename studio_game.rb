player1_name   = "larry"
player1_health = 60
player2_name   = "curly"
player2_health = 125
player3_name   = "moe"
player3_health = 100
player4_name   = "shemp"
player4_health = 90


puts "#{player1_name.capitalize} has a health of #{player1_health}."
puts "#{player2_name.upcase} has a health of #{player2_health}."

player2_health = player1_health
puts "#{player2_name.upcase} has a health of #{player2_health}."

player1_health = 30
puts "#{player1_name.capitalize} has a health of #{player1_health}."
puts "#{player2_name.upcase} has a health of #{player2_health}."
puts "#{player3_name.capitalize} has a health of #{player3_health}.".center( 50, '*' )
puts "#{player4_name.capitalize.ljust( 30, '.' )} #{player4_health} health"

game_start = Time.new
puts "The game started on #{game_start.strftime( "%A %D at %I:%M%p" ) }"

# puts "Players:\n\t#{player1_name}\n\t#{player2_name}\n\t#{player3_name}"