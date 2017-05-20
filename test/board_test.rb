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
end
