
class Player
  @@num_of_players = 0

  def initialize(name, marker)
    @marker = marker
    @name = name
    @@num_of_players += 1

    p "Initializing player: #{name}"
    p "All players #{@@num_of_players}"
  end

  # getter for @name
  def name
    @name
  end

  # getter for @marker
  def marker
    @marker
  end

  # Define the make_move method
  def make_move
    p "Player's #{name} turn: "
    gets.chomp
  end
end