class Board
  attr_reader :rows, :columns
  attr_accessor :grid
  def initialize
    @rows = 6
    @columns = 7
    @grid = Array.new(rows) { Array.new(columns, 0) }
  end

  def to_s
    output = ""
    output << "\n"
    output << "  0   1   2   3   4   5   6  \n"
    output << "+---+---+---+---+---+---+---+\n"
    grid.reverse_each do |row|
      row.each do |cell|
        output << "| #{cell.to_s.gsub("0", " ")} "
      end
      output << "|\n"
      output << "+---+---+---+---+---+---+---+\n"
    end
    output << "\n"
  end

end