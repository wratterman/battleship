class Board

  def print_board
    printed_board = "\n" + title_row + "\n" + top_row + second_row + "\n" + third_row + "\n" + fourth_row + "\n" + fifth_row + "\n" + sixth_row + last_row
    printed_board
  end

  def coordinates
    [["A1", "A2", "A3", "A4"],
    ["B1", "B2", "B3", "B4"],
    ["C1", "C2", "C3", "C4"],
    ["D1", "D2", "D3", "D4"]]
  end

  def title_row
    "BATTLESHIP".center(29)
  end

  def top_row
    "============================="
  end

  def second_row
    "\n.      1      2      3      4"
  end

  def third_row
    "\nA" + ((" ") * 5) + coordinates[0][0] + ((" ") * 5) + coordinates[0][1] + ((" ") * 5) + coordinates[0][2]+ ((" ") * 5) + coordinates[0][3]
  end

  def fourth_row
    "\nB" + ((" ") * 5) + coordinates[1][0] + ((" ") * 5) + coordinates[1][1] + ((" ") * 5) + coordinates[1][2] + ((" ") * 5) + coordinates[1][3]
  end

  def fifth_row
    "\nC" + ((" ") * 5) + coordinates[2][0] + ((" ") * 5) + coordinates[2][1] + ((" ") * 5) + coordinates[2][2] + ((" ") * 5) + coordinates[2][3]
  end

  def sixth_row
    "\nD" + ((" ") * 5) + coordinates[3][0] + ((" ") * 5) + coordinates[3][1] + ((" ") * 5) + coordinates[3][2] + ((" ") * 5) + coordinates[3][3]
  end

  def last_row
    "\n=============================="
  end
end
