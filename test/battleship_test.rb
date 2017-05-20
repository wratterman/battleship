require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'

class BattleshipTest < Minitest::Test

  def test_it_exists
    ship = Battleship.new
    expected = Battleship
    actual = ship.class

    assert_equal expected, actual
  end

  def test_it_has_a_board
    ship = Battleship.new
    expected = []
    actual = ship.board

    assert_equal expected, actual
  end

  def test_there_is_a_start_game_method
    ship = Battleship.new
    expected = String #puts message returns nil
    actual = ship.start_game.class

    assert_equal expected, actual
  end

  def test_that_start_game_method_has_a_message
    ship = Battleship.new
    user_input = ["p", "i", "q"]
    expected = user_input.any?
    actual = ship.start_game

    assert_equal expected, actual
  end

  def test_that_it_gets_input_from_the_user_after_start_game_message
    ship = Battleship.new
    user_input = ["p", "i", "q"]
    expected = user_input.any?
    actual = ship.get_input #manually typing in 'yes' when prompted

    assert_equal expected, actual
  end

  def test_that_if_user_presses_p_the_game_is_ready_to_play
    ship = Battleship.new
    expected = "starting game"
    actual = ship.play_game

    assert_equal expected, actual
  end

  def test_that_if_user_presses_i_they_can_read_the_instructions
    ship = Battleship.new
    expected = "If you don't know how to play I can't help you"
    actual = ship.read_instructions

    assert_equal expected, actual
  end
end
