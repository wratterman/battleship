require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player_board'
require 'pry'

class PlayerBoardTest < Minitest::Test

  def test_it_exists
    a = PlayerBoard.new
    expected = PlayerBoard

    assert_instance_of expected, a
  end

  def test_it_has_accss_to_board_file
    a = PlayerBoard.new
    expected = Board
    actual = a.player_board

    assert_instance_of expected, actual
  end


  def test_it_has_access_to_messages_file
    a = PlayerBoard.new
    expected = Messages
    actual = a.message

    assert_instance_of expected, actual
  end

  def test_that_user_has_empty_arrays_for_two_unit_ship_and_three_unit_ship_by_default
    a = PlayerBoard.new
    expected = []

    assert_equal expected, a.user_two_unit_ship
    assert_equal expected, a.user_three_unit_ship
  end

  def test_that_intro_message_for_ship_placement_is_returned_when_called_from_messages
    a = PlayerBoard.new
    expected = "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the\nsecond is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nEnter the squares for the two-unit ship:"
    actual = a.message.two_unit_ship_placement

    assert_equal expected, actual
  end

  def test_it_takes_user_input_from_terminal_and_saves_it_as_first_coordinate_for_two_ships
    a = PlayerBoard.new
    var = a.get_first_coordinate
    var_1 = var[0]
    var_2 = var[1]

    assert (("A" .. "D").to_a).include?(var_1)
    assert (("1" .. "4").to_a).include?(var_2)
  end

  def test_it_stores_the_input_from_terminal_in_instance_first_coord
    a = PlayerBoard.new
    a.get_first_coordinate
    var = a.first_coord
    var_1 = var[0]
    var_2 = var[1]

    assert (("A" .. "D").to_a).include?(var_1)
    assert (("1" .. "4").to_a).include?(var_2)
  end

  def test_it_shovels_first_coor_into_array_containing_two_unit_boat_coordinates
    a = PlayerBoard.new
    a.place_two_unit_ship
    var = a.user_two_unit_ship
    var_1 = var[0][0]
    var_2 = var[1][0]
    var_3 = var[0][1]
    var_4 = var[1][1]

    assert_equal 2, a.user_two_unit_ship.length
    assert (("A" .. "D").to_a).include?(var_1)
    assert (("A" .. "D").to_a).include?(var_2)
    assert (("1" .. "4").to_a).include?(var_3)
    assert (("1" .. "4").to_a).include?(var_4)
  end

  def test_it_stores_another_value_when_second_value_is_called
    a = PlayerBoard.new
    a.place_two_unit_ship
    expected = 2
    actual = a.user_two_unit_ship.length

    assert_equal expected, actual
  end

  def test_it_shovels_coors_into_array_containing_three_unit_boat_coordinates
    a = PlayerBoard.new
    a.place_three_unit_ship
    var = a.user_three_unit_ship
    var_1 = var[0][0]
    var_2 = var[1][0]
    var_3 = var[2][0]
    var_4 = var[0][1]
    var_5 = var[1][1]
    var_6 = var[2][1]

    assert_equal 3, a.user_three_unit_ship.length
    assert (("A" .. "D").to_a).include?(var_1)
    assert (("A" .. "D").to_a).include?(var_2)
    assert (("A" .. "D").to_a).include?(var_3)
    assert (("1" .. "4").to_a).include?(var_4)
    assert (("1" .. "4").to_a).include?(var_5)
    assert (("1" .. "4").to_a).include?(var_5)
  end

  def test_it_stores_another_value_when_second_value_is_called
    a = PlayerBoard.new
    a.place_three_unit_ship
    expected = 3
    actual = a.user_three_unit_ship.length

    assert_equal expected, actual
  end
end
