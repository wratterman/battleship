require './lib/messages'

class StarGame
  attr_reader :board, :input

  def initialize
    @board = []
    @input = input
  end

  def start_game
    puts "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    get_input
  end

  def play_game
    start_game
    if @input == "p"
      "starting game"
    end
  end

  def read_instructions
    start_game
    if @input == "i"
      "If you don't know how to play I can't help you"
    end
  end

  def get_input
    @input = gets.chomp
  end
end

a = StarGame.new
a.start_game
