require './lib/messages'

class StartGame
  attr_reader :message

  def initialize
    @message = Messages.new
    # @game = Battleship.new
  end

  def start_game
    puts message.welcome + "\n\n" + message.game_main_menu
    answer = gets.chomp.upcase
    user_choice(answer)
  end

  def user_choice(input)
    if input == "I"
      read_instructions
    elsif input == "P"
      play_game
    elsif input == "Q"
      quit_game
    else
      p "Invalid Input. Please Reenter: "
      start_game
    end
  end


  def read_instructions
    puts message.instructions
    start_game
  end

  def play_game
    game.begin_new_game
  end

  def quit_game
    puts message.quit_game
    abort
  end
end
