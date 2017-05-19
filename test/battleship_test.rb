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

  def test_you_can_choose_a_skill_level
end
