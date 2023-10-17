require './Player.rb'
require './MathQuestion.rb'
require './Game.rb'

puts "Enter name for Player 1: "
player1 = Player.new(gets.chomp)
puts "Enter name for Player2: "
player2 = Player.new(gets.chomp)

game = Game.new(player1, player2)
game.start_game