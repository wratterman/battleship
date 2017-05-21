require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/messages'

class MessagesTest < Minitest::Test

  def test_it_exists
    m = Messages.new
    expected = Messages
    actual = m.class

    assert_equal expected, actual
  end

  def test_it_has_a_welcome_message
    m = Messages.new
    expected = "Welcome to BATTLESHIP"
    actual = m.welcome

    assert_equal expected, actual
  end

  def test_it_has_a_main_menu_message
    m = Messages.new
    expected = "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    actual = m.game_main_menu

    assert_equal expected, actual
  end

  def test_it_has_instructions
    m = Messages.new
    expected = "Out in the open ocean, a storm approaches. Not one that brings\nthunder nor lightning. This storm is your challenger, and they\nbring ships and fire power.... continue later"
    actual = m.instructions

    assert_equal expected, actual
  end
end
