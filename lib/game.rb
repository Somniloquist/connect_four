class Game
  attr_accessor :players
  attr_reader :board
  def initialize(*players)
    @board = Board.new
    @players = players
  end

  def play
    @players = get_turn_order(players)
    players.each { |player| puts("#{player.name} rolled: #{player.last_roll}") }
    puts("#{players.first.name} goes first!")
    current_player = players.first
    next_player = players.last

    puts board

    # loop do
    #   break if game_over?
    # end

  end

  def make_play(marker, column)
    valid_play?(column) ? place_marker(marker, column) : false
  end

  def get_turn_order(players)
    players.each { |player| player.roll }
    # putting '-' in front of the sorting function is used to reverse sort (descending)
    players.sort_by { |player| -player.last_roll }
  end

  def game_over?
    row_win? || column_win? || diagonal_win? || draw?
  end

  private
  def draw?
    board.grid.any? { |row| row.any?(0) } ? false : true
  end

  def row_win?
    board.grid.each do |row|
      last_cell, count = 0, 0
      row.each do |cell|
        next if cell == 0
        last_cell == cell ? count += 1 : count = 1
        return true if count == 4
        last_cell = cell
      end
    end

    false
  end

  def column_win?
    board.columns.times do |column|
      count, last_cell = 0, 0
      board.rows.times do |row|
        cell = board.grid[row][column]
        next if cell == 0
        last_cell == cell ? count += 1 : count = 1
        return true if count == 4
        last_cell = cell
      end
    end

    false
  end

  def diagonal_win?
    possible_wins = [
      [[3,0],[2,1],[1,2],[0,3]], [[3,6],[2,5],[1,4],[0,3]],
      [[4,0],[3,1],[2,2],[1,3], [0,4]],[[4,6],[3,5],[2,4],[1,3],[0,2]],
      [[5,0],[4,1],[3,2],[2,3],[1,4],[0,5]], [[5,6],[4,5],[3,4],[2,3],[1,2],[0,1]],
      [[5,1],[4,2],[3,3],[2,4],[1,5],[0,6]], [[5,5],[4,4],[3,3],[2,2],[1,1],[0,0]],
      [[5,2],[4,3],[3,4],[2,5],[1,6]], [[5,4],[4,3],[3,2],[2,1],[1,0]],
      [[5,3],[4,4],[3,5],[2,6]], [[5,3],[4,2],[3,1],[2,0]]
    ]

    possible_wins.each do |path|
      count, last_cell = 0, 0
      path.each do |y, x|
        cell = board.grid[y][x]
        next if cell == 0
        last_cell == cell ? count += 1 : count = 1
        return true if count == 4
        last_cell = cell
      end
    end

    false
  end

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