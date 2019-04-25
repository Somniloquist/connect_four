class Player
  @@count = 1
  attr_accessor :last_roll
  attr_reader :name, :marker
  def initialize(name = "player#{@@count}", marker = @@count)
    @@count += 1
    @name = name
    @last_roll = nil
    @marker = marker
  end

  def roll
    @last_roll = (rand * 100).to_i
  end
end