class Game
    @@secret_code = []
    def initialize
        4.times do
            @@secret_code.push(rand(1..6))
        end
        puts @@secret_code.join(",")
    end
end

game = Game.new