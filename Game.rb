class Game
  attr_accessor :player1, :player2, :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def start_game
    until game_over?
      play_turn
      switch_turns
      display_scores
    end
    announce_winner
  end

  def switch_turns
    puts "-------NEW TURN--------"
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def play_turn
    question = MathQuestion.new
    question.prompt_question

    print "#{current_player.name}, please input your answer: "
    answer = gets.chomp.to_i

    if question.validate_answer(answer)
      current_player.increment_score
      puts "#{current_player.name} wins a point!"
    else
      current_player.lose_life
      puts "#{current_player.name} loses a life!"
    end
  end

  def game_over?
    (@player1.lives == 0 || @player2.lives == 0) || (@player1.score == 3 || @player2.score == 3)
  end

  def display_scores
    puts "#{player1.name}: #{player1.score}/3"
    puts "#{player2.name}: #{player2.score}/3"
  end

  def announce_winner
    winner = player1.score == 3 ? player1 : player2
    puts "The winner is #{winner.name}! with a score of #{winner.score}"
  end
end


