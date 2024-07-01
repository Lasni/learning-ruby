require 'pry-byebug'

class Board
  attr_accessor :grid, :winning_combinations

  def initialize(player1, player2)
    @grid = generate_grid(3, 3)
    @winning_combinations = generate_winning_combinations
    @player1_positions = player1.positions
    @player2_positions = player2.positions
  end

  # generate grid
  def generate_grid(rows, columns)
    Array.new(rows) do |row|
      Array.new(columns) do |column|
        [row.to_i, column.to_i]
      end
    end
  end

  # render board
  def render
    row_letters = ['A', 'B', 'C']
    print "    0  1  2    "
    puts

    @grid.each_with_index do |row, index|
      print "#{row_letters[index]}  "
      row.each_with_index do |col, _index|
        if @player1_positions.include?(col)
          print " X "
        elsif @player2_positions.include?(col)
          print " O "
        else
          print "   "
        end
      end
      puts
    end
    puts "------------------------------"
  end

  # place marker
  def place_marker(move, marker)
    if marker == 'X'
      @player1_positions.push(move)
    else
      @player2_positions.push(move)
    end
  end

  # generate winning combinations
  def generate_winning_combinations
    rows = @grid
    columns = @grid.transpose
    diagonals = [
      [[0, 0], [1, 1], [2, 2]],
      [[2, 0], [1, 1], [0, 2]]
    ]
    rows + columns + diagonals
  end

  # board_full
  def board_full?
    flattened_grid = @grid.flatten(1)
    delta = flattened_grid - @player1_positions - @player2_positions
    delta.length == 0
  end
end