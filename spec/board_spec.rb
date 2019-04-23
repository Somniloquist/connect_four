require "board.rb"

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
