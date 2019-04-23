class Game
  attr_reader :board
  def initialize
    @board = Board.new
  end

  def make_play(marker, column)
    valid_play?(column) ? place_marker(marker, column) : false
  end

  private
  def place_marker(marker, column)
    rows = board.rows
    rows.times do |row|
      board.grid[row][column] = 1 if board.grid[row][column] == 0
      return true
    end
  end

  def valid_play?(column)
    # as long as there is space in the top row the play is valid
    board.grid[-1][column] == 0 ? true : false
  end

end