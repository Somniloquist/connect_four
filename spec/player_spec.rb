require "player.rb"

describe Player do
  describe "#initialize" do
    it "initializes with default player names if no name is given" do
      player1 = Player.new
      player2 = Player.new
      expect(player1.name).to eql("player1")
      expect(player2.name).to eql("player2")
    end

    it "accepts a name as an argument" do
      player1 = Player.new("robin")
      expect(player1.name).to eql("robin")
    end
  end
end