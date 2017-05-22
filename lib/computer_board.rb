require './lib/board'

class ComputerBoard

  attr_reader :computer_board, :two_ship_coordinates

  def initialize
    @computer_board = Board.new
    @two_ship_coordinates = []
    @three_ship_coordinates = []
  end

  def show_coordinates
    print "Two Ships: #{get_computer_coordinates_two_ship}, Three Ship: #{get_computer_coordinates_three_ship}"
  end

  def get_computer_coordinates_two_ship
    if two_ship_coordinates.empty?
      @two_ship_coordinates << first_cord
    else
      @two_ship_coordinates << array_of_options.sample
    end
  end

  def first_cord
    range = [0, 1, 2, 3]
    letter = range.sample
    number = range.sample
    computer_board.coordinates[letter][number]
  end

  # def second_cord
  #   if invalid_coordinate
  #     first_cord
  #   else
  #     second_computer_coordinate = array_of_options.compact.sample
  #   end
  # end
  #
  # def coordinate_option_one
  #   if @letter != 3
  #     second_computer_cordinate = computer_board.coordinates[@letter + 1][@number]
  #     second_computer_cordinate
  #   else
  #     invalid_coordinate
  #   end
  # end
  #
  # def coordinate_option_two
  #   if @letter != 0
  #     second_computer_cordinate = computer_board.coordinates[@letter - 1][@number]
  #     second_computer_cordinate
  #   else
  #     invalid_coordinate
  #   end
  # end
  #
  # def coordinate_option_three
  #   if @number != 3
  #     second_computer_cordinate = computer_board.coordinates[@letter][@number + 1]
  #     second_computer_cordinate
  #   else
  #     invalid_coordinate
  #   end
  # end
  #
  # def coordinate_option_four
  #   if @number != 0
  #     second_computer_cordinate = computer_board.coordinates[@letter][@number - 1]
  #     second_computer_cordinate
  #   else
  #     invalid_coordinate
  #   end
  # end
  #
  # def array_of_options
  #   [coordinate_option_one, coordinate_option_two, coordinate_option_three, coordinate_option_four]
  # end
  #
  # def third_cord
  #   if first_cord[-1] == second_cord[-1]
  #     third_cord_place_in_same_lattitude
  #   else
  #     third_cord_place_in_same_longitude
  #   end
  # end
  #
  # def third_cord_place_in_same_lattitude
  #   if first_cord == computer_board.coordinates[letter][number - 1]
  #     third_computer_coordinate = [(computer_board.coordinates[@letter][@number - 2]), (computer_board.coordinates[@letter][@number + 1])].sample
  #   elsif first_cord == computer_board.coordinates[letter][number + 1]
  #     third_computer_coordinate = [(computer_board.coordinates[@letter][@number - 1]), (computer_board.coordinates[@letter][@number + 2])].sample
  #   end
  # end
  #
  # def third_cord_place_in_same_longitude
  #   if first_cord == computer_board.coordinates[@letter - 1][@number]
  #     third_computer_coordinate = [(computer_board.coordinates[@letter + 1][@number]), (computer_board.coordinates[@letter - 2][@number])].sample
  #   elsif first_cord == computer_board.coordinates[@letter + 1][@number]
  #     third_computer_coordinate = [(computer_board.coordinates[@letter + 2][@number]), (computer_board.coordinates[@letter -1][@number])].sample
  #   end
  # end
  #
  # def invalid_coordinate
  #   false
  # end
end
