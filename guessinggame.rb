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
#place bet then tell what current wallet

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
      wallet_total
    when 3
      exit
    else
      puts "Invalid Option"
    end
  end

  def play_game
    puts "==============================="
    puts "$$$$$ Place Your Bet $$$$$"
    bet 
    puts "Enter a Number Between 1 and 6 to double your bet"
    player_choice
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
    if @die == player_choice
      puts "$$$$$$ You Won! $$$$$$"
      puts "#{@player_bet} Added to Wallet"
    else
      puts "#{@player_bet} Removed form Wallet"
      game_menu 
    end
  end

  def bet 
    @player_bet = gets.to_i
  end

  def player_choice
    player_choice = gets.to_i
    # if @dice = player_choice
    #   initialize
    # else
    #   puts "Invalid Number"
    # end 

  end

  def wallet_total
    #make chips instance variable so it can iteract outside of method
    chips = 20
    puts "==============================="
    puts "You have #{chips} chips"
    game_menu 
  end

  # def wallet_total
    
  # end

end

g = GuessingGame.new

g.game_menu
g.show_dice
g.player_choice