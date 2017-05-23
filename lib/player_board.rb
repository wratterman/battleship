require './lib/board'
require './lib/messages'

class PlayerBoard

  attr_reader :player_board, :message

  def initialize
    @player_board = Board.new
    @message = Messages.new
  end

  def place_ships_message
    message.two_unit_ship_placement
  end

  def get_first_coordinate
    puts "enter first coordinate"
    first_cord = gets.chomp
    first_cord.upcase!
  end
end
