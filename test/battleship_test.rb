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
    expected = NilClass #puts message returns nil
    actual = ship.start_game.class

    assert_equal expected, actual
  end

  def test_that_start_game_method_has_a_message
    ship = Battleship.new
    expected = nil #"Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    actual = ship.start_game

    assert_equal expected, actual
  end
end
