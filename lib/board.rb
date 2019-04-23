class Board
  attr_reader :rows, :columns
  attr_accessor :grid
  def initialize
    @rows = 6
    @columns = 7
    @grid = Array.new(rows) { Array.new(columns, 0) }
  end

  def to_s
    puts ""
    grid.each do |row|
      p row
    end
  end
end