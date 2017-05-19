class Battleship
  attr_reader :board

  def initialize
    @board = []
  end

  def start_game
    "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end
end
