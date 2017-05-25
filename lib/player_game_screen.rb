require './lib/player_board'
require './lib/computer_board'
require './lib/board'
require './lib/messages'

class PlayerGameScreen

attr_reader :player_board, :computer_board, :display_board, :message, :user_ships, :computer_ships, :player_shot, :user_shot_list
attr_reader :sink_small_boat, :sink_big_boat

  def initialize
    @player_board = PlayerBoard.new
    @computer_board = ComputerBoard.new
    @display_board = Board.new
    @message = Messages.new
    @user_shot_list = []
  end

  def start_new_game
    player_board.place_ships
    computer_board.get_coordinates
    @computer_ships = [computer_board.get_computer_coordinates_two_ship, computer_board.get_computer_coordinates_three_ship]
    @user_ships = [player_board.user_two_unit_ship, player_board.user_three_unit_ship]
  end

  def player_shot_message
    p message.player_shot
  end

  def player_hit_message
    p message.hit_message
  end

  def player_miss_message
    p message.miss_message
  end

  def player_turn
    player_shot_message
    @player_shot = gets.chomp.upcase
    check_for_cheat_code(player_shot)
    check_if_hit
    2.times do
      check_status_of_computer_ships
    end
  end

  def check_if_hit
    if correct_coordinate? == true
      player_hit_message
      @user_shot_list << player_shot
    else
      player_miss_message
      @user_shot_list << player_shot
    end
  end

  def correct_coordinate?
    if correct_two_unit_ship_coordinate == true || correct_three_unit_ship_coordinate == true
      @computer_ships[0].delete(player_shot)
      @computer_ships[1].delete(player_shot)
      true
    else
      false
    end
  end

  def correct_two_unit_ship_coordinate
    computer_ships[0].any? do |coord|
      player_shot == coord
    end
  end

  def correct_three_unit_ship_coordinate
    computer_ships[1].any? do |coord|
      player_shot == coord
    end
  end

  def cheat_code
    p computer_ships
  end

  def check_for_cheat_code(input)
    if input.upcase == "I AM A CHEATER"
      cheat_code
    else
      input = input
    end
  end

  def check_status_of_computer_ships
    check_boats
    if sink_small_boat == "sunk" && sink_big_boat == "sunk"
      p win_game_message
    elsif sink_small_boat == true
      @sink_small_boat = "sunk"
      p sunk_two_unit_ship_message
    elsif sink_big_boat == true
      @sink_big_boat = "sunk"
      p sunk_battle_ship_message
    else
    end
  end

  def sunk_two_unit_ship
    if computer_ships[0].empty?
      @sink_small_boat = true
    else
      false
    end
  end

  def sunk_two_unit_ship_message
    message.sink_message_two_ship
  end

  def sunk_battle_ship
    if computer_ships[1].empty?
      @sink_big_boat = true
    else
      false
    end
  end

  def sunk_battle_ship_message
    message.sink_message_three_ship
  end

  def check_boats
    stop_if_sunk_small_boat
    stop_if_sunk_big_boat
  end

  def stop_if_sunk_small_boat
    if @sink_small_boat != "sunk"
      sunk_two_unit_ship
    end
  end

  def stop_if_sunk_big_boat
    if @sink_big_boat != "sunk"
      sunk_battle_ship
    end
  end

  def win_game_message
    message.win_game
  end
end
a = PlayerGameScreen.new
