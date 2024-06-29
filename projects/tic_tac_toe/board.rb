require 'pry-byebug'


class Board
  attr_accessor :grid, :player1_positions, :player2_positions

  def initialize
    @grid = [
      [[0, 0], [0, 1], [0, 2]],
      [[1, 0], [1, 1], [1, 2]],
      [[2, 0], [2, 1], [2, 2]]
    ]
    @player1_positions = []
    @player2_positions = []
  end

  # render board
  def render
    row_letters = ['A', 'B', 'C']
    print "   0  1  2   "
    puts

    # binding.pry


    @grid.each_with_index do |row, index|
      print "#{row_letters[index]}  "

      row.each_with_index do |col, _index|

        # puts "col: #{col}"

        if @player1_positions.include?(col)
          print "X"
        elsif @player2_positions.include?(col)
          print "O"
        else
          print "   "
        end
      end
      puts
    end
  end

  # place marker
  def place_marker(move, marker)
    # puts "placing marker with move: #{move}"

    if marker == 'X'
      @player1_positions.push(move)

      # puts "updated p1 positions: #{@player1_positions}"
    else
      @player2_positions.push(move)

      # puts "updated p2 positions: #{@player2_positions}"
    end
  end
end