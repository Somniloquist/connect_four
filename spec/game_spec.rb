require "game.rb"

describe Game do
  describe "#initialize" do
    it "initializes a game with a board" do
      game = Game.new
      expect(game.board).to(be_truthy)
    end
  end

  describe "#make_play" do
    it "places a marker if play is valid" do
      game = Game.new
      marker = 1
      column = 3
      game.make_play(marker, column)
      expect(game.board.grid[0][column]).to eql(1)
    end

    it "does not place marker if column is full" do
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
end