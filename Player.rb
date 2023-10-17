class Player
  attr_accessor :name , :score, :lives
  
  def initialize(name)
    @name = name
    @score = 0
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end

  def increment_score
    @score += 1
  end
end