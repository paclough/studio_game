require_relative 'player'

class BerserkPlayer < Player

  def initialize( name, health = 100 )
    @w00ts = 0
    super( name, health )
  end

  def berserk?
    @w00ts > 5
  end

  def w00t
    super
    @w00ts += 1
    puts "#{name} is berserk!" if berserk?
  end

  def blam
    if berserk?
      w00t
    else
      super
    end
  end
end