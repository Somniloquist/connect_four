class Game
  attr_reader :board
  def initialize
    @board = Board.new
  end

  def make_play(marker, column)
    place_marker(marker, column) if valid_play?(column)
  end

  private
  def place_marker(marker, column)
    rows = board.rows
    rows.times do |row|
      return board.grid[row][column] = 1 if board.grid[row][column] == 0
    end
  end

  def valid_play?(column)
    # as long as there is space in the top row the play is valid
    return true if board.grid[-1][column] == 0
    false
  end

end