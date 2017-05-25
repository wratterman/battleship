require './lib/player_board'
require './lib/computer_board'
require './lib/board'
require './lib/messages'
require './lib/player_game_screen'

class ComputerShot

  attr_reader :player, :board, :comp_shot_list, :computer_shot, :sink_small_boat, :sink_big_boat
  attr_accessor :user_ships

  def initialize
    @player = PlayerGameScreen.new
    @board = Board.new
    @comp_shot_list = []
  end

  def computer_turn
    @computer_shot = board.coordinates.sample.sample
    confirm_valid_shot(@computer_shot)
    @player.player_shot
  end

  def confirm_valid_shot(input)
    duplicate_shot(input)
    check_if_hit
    2.times do
      check_status_of_computer_ships
    end
    print_shot_list
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
    else
      @comp_shot_list << computer_shot
    end
  end

  def correct_coordinate?
    if correct_two_unit_ship_coordinate == true || correct_three_unit_ship_coordinate == true
      @user_ships[0].delete(player_shot)
      @user_ships[1].delete(player_shot)
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
      player_shot == coord
    end
  end

  def check_status_of_computer_ships
    check_boats
    if sink_small_boat == "sunk" && sink_big_boat == "sunk"
    elsif sink_small_boat == true
      @sink_small_boat = "sunk"
    elsif sink_big_boat == true
      @sink_big_boat = "sunk"
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

  def sunk_battle_ship
    if computer_ships[1].empty?
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
end
