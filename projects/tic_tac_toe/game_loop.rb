require_relative 'player'

class GameLoop
  attr_accessor :winner

  def initialize
    @winner = nil
    @player_1, @player_2 = create_players
    start_game_loop
  end

  def create_players
    player_1 = Player.new('player_1')
    player_2 = Player.new('player_2')
    [player_1, player_2]
  end

  def start_game_loop
    # game loop
    loop do
      # render board
      # render_board(board, player_combos)

      # prompt player1
      answer = @player_1.prompt
      until is_valid_answer(answer)
        answer = @player_1.prompt
      end

      # check if winner
      # player_1.check_if_winner

      # break if winner
      break if :winner == 'burek'

      # render board
      # render_board(board, player_combos)

      # prompt player2
      answer = @player_2.prompt
      # check if valid answer
      until is_valid_answer(answer)
        answer = @player_2.prompt
      end

      # break if winner
      break if :winner == 'burek'

    end
  end

end




def is_valid_answer(answer)
  valid_answers = %w[A0 A1 A2 B0 B1 B2 C0 C1 C2].map { |el| el.downcase }
  valid_answers.include?(answer.downcase)
end


