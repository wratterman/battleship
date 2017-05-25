require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player_game_screen'

class PlayerGameScreenTest < Minitest::Test

  def test_it_exists
    game = PlayerGameScreen.new
    expected = PlayerGameScreen

    assert_instance_of expected, game
  end

  def test_it_has_access_to_player_board_file
    game = PlayerGameScreen.new
    expected = PlayerBoard
    actual = game.player_board

    assert_instance_of expected, actual
  end

  def test_it_has_access_to_board_file
    game = PlayerGameScreen.new
    expected = Board
    actual = game.display_board

    assert_instance_of expected, actual
  end

  def test_it_has_access_to_messages_file
    game = PlayerGameScreen.new
    expected = Messages
    actual = game.message

    assert_instance_of expected, actual
  end

  def test_it_calls_the_place_ships_from_player_board_file
    game = PlayerGameScreen.new
    game.start_new_game

    assert (("A" .. "D").to_a).include?(game.user_ships[0][0][0])
    assert (("1" .. "4").to_a).include?(game.user_ships[0][0][1])
    assert (("A" .. "D").to_a).include?(game.user_ships[0][1][0])
    assert (("1" .. "4").to_a).include?(game.user_ships[0][1][1])
    assert (("A" .. "D").to_a).include?(game.user_ships[1][0][0])
    assert (("1" .. "4").to_a).include?(game.user_ships[1][0][1])
    assert (("A" .. "D").to_a).include?(game.user_ships[1][1][0])
    assert (("1" .. "4").to_a).include?(game.user_ships[1][1][1])
    assert (("A" .. "D").to_a).include?(game.user_ships[1][2][0])
    assert (("1" .. "4").to_a).include?(game.user_ships[1][2][1])
  end
end
