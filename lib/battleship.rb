class Battleship
  attr_reader :board

  def initialize
    @board = []
  end

  def start_game
    puts "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end
end

a = Battleship.new
a.start_game
