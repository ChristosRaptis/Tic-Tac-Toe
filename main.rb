# frozen_string_literal: true

require_relative 'game'
require_relative 'player'

puts "Welcome! Let's play Tic-Tac-Toe!"
puts
puts 'Please enter the name of player 1:'
player1 = Player.new(gets.chomp, 'O')
puts "The symbol of #{player1.name} is #{player1.symbol}"
puts
puts 'Please enter the name of player 2:'
player2 = Player.new(gets.chomp, 'X')
puts "The symbol of #{player2.name} is #{player2.symbol}"
@game_status = 'over'
while @game_status != 'end'
  puts
  puts 'Would you like to start a new game ? Type Yes / No'
  choice = gets.chomp

  case choice
  when 'Yes'
    new_game = Game.new(player1, player2)

    new_game.play_game

  when 'No'
    @game_status = 'end'

  end
  puts
  player1.print_score
  player2.print_score
end
