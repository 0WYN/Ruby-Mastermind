class Game
    @@secret_code = []
    @@rounds = 0
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
            puts compare_guess(code_guess)
        else
            puts "Please enter a valid unput!"
            self.guess
        end
        @@rounds += 1
    end

    protected   
     
    def compare_guess(guess)
        clues = []
        guess.each_with_index do |e, i|
            if  @@secret_code.include?(e) && @@secret_code[i] == e
                clues.push("$")
            elsif @@secret_code.include?(e)
                clues.push("*")
            end
        end
        return clues.shuffle!.join(" ")
    end
end

game = Game.new
game.guess