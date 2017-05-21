require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/start_game'

class StartGameTest < Minitest::Test

  def test_it_exists
    game = StartGame.new
    expected = StartGame
    actual = game.class

    assert_equal expected, actual
  end

  def test_there_is_a_start_game_method
    game = StartGame.new
    expected = String #puts message returns nil
    actual = game.start_game.class

    assert_equal expected, actual
  end

  def test_it_reads_messages_from_message_file_in_start_game
    game = StartGame.new
    expected = "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    actual = game.start_game

    assert_equal expected, actual
  end

  def test_it_reads_instructions_from_messages
    game = StartGame.new
    expected = "Out in the open ocean, a storm approaches. Not one that brings\nthunder nor lightning. This storm is your challenger, and they\nbring ships and fire power.... continue later"
    actual = game.read_instructions

    assert_equal expected, actual
  end
end
