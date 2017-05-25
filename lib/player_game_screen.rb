require './lib/player_board'
require './lib/computer_board'
require './lib/board'
require './lib/messages'
require './lib/computer_shot'
require '.lib/battleship'

class PlayerGameScreen

attr_reader :player_board, :computer_board, :display_board, :message, :computer_ships, :player_shot, :user_shot_list, :user_ships
attr_reader :sink_small_boat, :sink_big_boat #:computer
# attr_accessor :game_won

  def initialize
    @player_board   = PlayerBoard.new
    @computer_board = ComputerBoard.new
    @display_board  = Board.new.print_board
    @message        = Messages.new
    # @computer     = ComputerShot.new
    @user_shot_list = []
  end

  def start_new_game
    player_board.place_ships
    computer_board.get_coordinates
    @computer_ships = [computer_board.get_computer_coordinates_two_ship, computer_board.get_computer_coordinates_three_ship]
    @user_ships = [player_board.user_two_unit_ship, player_board.user_three_unit_ship]
  end

  def player_turn
    player_shot_message
    @player_shot = gets.chomp.upcase
    check_for_quit(player_shot)
    confirm_valid_shot(@player_shot)
  end

  def end_turn
    p "Press ENTER to end turn: "
    choice = gets.chomp
    check_for_quit(choice)
    user_decision(choice)
  end

  def user_decision(info)
    if info == ""
      # @computer.computer_turn
    else
      end_turn
    end
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
      p message.invalid_shot_location
      player_turn
    else
      check_for_cheat_code(input)
    end
  end

  def already_been_shot_at(input)
    user_shot_list.any? do |shot|
      shot == input
    end
  end

  def check_if_hit
    if correct_coordinate? == true
      @display_board.gsub!(player_shot, "H ")
      puts display_board
      player_hit_message
      @user_shot_list << player_shot
    else
      @display_board.gsub!(player_shot, "m ")
      puts display_board
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

  def print_shot_list
    @user_shot_list.uniq!
    user_shot_list
  end

  def check_status_of_computer_ships
    check_boats
    if sink_small_boat == "sunk" && sink_big_boat == "sunk"
      p win_game_message
      p "It only took you #{user_shot_list.length} shots to do it!"
      @game_won == true
    elsif sink_small_boat == true
      @sink_small_boat = "sunk"
      p sunk_two_unit_ship_message
    elsif sink_big_boat == true
      @sink_big_boat = "sunk"
      p sunk_battle_ship_message
    else
    end
  end

  def sunk_two_unit_shipquit
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

  def player_shot_message
    p message.player_shot
  end

  def player_hit_message
    p message.hit_message
  end

  def player_miss_message
    p message.miss_message
  end

  def alread_shot_message
    p message.invalid_shot_location
  end

  def check_for_quit(input)
    if input.upcase == "Q"
      puts message.quit_game
      abort
    end
  end
end
a = PlayerGameScreen.new
