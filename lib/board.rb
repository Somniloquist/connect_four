class Board
  attr_reader :rows, :columns
  attr_accessor :grid
  def initialize
    @rows = 6
    @columns = 7
    @grid = Array.new(rows) { Array.new(columns, 0) }
  end

  def to_s
    puts("")
    print("  0   1   2   3   4   5   6  \n")
    print("+---+---+---+---+---+---+---+\n")
    grid.reverse_each do |row|
      row.each do |cell|
        print("| #{cell.to_s.gsub("0", " ")} ")
      end
      print("|\n")
      print("+---+---+---+---+---+---+---+\n")
    end
    puts("")
  end
end