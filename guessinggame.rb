# greeting "welcome to geoffs guessing game" prompt "you have this much money"
# prompt saying you have this much money
# prompt saying how much you want to bet
# guess a number between 1 and 6
# put dice rolling.....
# if guess number = dice number puts "you won!"
# if guess number is != dice number put "you lost"
# subtract bet from wallet
# display new amount of money
# prompt do you wish to go again? Y/N
# If "Y" loop
# If "N" exit

class GuessingGame

  def game_menu
    puts "==============================="
    puts "Welcome to Geoffs Game of Chance"
    puts "==============================="
    puts "1) Play Game"
    puts "2) View Wallet"
    puts "3) Exit"
    puts "==============================="
    game_options
  end

  def game_options
    case gets.to_i
    when 1
      play_game
    when 2
      view_wallet
    when 3
      exit
    else
      puts "Invalid Option"
    end
  end

  def play_game
    puts "==============================="
    puts "$ Place Your Bet $"
    player_bet 
    puts "Enter a Number Between 1 and 6"
    player_choice =""
    puts "Press Enter to Roll Dice"
    gets
    roll
    #initialize 
    #user_bet = gets.to_1
    #place bet
    #enter a number and roll the dice
    #you rolled a 6
    #you win you lose
  end

  # def initialize
  #   roll
  # end

  def roll
    @die1 = 1 + rand(6)
  end

  def show_dice
    puts "You rolled a #{@die1} "
  end

  def player_bet
    player_bet = gets.to_i
  end

  def player_choice
    player_choice = gets.to_i
    if @dice = player_choice
      initialize
    else
      puts "Invalid Number"
    end 

  end

  def view_wallet
    chips = 20
    puts "You have #{chips} chips"
  end

end

g = GuessingGame.new

g.game_menu
g.show_dice
g.player_choice