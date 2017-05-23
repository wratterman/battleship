class Messages

  def welcome
    "Welcome to BATTLESHIP"
  end

  def game_main_menu
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    "Out in the open ocean, a storm approaches. Not one that brings\nthunder nor lightning. This storm is your challenger, and they\nbring ships and fire power.... continue later"
  end

  def starting_new_game
    "Staring game..."
  end

  def invalid_input
    "*BUZZ* Invalid input. That coordinate doesn't exist on the board.\nDon't make this a habit, it might cost you in the open ocean."
  end

  def invalid_input_overlap
    "*BUZZ* Invalid input. You already have a ship placed there. \nDon't make this a habit, it might cost you in the open ocean."
  end

  def invalid_input_too_many_units_away_two_ship
    "Remember, your ship is only two units long and needs to run vertically or horizontally. Please re-enter coordinate: "
  end

  def quit_game
    "I hope you understand the ramifications of your actions...\nQuitting game."
  end

  def two_unit_ship_placement
    "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the\nsecond is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nEnter the squares for the two-unit ship:"
  end
end
