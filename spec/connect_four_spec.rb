require "./connect_four.rb"

describe Board do
  describe "#initialize" do
    it "initializes a board with 7 columns and 6 rows" do
      board = Board.new
      expect([board.grid[0].size, board.grid.size]).to eql([7,6])
    end
    
    it "cells are initialized with a default value of 0" do
      board = Board.new
      board.grid.each do |row|
        row.each { |cell| expect(cell).to eql(0) }
      end
    end

  end

end

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

  end
end

describe Player do
end
