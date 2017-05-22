require './lib/board'

class ComputerBoard

  attr_reader :computer_board, :index, :letter, :number

  def initialize
    @computer_board = Board.new
    @index = rand(3)
    @letter = 0
    @number = 0
  end

  def first_cord
    letter = index; @letter = letter
    number = index; @number = number

    first_computer_cordinate = computer_board.coordinates[letter][number]
  end

  def second_cord
    second_computer_cordinate = computer_board.coordinates[@letter + 1][@number]
    second_computer_cordinate
  end

end

a = ComputerBoard.new
puts a.first_cord + a.second_cord
