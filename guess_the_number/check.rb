
require 'pry'

puts "Guess a number"
guess = gets.chomp
var = rand(1...1000)



 if guess.to_i == var
      puts "Correct"
      binding.pry
      else
        if guess.to_i > var
          puts "Too high, try again"
        else
          puts "Too low, try again"
      end
    end
