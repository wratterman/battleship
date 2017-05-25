require './lib/player_game_screen'
require './lib/computer_shot'
require './lib/messages'

class Battleship
  attr_reader :message, :player, :cpu, :start, :user_ships, :computer_ships
  # attr_accessor :user_ships, :computer_ships

  def initialize
    @message = Messages.new
    @player = PlayerGameScreen.new
    @cpu = ComputerShot.new
  end

  def start_game
    puts message.welcome + "\n\n" + message.game_main_menu
    answer = gets.chomp.upcase
    user_choice(answer)
  end

  def user_choice(input)
    if input == "I"
      read_instructions
    elsif input == "P"
      play_game
    elsif input == "Q"
      quit_game
    else
      p "Invalid Input. Please Reenter: "
      start_game
    end
  end


  def read_instructions
    puts message.instructions
    start_game
  end

  def play_game
    begin_new_game
  end

  def begin_new_game
    player.start_new_game
    cpu.start_new_game
    turns
  end

  def get_user_and_cpu_ship_coordinates
    player_board.place_ships
    computer_board.get_coordinates
    @computer_ships = [computer_board.get_computer_coordinates_two_ship, computer_board.get_computer_coordinates_three_ship]
    @user_ships = [player_board.user_two_unit_ship, player_board.user_three_unit_ship]
  end

  def turns
    until player.game_won == true || cpu.game_won == true
      user_turn
      cpu_turn
    end
  end

  def user_turn
    player.player_turn
  end

  def cpu_turn
    cpu.computer_turn
  end

  def quit_game
    puts message.quit_game
    abort
  end
end

new_game = Battleship.new
new_game.start_game.pry
