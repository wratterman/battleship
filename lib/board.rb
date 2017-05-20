class Board

  def print_board
    top_row + "\n.     1     2     3     4\n\nA\n\nB\n\nC\n\nD\n=============================="
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

end

a = Board.new
