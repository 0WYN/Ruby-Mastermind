class Game
    @@secret_code = []
    def initialize
        4.times do
            @@secret_code.push(rand(1..6))
        end
        puts @@secret_code.join(",")
    end

    def guess
        valid_digits = Array(1..6)
        puts "Please enter your guess seperated by commas (eg 1,1,1,1)"
        code_guess = gets.chomp.split(",")
        if code_guess.length == 4 && code_guess.all?{ |digit| valid_digits.include?(digit.to_i)}
            puts code_guess.join(',')
        else
            puts "Please enter a valid unput!"
            self.guess
        end
    end
end

game = Game.new
game.guess