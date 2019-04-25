require "board.rb"
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

  def game_over?
    row_win? || column_win? || draw?
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