require './lib/board'

class ComputerBoard

  attr_reader :computer_board, :two_ship_coordinates, :three_ship_coordinates, :latitude, :longitude

  def initialize
    # @two_ship_coordinates = []
    # @three_ship_coordinates = []
    @computer_board = Board.new
    @longitude = 0
    @latitude = 0
  end

  def get_coordinates
    get_computer_coordinates_two_ship
    get_computer_coordinates_three_ship

    until any_dupicate_coordinates == true
      get_computer_coordinates_two_ship
      get_computer_coordinates_three_ship
    end

    print "Two Ships: #{@two_ship_coordinates}, Three Ship: #{@three_ship_coordinates}"
  end

  def get_computer_coordinates_two_ship
    @three_ship_coordinates = []
    2.times do
      sorting_into_two_ship
    end
    return @two_ship_coordinates
  end

  def sorting_into_two_ship
    if two_ship_coordinates.empty?
      @two_ship_coordinates << random_coordinate
    else
      @two_ship_coordinates << array_of_options.sample
    end
  end

  def random_coordinate
    range = [0, 1, 2, 3]
    @longitude = range.sample
    @latitude = range.sample
    computer_board.coordinates[longitude][latitude]
  end

  def coordinate_option_one
    if @longitude != 3
      second_computer_cordinate = computer_board.coordinates[@longitude + 1][@latitude]
      second_computer_cordinate
    else
      invalid_coordinate
    end
  end

  def coordinate_option_two
    if @longitude != 0
      second_computer_cordinate = computer_board.coordinates[@longitude - 1][@latitude]
      second_computer_cordinate
    else
      invalid_coordinate
    end
  end

  def coordinate_option_three
    if @latitude != 3
      second_computer_cordinate = computer_board.coordinates[@longitude][@latitude + 1]
      second_computer_cordinate
    else
      invalid_coordinate
    end
  end

  def coordinate_option_four
    if @latitude != 0
      second_computer_cordinate = computer_board.coordinates[@longitude][@latitude - 1]
      second_computer_cordinate
    else
      invalid_coordinate
    end
  end

  def array_of_options
    list = [coordinate_option_one, coordinate_option_two, coordinate_option_three, coordinate_option_four]
    list.delete(false)
    array_of_options = list
  end

  def get_computer_coordinates_three_ship
    @three_ship_coordinates = []
    range = [0, 1, 2, 3]
    @longitude = range.sample
    @latitude = range.sample
    3.times do
      if three_ship_coordinates.empty?
        @three_ship_coordinates << computer_board.coordinates[longitude][latitude]
      elsif three_ship_coordinates.length == 1
        @three_ship_coordinates << array_of_options.sample
      else
        @three_ship_coordinates << third_cord
      end
    end
    return three_ship_coordinates
  end

  def third_cord
    if three_ship_coordinates[0][1] == three_ship_coordinates[1][1]
      third_cord = third_cord_place_in_same_longitude
    else
      third_cord = third_cord_place_in_same_lattitude
    end
    third_cord
  end

  def third_cord_place_in_same_lattitude
    if three_ship_coordinates[0][1] < three_ship_coordinates[1][1]
      if (latitude + 2) > 3
        third_computer_coordinate = computer_board.coordinates[@longitude][@latitude - 1]
      elsif (latitude - 1) < 0
        third_computer_coordinate = computer_board.coordinates[@longitude][@latitude + 2]
      else
        third_computer_coordinate = [(computer_board.coordinates[@longitude][@latitude - 1]), (computer_board.coordinates[@longitude][@latitude + 2])].sample
      end
    elsif three_ship_coordinates[0][1] > three_ship_coordinates[1][1]
      if (latitude + 1) > 3
        third_computer_coordinate = computer_board.coordinates[@longitude][@latitude - 2]
      elsif (latitude - 2) < 0
        third_computer_coordinate = computer_board.coordinates[@longitude][@latitude + 1]
      else
        third_computer_coordinate = [(computer_board.coordinates[@longitude][@latitude + 1]), (computer_board.coordinates[@longitude][@latitude - 2])].sample
      end
    end
    third_computer_coordinate
  end

  def third_cord_place_in_same_longitude
    if three_ship_coordinates[0][0] < three_ship_coordinates[1][0]
      if (longitude + 2) > 3
        third_computer_coordinate = computer_board.coordinates[@longitude - 1][@latitude]
      elsif (longitude - 1) < 0
        third_computer_coordinate = computer_board.coordinates[@longitude + 2][@latitude]
      else
        third_computer_coordinate = [(computer_board.coordinates[@longitude -1][@latitude]), (computer_board.coordinates[@longitude + 2][@latitude])].sample
      end
    elsif three_ship_coordinates[0][0] > three_ship_coordinates[1][0]
      if (longitude + 1) > 3
        third_computer_coordinate = computer_board.coordinates[@longitude - 2][@latitude]
      elsif (longitude - 2) < 0
        third_computer_coordinate = computer_board.coordinates[@longitude + 1][@latitude]
      else
        third_computer_coordinate = [(computer_board.coordinates[@longitude + 1][@latitude]), (computer_board.coordinates[@longitude - 2][@latitude])].sample
      end
    end
    third_computer_coordinate
  end

  def any_dupicate_coordinates
    if two_ship_coordinates.any? {|coord| three_ship_coordinates.include?(coord)}
      invalid_coordinate
    else
      true
    end
  end

  def invalid_coordinate
    false
  end
end

a = ComputerBoard.new
# a.get_computer_coordinates_three_ship
