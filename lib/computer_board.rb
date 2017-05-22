require './lib/board'

class ComputerBoard

  attr_reader :computer_board, :index, :letter, :number

  def initialize
    @computer_board = Board.new
    @index = rand(3)
    @letter = 0
    @number = 0
  end

  def get_computer_coordinates
    computer_coordinates = [first_cord, second_cord]
  end

  def first_cord
    letter = index; @letter = letter
    number = index; @number = number

    first_computer_cordinate = computer_board.coordinates[letter][number]
  end

  def second_cord
    second_computer_coordinate = array_of_options.compact.sample
  end

  def coordinate_option_one
    if @letter != 3
      second_computer_cordinate = computer_board.coordinates[@letter + 1][@number]
      second_computer_cordinate
    else
      invalid_coordinate
    end
  end

  def coordinate_option_two
    if @letter != 0
      second_computer_cordinate = computer_board.coordinates[@letter - 1][@number]
      second_computer_cordinate
    else
      invalid_coordinate
    end
  end

  def coordinate_option_three
    if @number != 3
      second_computer_cordinate = computer_board.coordinates[@letter][@number + 1]
      second_computer_cordinate
    else
      invalid_coordinate
    end
  end

  def coordinate_option_four
    if @number != 0
      second_computer_cordinate = computer_board.coordinates[@letter][@number - 1]
      second_computer_cordinate
    else
      invalid_coordinate
    end
  end

  def array_of_options
    [coordinate_option_one, coordinate_option_two, coordinate_option_three, coordinate_option_four]
  end

  def invalid_coordinate
    first_cord = first_cord
  end
end
#
a = ComputerBoard.new
a.get_computer_coordinates
