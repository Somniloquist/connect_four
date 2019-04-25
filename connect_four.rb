#!/usr/bin/env ruby
require "./lib/board.rb"
require "./lib/game.rb"
require "./lib/player.rb"

player1 = Player.new
player2 = Player.new
game = Game.new(player1, player2)
game.play