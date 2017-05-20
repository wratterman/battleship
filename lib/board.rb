class Board

  def print_board
    top_row + second_row + "\n" + third_row + "\n" + fourth_row + "\n" + fifth_row + "\n" + sixth_row + last_row
  end

  def coordinates
    [["A1", "A2", "A3", "A4"],
    ["B1", "B2", "B3", "B4"],
    ["C1", "C2", "C3", "C4"],
    ["D1", "D2", "D3", "D4"]]
  end

  def top_row
    "============================="
  end

  def second_row
    "\n.     1     2     3     4"
  end

  def third_row
    "\nA" + ((" ") * 5) + coordinates[0][0].gsub("A1", " ") + ((" ") * 5) + coordinates[0][1].gsub("A2", " ") + ((" ") * 5) + coordinates[0][2].gsub("A3", " ") + ((" ") * 5) + coordinates[0][3].gsub("A4", " ")
  end

  def fourth_row
    "\nB" + ((" ") * 5) + coordinates[1][0].gsub("B1", " ") + ((" ") * 5) + coordinates[1][1].gsub("B2", " ") + ((" ") * 5) + coordinates[1][2].gsub("B3", " ") + ((" ") * 5) + coordinates[1][3].gsub("B4", " ")
  end

  def fifth_row
    "\nC" + ((" ") * 5) + coordinates[2][0].gsub("C1", " ") + ((" ") * 5) + coordinates[2][1].gsub("C2", " ") + ((" ") * 5) + coordinates[2][2].gsub("C3", " ") + ((" ") * 5) + coordinates[2][3].gsub("C4", " ")
  end

  def sixth_row
    "\nD" + ((" ") * 5) + coordinates[3][0].gsub("D1", " ") + ((" ") * 5) + coordinates[3][1].gsub("D2", " ") + ((" ") * 5) + coordinates[3][2].gsub("D3", " ") + ((" ") * 5) + coordinates[3][3].gsub("D4", " ")
  end

  def last_row
    "\n=============================="
  end
end

a = Board.new
puts a.print_board
