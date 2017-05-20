require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    b = Board.new
    expected = Board
    actual = b.class

    assert_equal expected, actual
  end

  def test_that_it_has_a_board
    b = Board.new
    expected = " "
    actual = b.print_board

    assert_equal expected, actual
  end
end
