require './lib/board'
require './lib/messages'

class PlayerBoard

  attr_reader :player_board, :message, :user_two_unit_ship, :user_three_unit_ship, :first_coord, :second_coord, :third_coord, :show_user_board

  def initialize
    @player_board = Board.new
    @message = Messages.new
    @user_two_unit_ship = []
    @user_three_unit_ship = []
    @first_coord = first_coord
    @second_coord = second_coord
    @third_coord = third_coord
    @show_user_board = Board.new.print_board
  end

  def place_ships
    puts message.two_unit_ship_placement + " or (q)uit"
    place_two_unit_ship
    puts "Enter the squares for the three_unit ship: "
    place_three_unit_ship 
    puts show_user_board + "\n" + "Your ships have been placed" + "\n" + "Prepare to fire first shot."
  end

  def place_two_unit_ship
    verify_first_coord
    verify_second_coord
  end

  def verify_first_coord
    get_first_coordinate
    until check_if_valid(@first_coord) == true
      get_first_coordinate
    end
    @show_user_board.gsub!(first_coord, "B ")
    @user_two_unit_ship << first_coord
  end

  def get_first_coordinate
    puts "Please enter first coordinate: "
    first_coord = gets.chomp
    check_for_quit(first_coord)
    @first_coord = first_coord.upcase
  end

  def check_if_valid(coord)
    if check_letter_value(coord) == true && check_number_value(coord) == true
      true
    else
      false
    end
  end

  def check_letter_value(coord)
    if (("A".."D").to_a).include?(coord[0])
      true
    else
      puts message.invalid_input + "\n"
      false
    end
  end

  def check_number_value(coord)
    if (("1".."4").to_a).include?(coord[1])
      true
    else
      puts message.invalid_input + "\n"
      false
    end
  end

  def get_second_coorindate
    puts "Please enter second coordinate: "
    second_coord = gets.chomp
    check_for_quit(second_coord)
    @second_coord = second_coord.upcase!
  end

  def verify_second_coord
    get_second_coorindate
    until second_coord_is_valid(@second_coord) == true
      get_second_coorindate
    end
    @show_user_board.gsub!(second_coord, "B ")
    @user_two_unit_ship << second_coord
  end

  def second_coord_is_valid(coord)
    if check_if_valid(coord) == true && is_one_unit_away(coord) == true && has_not_already_been_placed(coord) == true
      true
    else
      false
    end
  end

  def is_one_unit_away(coord)
    if user_two_unit_ship[0][0] == coord[0]
      one_unit_horizontal(coord)
    elsif user_two_unit_ship[0][1] == coord[1]
      one_unit_vertical(coord)
    else
      puts message.invalid_input_too_many_units_away_two_ship
      false
    end
  end

  def one_unit_horizontal(coord)
    if user_two_unit_ship[0][1].to_i - coord[1].to_i == 1
      true
    elsif user_two_unit_ship[0][1].to_i - coord[1].to_i == - 1
      true
    else
      false
    end
  end

  def one_unit_vertical(coord)
    if user_two_unit_ship[0][0].ord - coord[0].ord == 1
      true
    elsif user_two_unit_ship[0][0].ord - coord[0].ord == - 1
      true
    else
      false
    end
  end

  def has_not_already_been_placed(coord)
    if user_two_unit_ship[0] == coord
      puts message.invalid_input_overlap
      false
    else
      true
    end
  end

  def place_three_unit_ship
    verify_other_first_coord
    verify_other_second_coord
    verify_third_coord
  end

  def verify_other_first_coord
    get_first_coordinate
    until check_if_valid(@first_coord) == true && check_if_unit_has_been_taken_by_other_boat(@first_coord) == true
      get_first_coordinate
    end
    @show_user_board.gsub!(first_coord, "B ")
    @user_three_unit_ship << first_coord
  end

  def check_if_unit_has_been_taken_by_other_boat(coord)
    if user_two_unit_ship.any? {|val| first_coord.include?(val)} == false
      true
    else
      puts message.invalid_input_overlap
      false
    end
  end

  def verify_other_second_coord
    get_second_coorindate
    until other_second_coord_is_valid(@second_coord) == true
      get_second_coorindate
    end
    @show_user_board.gsub!(second_coord, "B ")
    @user_three_unit_ship << second_coord
  end

  def other_second_coord_is_valid(coord)
    if check_if_valid(coord) == true && is_one_unit_away_again(coord) == true && has_not_already_been_placed(coord) == true
      true
    else
      false
    end
  end

  def is_one_unit_away_again(coord)
    if user_three_unit_ship[0][0] == coord[0]
      one_unit_horizontal_3_unit(coord)
    elsif user_three_unit_ship[0][1] == coord[1]
      one_unit_vertical_3_unit(coord)
    else
      puts message.invalid_input_too_many_units_away_three_ship
      false
    end
  end

  def one_unit_horizontal_3_unit(coord)
    if user_three_unit_ship[0][1].to_i - coord[1].to_i == 1
      true
    elsif user_three_unit_ship[0][1].to_i - coord[1].to_i == - 1
      true
    else
      false
    end
  end

  def one_unit_vertical_3_unit(coord)
    if user_three_unit_ship[0][0].ord - coord[0].ord == 1
      true
    elsif user_three_unit_ship[0][0].ord - coord[0].ord == - 1
      true
    else
      false
    end
  end

  def verify_third_coord
    get_third_coordinate
    until last_coord_is_valid(@third_coord) == true
      get_third_coordinate
    end
    @show_user_board.gsub!(third_coord, "B ")
    @user_three_unit_ship << third_coord
  end

  def get_third_coordinate
    puts "Please enter third coordinate: "
    third_coord = gets.chomp
    check_for_quit(third_coord)
    @third_coord = third_coord.upcase
  end

  def last_coord_is_valid(coord)
    if user_three_unit_ship[0][1] == user_three_unit_ship[1][1]
      three_ship_veritical_verification(coord)
    else
      three_ship_horizontal_verification(coord)
    end
  end

  def three_ship_veritical_verification(coord)
    if check_if_valid(coord) == true && has_not_already_been_placed_at_all(coord) == true && position_in_line_vert(coord)
      true
    else
      false
    end
  end

  def position_in_line_vert(coord)
    if (user_three_unit_ship[0][0].ord - coord[0].ord).abs == 2 && (user_three_unit_ship[1][0].ord - coord[0].ord).abs == 1
      true
    elsif (user_three_unit_ship[0][0].ord - coord[0].ord).abs == 1 && (user_three_unit_ship[1][0].ord - coord[0].ord).abs == 2
      true
    else
      puts message.invalid_input_too_many_units_away_three_ship
      false
    end
  end

  def three_ship_horizontal_verification(coord)
    if check_if_valid(coord) == true && has_not_already_been_placed_at_all(coord) == true && position_in_line_horizontal(coord) == true
      true
    else
      false
    end
  end

  def position_in_line_horizontal(coord)
    if (user_three_unit_ship[0][1].to_i - coord[1].to_i).abs == 2 && (user_three_unit_ship[1][1].to_i - coord[1].to_i).abs == 1
      true
    elsif (user_three_unit_ship[0][1].to_i - coord[1].ord).abs == 1 && (user_three_unit_ship[1][1].to_i - coord[1].to_i).abs == 2
      true
    else
      puts message.invalid_input_too_many_units_away_three_ship
      false
    end
  end

  def has_not_already_been_placed_at_all(coord)
    if user_two_unit_ship.any? {|val| coord.include?(val)}
      puts message.invalid_input_overlap
      false
    elsif user_three_unit_ship.any? {|val| coord.include?(val)}
      puts message.invalid_input_overlap
      false
    else
      true
    end
  end

  def check_for_quit(input)
    if input.upcase == "Q"
      puts message.quit_game
      abort
    end
  end
end
