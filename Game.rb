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

  def game_over
    @player1.lives == 0 || @player2.lives == 0
  end

  def switch_turns
    @current_player = @current_player == @player1 ? @player1 : @player2 
  end

  def play_turn
    question = MathQuestion.new
    question.prompt_question

    print "#{current_player.name}, please input your answer: "
    answer = gets.chomp

    if (question.validate_answer(answer))
      current_player.increment_score
      puts "#{current_player} wins a point!"
    else
      current_player.lose_life
      puts "#{current_player} loses a life!"
    end
  end

  def game_over?
    @player1.lives == 0 || @player2.lives == 0
  end

  def display_scores
    puts "#{player1} is at #{player1.score} points and #{player1.lives} lives"
    puts "#{player2} is at #{player2.score} points and #{player2.lives} lives"
  end

  def announce_winner
    winner = player1.lives > 0 ? player1 : player2
    puts "The winner is #{winner.name}! with a score of #{winner.scores}"
  end


