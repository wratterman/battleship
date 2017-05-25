require './lib/player_game_screen'
require './lib/computer_shot'
require './start_game'

class Battleship

  attr_reader   :player, :cpu
  attr_accessor :user_ships, :computer_ships

  def initialize
    @player = PlayerGameScreen.new
    @cpu = ComputerShot.new
  end

  def welcome
    start = StartGame.new
    start.start_game
  end

  def begin_new_game
    player.start_game
    turns
  end

  def place_ships
    player_board.place_ships
    computer_board.get_coordinates
    @computer_ships = [computer_board.get_computer_coordinates_two_ship, computer_board.get_computer_coordinates_three_ship]
    @user_ships = [player_board.user_two_unit_ship, player_board.user_three_unit_ship]
  end

  def turns
    until game_won == true
      user_turn
      computer_turn
    end
  end

  def user_turn
    player.player_turn
  end

  def cpu_turn
    cpu.computer_turn
  end
end

new_game = Battleship.new
new_game.welcome
