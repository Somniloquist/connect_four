require "player.rb"

describe Player do
  describe "#initialize" do
    it "initializes with default player names if no name is given" do
      Player.class_variable_set(:@@count, 1)
      p1, p2 = Player.new, Player.new
      expect(p1.name).to eql("player1")
      expect(p2.name).to eql("player2")
    end

    it "accepts a name as an argument" do
      player1 = Player.new("robin")
      expect(player1.name).to eql("robin")
    end
  end
  
  describe "#roll" do
    it "records last roll value" do
      player = Player.new
      roll = player.roll
      expect(roll == player.last_roll).to eql(true)
    end
  end

end