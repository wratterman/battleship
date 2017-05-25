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
    expected = "\n         BATTLESHIP          \n=============================\n.      1      2      3      4\n\nA     A1     A2     A3     A4\n\nB     B1     B2     B3     B4\n\nC     C1     C2     C3     C4\n\nD     D1     D2     D3     D4\n=============================="
    actual = game.display_board

    assert_equal   expected, actual
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

    assert (("A" .. "D").to_a).include?(game.computer_ships[0][0][0])
    assert (("1" .. "4").to_a).include?(game.computer_ships[0][0][1])
    assert (("A" .. "D").to_a).include?(game.computer_ships[0][1][0])
    assert (("1" .. "4").to_a).include?(game.computer_ships[0][1][1])
    assert (("A" .. "D").to_a).include?(game.computer_ships[1][0][0])
    assert (("1" .. "4").to_a).include?(game.computer_ships[1][0][1])
    assert (("A" .. "D").to_a).include?(game.computer_ships[1][1][0])
    assert (("1" .. "4").to_a).include?(game.computer_ships[1][1][1])
    assert (("A" .. "D").to_a).include?(game.computer_ships[1][2][0])
    assert (("1" .. "4").to_a).include?(game.computer_ships[1][2][1])
  end
end
