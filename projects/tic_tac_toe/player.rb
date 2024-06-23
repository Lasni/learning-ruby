require 'pry-byebug'

class Player
  @@num_of_players = 0

  def initialize(name)
    @name = name
    @@num_of_players += 1

    p "Initializing player: #{name}"
    p "All players #{@@num_of_players}"
  end

  # getter for @name
  def name
    p 'this fires'
    @name
  end


  # Define the prompt method
  def prompt
    p "Player's #{name} turn: "
    answer = gets.chomp
    p "answer: #{answer}"
    answer
  end
end