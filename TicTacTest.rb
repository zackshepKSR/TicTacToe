# Game board code

$board = { "1" => "1", 2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9" }

def showboard
	puts "-------------
| #{$board["1"]} | #{$board[2]} | #{$board[3]} |
-------------
| #{$board[4]} | #{$board[5]} | #{$board[6]} |
-------------
| #{$board[7]} | #{$board[8]} | #{$board[9]} |
-------------

"
end

# Players
class Player
	def initialize(name, letter)
		@name = name
		@letter = letter
	end

	# Move method
	def move
		puts "#{@name} you are #{@letter}s. Enter the number where you'd like to place an #{@letter}."
		position = gets.chomp
		$board.each {
			|key, value| 
				if value == position
					value.replace(@letter)
				else
					nil
				end
		}
		showboard
	end
end

player1 = Player.new("Player 1", "X")
player2 = Player.new("Player 2", "O")




# Game: intro

puts "Welcome to Tic-tac-toe! Here is our game board."
showboard

# Game: play

player1.move
player2.move


