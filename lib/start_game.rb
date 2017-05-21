require './lib/messages'

class StartGame
  attr_reader :message

  def initialize
    @message = Messages.new
  end

  def start_game
    message.welcome + "\n\n" + message.game_main_menu
  end

  def read_instructions
    message.instructions
  end
end
