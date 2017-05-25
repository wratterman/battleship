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
    expected = "Out in the open ocean, a storm approaches. Not one that brings\nthunder nor lightning. This storm is your challenger, and they\nbring ships and fire power.... \nThe rules are the same as regular battleship, only with two ships and a smaller board. \nIf you need to know how to play battleship, Google it."
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
    expected = "*BUZZ* Invalid input. That coordinate doesn't exist on the board.\nDon't make this a habit, it might cost you in the open ocean."
    actual = m.invalid_input

    assert_equal expected, actual
  end

  def test_it_has_a_quit_message
    m = Messages.new
    expected = "I hope you understand the ramifications of your actions...\nQuitting game."
    actual = m.quit_game

    assert_equal expected, actual
  end

  def test_it_has_a_user_two_unit_ship_placement_method
    m = Messages.new
    expected = "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the\nsecond is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nEnter the squares for the two-unit ship:"
    actual = m.two_unit_ship_placement

    assert_equal expected, actual
  end

end
