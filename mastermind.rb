class Mastermind
    @@secret_code = []
    @@rounds = 0
    @@winner = false

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

    def play
        while @@rounds <= 12 && !@@winner
            self.guess
        end

        if @@winner
            puts "Congratulations! You win!"
        else 
            puts "Sorry, you didn't win this time!"
        end
    end

    protected   
     
    def compare_guess(guess)
        clues = []
        code_copy = @@secret_code.dup
        ##checks whether guess is a winner or how close it is to the code
        unless @@secret_code == guess
            guess.each_with_index do |e, i|
                if  code_copy.include?(e) && code_copy[i] == e
                    code_copy.delete_at(i)
                    clues.push("$")
                    next
                elsif @@secret_code.include?(e)
                    index_to_delete = code_copy.index(e)
                    index_to_delete == nil ? next : index_to_delete 
                    code_copy.delete_at(index_to_delete)
                    clues.push("*")
                else
                    next
                end
            end
        else 
            @@winner = true
        end
        return clues.shuffle!.join(" ")
    end
end

game = Mastermind.new
game.play