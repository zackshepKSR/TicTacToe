# Game board

$board = { 1 => "1", 2 => "2", 3 => "3", 
		   4 => "4", 5 => "5", 6 => "6", 
		   7 => "7", 8 => "8", 9 => "9" }

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

 def win_test
	placeholder = board.select { |key, value| value == @letter }
	positions = placeholder.keys
		$winning_combos.each { 
			|x| if x == positions
				puts "You win!"
			else
				nil
			end
		}
	end


# def winning
# 	if 



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
					showboard
					# test win code
					placeholder = $board.select { |key, value| value == @letter }
						positions = placeholder.keys
							$winning_combos.each { 
								|x| if x == positions
									puts "#{@name} WINS!"
								else
									nil
								end
							}
				else
					nil
				end
		}		
	end
end

$player1 = Player.new("Player 1", "X")
$player2 = Player.new("Player 2", "O")

$current_player = 1
game_end = false

# Game play
def turns 
	counter = 1
	while counter < 5
		$player1.move
		$player2.move
		counter = counter + 1
	end
end

# Game: intro
puts "Welcome to Tic-tac-toe! Here is our game board."
showboard
turns

# http://www.informit.com/articles/article.aspx?p=26943&seqNum=3

