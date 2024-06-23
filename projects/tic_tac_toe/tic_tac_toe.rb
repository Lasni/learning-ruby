# frozen_string_literal: true


board = [
  [[0, 0], [0, 1], [0, 2]],
  [[1, 0], [1, 1], [1, 2]],
  [[2, 0], [2, 1], [2, 2]]
]

player_combos = [[0, 0], [1, 1], [2, 2]]



# render board
def render_board(board, player_combos)

  
  letters = ['A', 'B', 'C']

  print "   0  1  2   "
  puts
  board.each_with_index do |row, index|
    print "#{letters[index]}  "
    row.each_with_index do |col, _index|
      if player_combos.include?(col)
        print "X"
      else
        print "   "
      end
    end
    puts
  end
end



# player class


