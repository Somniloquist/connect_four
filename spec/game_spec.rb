require "game.rb"
require "player.rb"

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
  end

  describe "#get_turn_order" do
    it "returns a sorted array of players" do
      game, p1, p2, p3, p4 = Game.new, Player.new, Player.new, Player.new, Player.new
      p1.last_roll, p2.last_roll, p3.last_roll, p4.last_roll = 50, 100, 25, 75
      order = game.get_turn_order(p1, p2, p3, p4)
      p order
      expect(order).to eql([p2, p4, p1, p3])
    end
  end

end