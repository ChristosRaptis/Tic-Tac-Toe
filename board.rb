# frozen_string_literal: true

COMBOS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

# Sets the game's board presentation
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(9) { |i| i + 1 }
  end

  def print_board
    puts
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts '.............'
    puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts '.............'
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
    puts
  end

  def update_board(position, value)
    @board[position] = value
  end

  def full_board?
    @board.all? { |i| %w[X O].include?(i) }
  end

  def win_check?(symbol)
    COMBOS.any? do |i|
      i.all? { |j| @board[j] == symbol }
    end
  end
end
