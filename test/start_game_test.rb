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

  def test_it_has_a_board
    game = StartGame.new
    expected = []
    actual = game.board

    assert_equal expected, actual
  end

  def test_there_is_a_start_game_method
    game = StartGame.new
    expected = String #puts message returns nil
    actual = game.start_game.class

    assert_equal expected, actual
  end

  def test_that_start_game_method_has_a_message
    game = StartGame.new
    user_input = ["p", "i", "q"]
    expected = user_input.any?
    actual = game.start_game

    assert_equal expected, actual
  end

  def test_that_it_gets_input_from_the_user_after_start_game_message
    game = StartGame.new
    user_input = ["p", "i", "q"]
    expected = user_input.any?
    actual = game.get_input #manually typing in 'yes' when prompted

    assert_equal expected, actual
  end

  def test_that_if_user_presses_p_the_game_is_ready_to_play
    game = StartGame.new
    expected = "starting game"
    actual = game.play_game

    assert_equal expected, actual
  end

  def test_that_if_user_presses_i_they_can_read_the_instructions
    game = StartGame.new
    expected = "If you don't know how to play I can't help you"
    actual = game.read_instructions

    assert_equal expected, actual
  end
end
