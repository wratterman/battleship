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
    "\n         BATTLESHIP          \n=============================\n.      1      2      3      4\n\nA     A1     A2     A3     A4\n\nB     B1     B2     B3     B4\n\nC     C1     C2     C3     C4\n\nD     D1     D2     D3     D4\n=============================="
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

  def test_it_has_a_title_row
    b = Board.new
    expected = "         BATTLESHIP          "
    actual = b.title_row

    assert_equal expected, actual
  end

  def test_it_has_a_top_row
    b = Board.new
    expected = "============================="
    actual = b.top_row

    assert_equal expected, actual
  end

  def test_it_has_a_second_row
    b = Board.new
    expected = "\n.      1      2      3      4"
    actual = b.second_row

    assert_equal expected, actual
  end

  def test_it_displays_correctly_when_second_row_is_called_in_print_board
    b = Board.new
    expected =
    "\n         BATTLESHIP          \n=============================\n.      1      2      3      4\n\nA     A1     A2     A3     A4\n\nB     B1     B2     B3     B4\n\nC     C1     C2     C3     C4\n\nD     D1     D2     D3     D4\n=============================="
    actual = b.print_board

    assert_equal expected, actual
  end

  def test_it_has_a_third_row_from_coordinates
    b = Board.new
    expected = "\nA     A1     A2     A3     A4"
    actual = b.third_row

    assert_equal expected, actual
  end

  def test_it_has_a_fourth_row_form_coordinates
    b = Board.new
    expected = "\nB     B1     B2     B3     B4"
    actual = b.fourth_row

    assert_equal expected, actual
  end

  def test_it_has_a_fifth_row_form_coordinates
    b = Board.new
    expected = "\nC     C1     C2     C3     C4"
    actual = b.fifth_row

    assert_equal expected, actual
  end

  def test_it_has_a_sixth_row_form_coordinates
    b = Board.new
    expected = "\nD     D1     D2     D3     D4"
    actual = b.sixth_row

    assert_equal expected, actual
  end

  def test_it_has_a_last_row
    b = Board.new
    expected = "\n=============================="
    actual = b.last_row

    assert_equal expected, actual
  end
end
