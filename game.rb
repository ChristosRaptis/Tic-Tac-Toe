# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# Game logic
class Game
  attr_accessor :game_status, :current_player

  def initialize(player1, player2)
    @game_status = 'on'
    @board = Board.new
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def play_game
    while game_status == 'on'
      @board.print_board
      get_position(@current_player)
      if @board.win_check?(@current_player.symbol)
        @current_player.update_score
        @game_status = 'over'
        puts "Gratz #{@current_player.name} you won !"
      elsif @board.full_board?
        @game_status = 'over'
        puts "It's a tie !"
      end
      @current_player = swith_player
    end
  end

  def swith_player
    if @current_player == @player1
      @player2
    else
      @player1

    end
  end

  def get_position(player)
    puts "Please #{player.name} choose in which place you would like to put your symbol"
    position = gets.chomp.to_i
    @board.update_board(position - 1, player.symbol)
  end
end
