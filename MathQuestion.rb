class MathQuestion
  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @answer = @number1 + @number2
  end

  def prompt_question
    puts "What is #{@number1} + #{@number2}?"
  end

  def validate_answer(provided_answer)
    @answer == provided_answer
  end
end