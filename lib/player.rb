class Player
  @@count = 1
  attr_reader :name
  def initialize(name = "player#{@@count}")
    @@count += 1
    @name = name
  end
end