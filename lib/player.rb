class Player
  @@count = 1
  attr_accessor :last_roll
  attr_reader :name
  def initialize(name = "player#{@@count}")
    @@count += 1
    @name = name
    @last_roll = nil
  end

  def roll
    @last_roll = (rand * 100).to_i
  end
end