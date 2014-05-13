#########################################################################
##     Patrick Arthur - Flow Control Guess the Number Game             ##
##                                                                     ##
#########################################################################
require 'pry'
#### Step 1 - Create a method to validate range, I used the include metod
### on line 11 to check that the number a user input is between 1 and 1000
class Game

  def initialize
    puts "Guess a number"
    @guess = gets.chomp
    @var = rand(1...1000)
    check_range
    guess_number
  end

  def check_range
      if (1..1000).include?(@guess.to_i)
        puts "Number is in correct range"
          else
            puts "Number needs to be between 1 and 1000"
          end
    end


## Step 2 - Create Method compare the number the user inputed to
## the numder randomly generated using the rand method (method that picks
  ## and randome number between 1 and 1000 every time the user runs the program
  ## see line 36)

  def guess_number
    if @guess.to_i == @var
      puts "Correct"
      binding.pry
      else
        if @guess.to_i > @var
          puts "Too high, try again"
        else
          puts "Too low, try again"
      end
    end
  end
end

#### Step 3 - User inputs, used the gets.chomp method line 37 to store the
## number a user inputs. Important to note that @ represents the fact that
### variables guess and var are local variables (varibles local to methods),
### also called the methods.
game=Game.new



