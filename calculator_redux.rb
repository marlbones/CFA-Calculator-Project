
#Calculator class that houses all functions
class Calculator
  def initialize
    @num1 = 0
    @num2 = 0
    @result = 0
  end
  attr_accessor :num1, :num2

#Calculate method - performs all logic
  def calculate
    loop do

      #Get user input for numbers
      puts "Enter first number"
      @num1 = gets.chomp.to_i
      puts "Enter second number"
      @num2 = gets.chomp.to_i

        #User makes calculation selection and corresponding method performed.
        puts 'Would you like to add [+], subtract [-], multiply [*], or exit [e]?'
        input = gets.chomp
        case input
        when '+'
          add
        when '-'
          subtract
        when '*'
          multiply
        when 'e'
          exit
        else
          puts "Please select [+], [-], or [x]"
        end
    end
  end

#Methods that house corresponding logic.
  def add
    @result =  @num1 + @num2
    result(@result)
  end

  def subtract
    @result = @num1 - @num2
    result(@result)
  end

  def multiply
    @result = @num1 * @num2
    result(@result)
  end

#result display method also contains "funny" Hitchhikers reference
  def result(result)
    puts "Your answer is #{result}"
    if result == 42
    puts "You have discovered the meaning of life!"
    end
  end
end #end of Calculator class

#Create/perform class
start = Calculator.new
start.calculate
