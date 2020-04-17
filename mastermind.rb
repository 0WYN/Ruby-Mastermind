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
        code_guess.map! {|x| x = x.to_i}
        if code_guess.length == 4 && code_guess.all?{ |digit| valid_digits.include?(digit)}
            compare_guess(code_guess)
        else
            puts "Please enter a valid unput!"
            self.guess
        end
    end

    def compare_guess(guess)
        puts "comparing guess: #{guess.join(",")}"

        guess.each_with_index do |e, i|
            if  @@secret_code.include?(e)
                puts "Included"
                if @@secret_code[i] == e
                    puts "Correct location!"
                end
            end
        end

    end
end

game = Game.new
game.guess