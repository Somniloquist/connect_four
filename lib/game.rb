class Game
  attr_reader :board
  def initialize
    @board = Board.new
  end

  def make_play(marker, column)
    valid_play?(column) ? place_marker(marker, column) : false
  end

  def get_turn_order(*players)
    players.sort { |a, b| b.last_roll <=> a.last_roll }
  end

  private
  def place_marker(marker, column)
    rows = board.rows
    rows.times do |row|
      if board.grid[row][column] == 0
        board.grid[row][column] = marker
        return true
      end
    end
  end

  def valid_play?(column)
    # as long as there is space in the top row the play is valid
    board.grid[-1][column] == 0 ? true : false
  end

end