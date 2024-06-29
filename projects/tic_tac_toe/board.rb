class Board
  attr_accessor :grid, :player1_positions, :player2_positions

  def initialize
    @grid = [
      [[0, 0], [0, 1], [0, 2]],
      [[1, 0], [1, 1], [1, 2]],
      [[2, 0], [2, 1], [2, 2]]
    ]
    @player1_positions = [[0, 0]]
    @player2_positions = [[2, 2], [1, 2]]
  end

  # render board
  def render
    row_letters = ['A', 'B', 'C']
    print "   0  1  2   "
    puts
    @grid.each_with_index do |row, index|
      print "#{row_letters[index]}  "
      row.each_with_index do |col, _index|
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
    puts "placing marker with move: #{move}"
  end
end