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
    expected =
    "=============================\n.     1     2     3     4\n\nA\n\nB\n\nC\n\nD\n=============================="
    actual = b.print_board

    assert_equal expected, actual
  end

  def test_it_has_coordinates
    b = Board.new
    expected = [["A1", "A2", "A3", "A4"],
               ["B1", "B2", "B3", "B4"],
               ["C1", "C2", "C3", "C4"],
               ["D1", "D2", "D3", "D4"]]
    actual = b.coordinates

    assert_equal expected, actual
  end

  def test_it_has_a_top_row
    b = Board.new
    expected = "============================="
    actual = b.top_row

    assert_equal expected, actual
  end
end
