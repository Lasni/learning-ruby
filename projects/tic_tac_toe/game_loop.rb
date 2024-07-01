require_relative 'player'
require_relative 'board'
require 'pry-byebug'

class GameLoop
  attr_accessor :winner

  def initialize
    @winner = nil
    @player1, @player2 = create_players
    @board = Board.new(@player1, @player2)
    start_game_loop
  end

  def create_players
    player1 = Player.new('player1', 'X')
    player2 = Player.new('player2', 'O')
    [player1, player2]
  end

  def player_turn(player)
    puts "#{player.name} turn:"
    loop do
      move = player.make_move
      if valid_move(move)
        number_coordinates = move_to_coordinates(move)
        @board.place_marker(number_coordinates, player.marker)
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
      player_turn(@player1)
      @board.render

      if check_winner(@player1)
        puts "#{@player1.name} wins"
        @board.render
        break
      end

      if @board.board_full?
        @board.render
        puts "It's a draw"
        break
      end

      # PLAYER 2
      player_turn(@player2)
      @board.render

      if check_winner(@player2)
        puts "#{@player2.name} wins"
        @board.render
        break
      end

      if @board.board_full?
        @board.render
        puts "It's a draw"
        break
      end
    end
  end
end

def check_winner(player)
  player_positions_sorted = player.positions.sort
  winning_combinations = @board.winning_combinations.map(&:sort)
  winning_combinations.any? do |combination|
    combination.all? { |position| player_positions_sorted.include?(position) }
  end
end

def valid_move(move)
  # check validity of input
  valid_answers = %w[A0 A1 A2 B0 B1 B2 C0 C1 C2].map(&:downcase)
  # check for already occupied positions
  occupied_positions = @player1.positions + @player2.positions
  number_coordinates = move_to_coordinates(move)
  valid_answers.include?(move.downcase) && !occupied_positions.include?(number_coordinates)
end

def move_to_coordinates(move)
  letter_to_index = { A: 0, B: 1, C: 2 }
  row, column = move.split('')
  [letter_to_index[row.upcase.to_sym], column.to_i]
end