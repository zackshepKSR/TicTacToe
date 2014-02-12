# TO DO:
# * Get rid of these global variables and put the board in a class after i have the logic working.
# * Add tie logic
# * Add position overwrite error control. 

# Create the game postions with a hash. Using numbers to reduce 
# input error and make it easy to check if a cell is already 
# taken or the input is valid with some letter vs number logic.
$board = { 1 => "1", 2 => "2", 3 => "3", 
		   4 => "4", 5 => "5", 6 => "6", 
		   7 => "7", 8 => "8", 9 => "9" }

# Create a method to show the board
def showboard
	puts "-------------
| #{$board[1]} | #{$board[2]} | #{$board[3]} |
-------------
| #{$board[4]} | #{$board[5]} | #{$board[6]} |
-------------
| #{$board[7]} | #{$board[8]} | #{$board[9]} |
-------------

"
end

# Variable for the winning combinations
$winning_combos = [
  [1,2,3],
  [4,5,6],
  [7,8,9],
  [1,4,7],
  [2,5,8],
  [3,6,9],
  [1,5,9],
  [3,5,7]
]

# Setting game over variable to false
$game_end = false

# Defining the game win logic as well as game ties
 def win_test
 	# Create a hash from entries where the value matches player @letter
	positions_hash = $board.select { |key, value| value == @letter }
	# Now make an array of the key values. We will compare this against the winning_combos
	positions_array = positions_hash.keys
		# Did the current move win the game?
		$winning_combos.each { 
			|x| if x == positions_array
				puts "#{@name} WINS!"
				$game_end = true
				return
				else
					nil
				end
			}
end

# Players
class Player
	def initialize(name, letter)
		@name = name
		@letter = letter
	end

	# Move method
	def move
		# Player move
		puts "#{@name} you are #{@letter}s. Enter the number where you'd like to place an #{@letter}."
		position = gets.chomp
		$board.each {
			|key, value| 
				if value == position
					value.replace(@letter)
					# test win code
					showboard
					win_test
				else
					nil
				end
		}		
	end
end


# Create the players

$player1 = Player.new("Player 1", "X")
$player2 = Player.new("Player 2", "O")

$current_player = $player1

def turns
# 	if $current_player == $player1
# 		$player1.move
# 		$current_player = $player2
#     else $player2.move
#          $current_player = $player1
#     end
# end

# Define game play (works but not perfect)
# def turns 
	while $game_end == false
		$player1.move
		$player2.move
	end
end

# Game: intro
puts "Welcome to Tic-tac-toe! Here is our game board."
showboard

# Lets play!
turns


