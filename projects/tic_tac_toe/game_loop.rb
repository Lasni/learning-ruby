require_relative 'player'
require_relative 'board'

require 'pry-byebug'

class GameLoop
  attr_accessor :winner


  def initialize
    @winner = nil
    @player_1, @player_2 = create_players
    @board = Board.new
    start_game_loop
  end

  def create_players
    player_1 = Player.new('player_1', 'X')
    player_2 = Player.new('player_2', 'O')
    [player_1, player_2]
  end

  def player_turn(player)
    loop do
      move = player.make_move
      if valid_move(move)
        @board.place_marker(move, player.marker)
        break
      else
        puts 'Invalid move, try again.'
      end
    end
  end

  def start_game_loop
    # game loop
    loop do
      # render board
      @board.render

      # PLAYER 1
      player_turn(@player_1)

      # if check_winner(@player_1)
      #   @board.render
      #   puts "#{@player_1.name} wins"
      #   break
      # end

      # if @board.full?
      #   @board.render
      #   puts "It's a draw"
      #   break
      # end

      # PLAYER 2
      player_turn(@player_2)

      # if check_winner(@player_2)
      #   @board.render
      #   puts "#{@player_2.name} wins"
      #   break
      # end

      # if @board.full?
      #   @board.render
      #   puts "It's a draw"
      #   break
      # end
    end
  end

end

def valid_move(move)
  # check validity of input
  valid_answers = %w[A0 A1 A2 B0 B1 B2 C0 C1 C2].map(&:downcase)
  # check for already occupied positions
  occupied_positions = @board.player1_positions + @board.player2_positions
  number_coordinates = move_to_coordinates(move)
  valid_answers.include?(move.downcase) && !occupied_positions.include?(number_coordinates)
end

def move_to_coordinates(move)
  letter_to_index = { A: 0, B: 1, C: 2 }
  row, column = move.split('')
  [letter_to_index[row.to_sym], column.to_i]
  binding.pry
end