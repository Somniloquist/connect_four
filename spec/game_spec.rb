require "game.rb"
require "player.rb"
require "board.rb"

describe Game do
  describe "#initialize" do
    it "initializes a game with a board" do
      game = Game.new
      expect(game.board).to(be_truthy)
    end
  end

  describe "#make_play" do
    it "returns true when play is valid" do
      game = Game.new
      expect(game.make_play(1, 3)).to eql(true)
    end

    it "returns false when play is invalid" do
      game = Game.new
      game.board.rows.times do |row|
        game.board.grid[row][3] = 'x'
      end
      expect(game.make_play(1, 3)).to eql(false)
    end

    it "places a marker when play is valid" do
      game = Game.new
      marker = 1
      column = 3
      game.make_play(marker, column)
      expect(game.board.grid[0][column]).to eql(1)
    end

    it "does not place marker when column is full" do
      game = Game.new
      marker = 1
      column = 3
      rows = game.board.rows

      rows.times do |row|
        game.board.grid[row][column] = 'x'
      end

      game.make_play(marker, column)
      expect(game.board.grid[0][column]).to eql('x')
    end

    it "does not place a marker out of bounds" do
      game = Game.new
      marker = 1
      column = game.board.columns
      game.make_play(marker, column)
      expect(game.board.grid[0][column]).to eql(nil)
    end

    it "stacks markers until the column is full" do
      game = Game.new
      marker, column = 'x', 3
      result_column = []
      loop { break unless game.make_play(marker, 3) }
      game.board.grid.each { |row| result_column << row[column] }
      expect(result_column).to eql(Array.new(game.board.rows, "x"))
    end
  end

  describe "#get_turn_order" do
    it "returns a sorted array of players" do
      game, p1, p2, p3, p4 = Game.new, Player.new, Player.new, Player.new, Player.new
      p1.last_roll, p2.last_roll, p3.last_roll, p4.last_roll = 50, 100, 25, 75
      order = game.get_turn_order(p1, p2, p3, p4)
      expect(order).to eql([p2, p4, p1, p3])
    end
  end

  describe "#game_over?" do
    it "returns true if there are no valid moves left (draw)" do
      game = Game.new
      game.board.columns.times do |col|
        game.board.rows.times { game.make_play('x', col) }
      end
      expect(game.game_over?).to eql(true)
    end

    it "returns false if there is at least one valid move left" do
      game = Game.new
      count = 0
      game.board.columns.times do |col|
        game.board.rows.times do
           game.make_play(count, col)
           count += 1
        end
      end
      game.board.grid[game.board.rows-1][game.board.columns-1] = 0
      expect(game.game_over?).to eql(false)
    end

    it "returns true when 4 markers are in a row" do
      game = Game.new
      game.board.grid[3] = ['x','o','x','x','x','x','o']
      expect(game.game_over?).to eql(true)
    end

    it "returns false when 4 markers are NOT in a row" do
      game = Game.new
      game.board.grid[3] = ['o','x','x','o','x','x','o']
      expect(game.game_over?).to eql(false)
    end

    it "returns true when 4 markers are in a column" do
      game = Game.new
      4.times { game.make_play('x', 3) }
      expect(game.game_over?).to eql(true)
    end

    it "returns true when 4 markers are diagonal" do
      game = Game.new
      diagonals = [[4,5],[3,4],[2,3],[1,2]]
      diagonals.each { |y,x| game.board.grid[y][x] = 'x' }
      expect(game.game_over?).to eql(true)
    end

  end

end