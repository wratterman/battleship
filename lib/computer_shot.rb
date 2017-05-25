require './lib/board'
require './lib/messages'
require './lib/player_board'
require './lib/player_game_screen'

class ComputerShot

  attr_reader :board, :comp_shot_list, :computer_shot, :sink_small_boat, :sink_big_boat, :player_board, :message, :game_won, :user_ships

  def initialize
    @board          = Board.new
    @comp_shot_list = []
    @message        = Messages.new
    @game_won       = false
    @player_board   = PlayerBoard.new
  end

  def start_new_game
    player_board.place_ships
    @user_ships = [player_board.user_two_unit_ship, player_board.user_three_unit_ship]
  end

  def computer_turn
    @computer_shot = board.coordinates.sample.sample
    puts "The CPU shot at #{computer_shot}."
    confirm_valid_shot(@computer_shot)
  end

  def confirm_valid_shot(input)
    duplicate_shot(input)
    check_if_hit
    2.times do
      check_status_of_user_ships
    end
  end

  def duplicate_shot(input)
    if already_been_shot_at(input) == true
      computer_turn
    else
    end
  end

  def already_been_shot_at(input)
    comp_shot_list.any? do |shot|
      shot == input
    end
  end

  def check_if_hit
    if correct_coordinate? == true
      @comp_shot_list << computer_shot
      puts "The CPU Hit your ship!"
    else
      @comp_shot_list << computer_shot
      puts "The CPU Missed everything!"
    end
  end

  def correct_coordinate?
    if correct_two_unit_ship_coordinate == true || correct_three_unit_ship_coordinate == true
      @user_ships[0].delete(computer_shot)
      @user_ships[1].delete(computer_shot)
      true
    else
      false
    end
  end

  def correct_two_unit_ship_coordinate
    user_ships[0].any? do |coord|
      computer_shot == coord
    end
  end

  def correct_three_unit_ship_coordinate
    user_ships[1].any? do |coord|
      computer_shot == coord
    end
  end

  def check_status_of_user_ships
    check_boats
    if sink_small_boat == "sunk" && sink_big_boat == "sunk"
      p lose_message
      @game_won = true
    elsif sink_small_boat == true
      puts "The CPU Sunk your Two-Unit Boat!"
      @sink_small_boat = "sunk"
    elsif sink_big_boat == true
      puts "The CPU Sunk your Battleship!"
      @sink_big_boat = "sunk"
    else
    end
  end

  def sunk_two_unit_ship
    if user_ships[0].empty?
      @sink_small_boat = true
    else
      false
    end
  end

  def sunk_battle_ship
    if user_ships[1].empty?
      @sink_big_boat = true
    else
      false
    end
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

  def lose_message
    message.losing_message
  end
end
