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

  def test_it_has_a_starting_game_message
    m = Messages.new
    expected = "Staring game..."
    actual = m.starting_new_game

    assert_equal expected, actual
  end

  def test_it_has_an_invalid_input_message
    m = Messages.new
    expected = "*BUZZ* Invalid input.\nDon't make this a habit, it might cost you in the open ocean."
    actual = m.invalid_input

    assert_equal expected, actual
  end

  def test_it_has_a_quit_message
    m = Messages.new
    expected = "I hope you understand the ramifications of your actions...\nQuitting game."
    actual = m.quit_game

    assert_equal expected, actual
  end
end
