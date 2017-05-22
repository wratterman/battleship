require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_board'

class ComputerBoardTest < Minitest::Test

  def test_it_exists
    c = ComputerBoard.new
    expected = ComputerBoard
    actual = c.class

    assert_equal expected, actual
  end

  def test_it_has_access_to_map_file
    c = ComputerBoard.new
    expected = Board
    actual = c.computer_board.class

    assert_equal expected, actual
  end

  def test_it_gets_coordinates
    c = ComputerBoard.new
    expected = ["B1", "B2"]
    actual = c.get_computer_coordinates

    assert_equal expected, actual
  end

  # def test_it_has_a_first_coordinate_method
  #   c = ComputerBoard.new
  #   expected = c.computer_board.coordinates.any?
  #   actual = c.first_cord
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_it_has_a_second_coordinate_method
  #   c = ComputerBoard.new
  #   c.first_cord
  #   expected = c.computer_board.coordinates.any?
  #   actual = c.second_cord
  #
  #   assert_equal expected, actual
  # end
end
