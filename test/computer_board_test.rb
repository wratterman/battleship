require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_board'
require 'pry'

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

  def test_it_accesses_coordinates_from_board_file
    c = ComputerBoard.new
    var = c.random_coordinate
    first_var = var[0]
    second_var = var[1]

    assert (("A".."D").to_a).include?(first_var)
    assert (("1".."4").to_a).include?(second_var)
  end

  def test_it_runs_random_coordinate_method_and_stores_through_get_coordinates_method
    c = ComputerBoard.new
    var = c.get_computer_coordinates_two_ship.join
    first_var = var[0]
    second_var = var[1]

    assert (("A".."D").to_a).include?(first_var)
    assert (("1".."4").to_a).include?(second_var)
  end

  def test_it_stores_random_coordinate_into_two_ship_coordinates
    c = ComputerBoard.new
    c.get_computer_coordinates_two_ship.join
    var = c.two_ship_coordinates.join
    first_var = var[0]
    second_var = var[1]

    assert (("A".."D").to_a).include?(first_var)
    assert (("1".."4").to_a).include?(second_var)
  end

  def test_it_updates_longitude_based_on_random_cordinate_position_in_original_board
    c = ComputerBoard.new
    c.get_computer_coordinates_two_ship
    var = c.longitude

    assert (0 .. 3).include?(var)
  end

  def test_it_updates_latitude_based_on_random_cordinate_position_in_original_board
    c = ComputerBoard.new
    c.get_computer_coordinates_two_ship
    var = c.latitude

    assert (0 .. 3).include?(var)
  end

  def test_get_computer_coordinates_works_for_three_ships
    c = ComputerBoard.new
    var = c.get_computer_coordinates_three_ship.join
    first_var = var[0]
    second_var = var[1]
    third_var = var[2]
    fourth_var = var[3]
    fifth_var = var[4]
    sixth_var = var[5]

    assert (("A".."D").to_a).include?(first_var)
    assert (("1".."4").to_a).include?(second_var)
    assert (("A".."D").to_a).include?(third_var)
    assert (("1".."4").to_a).include?(fourth_var)
    assert (("A".."D").to_a).include?(fifth_var)
    assert (("1".."4").to_a).include?(sixth_var)
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
