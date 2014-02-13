# TO DO:
# * Add tie game message
# * Get rid of these global variables and put the board in a class after i have the logic working.

#--------------------------------------------------------------
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
	# Now make an array of the key values. We will compare this against 
	# the winning_combos
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

# Players class
class Player
	def initialize(name, letter)
		@name = name
		@letter = letter
	end

	# Move method
	def move
		puts "#{@name} you are #{@letter}s. Enter the number where you'd like to place an #{@letter}."
		position = gets.chomp
		# Using value to do an overwrite check and valid 1-9 move in one.
		if $board.has_value?(position)
			# If the value is there it replaces it with the player letter	
			$board.each {
				|key, value| 
					if value == position
						value.replace(@letter)
						showboard
						win_test
					end
			}		
		else
			puts "Invalid move try again. You have to enter a number between 1-9 that isn't taken."
			move
		end
	end
end

# def overwrite_test
# 	$board.each {
# 		|key, value| 
# 			if value == position

# Create the players and set current player
$player1 = Player.new("Player 1", "X")
$player2 = Player.new("Player 2", "O")
$current_player = 1

# Switching current player
def turns
	if $current_player == 1
		$player1.move
		$current_player += 1
	else 
		$player2.move
		$current_player -= 1
	end
end

# Looping turns with a limit of 9 for tie games. 
# Couldn't figure this out in the turns method.
def play
	# while $game_end == false
		9.times { 
			if $game_end == false
				turns
			else
				nil
			end
		}
end

# Game: intro
puts "Welcome to Tic-tac-toe! Here is our game board."
showboard

# Lets play!
play
