# frozen_string_literal: true

# player setup
class Player
  attr_accessor :name, :symbol, :wins

  def initialize(name, symbol, wins = 0)
    @name = name
    @symbol = symbol
    @wins = wins
  end

  def print_score
    puts "#{@name} has #{@wins} wins "
  end

  def update_score
    @wins += 1
  end
end
