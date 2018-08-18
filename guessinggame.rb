
class GuessingGame

  def game_menu
    puts "==============================="
    puts "Welcome to Geoffs Game of Chance"
    puts "==============================="
    puts "1) Play Game"
    puts "2) Exit"
    puts "==============================="
    game_options
    
  end

  def game_options
    case gets.to_i
    when 1
      play_game
    when 2
      exit
    else
      puts "Invalid Option"
      game_menu
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
    show_dice
  end

  def roll
    @die1 = 1 + rand(6)
  end

  def show_dice
    @chips = 20
    puts "You rolled a #{@die1} "
    if @die1 == @player_number
      puts "$$$$$$ You Won! $$$$$$"
      puts "#{wallet_total}chips added to Wallet" 
      #game_menu
    else
      puts "You Lose"
      puts "You have #{wallet_total} chips remaining" 
      #game_menu 
    end
    game_menu
    wallet_total 
  end

  def bet 
    @player_bet = gets.to_i
  end

  def player_choice
    @player_number = gets.to_i

  end

  def wallet_total
    @chips = 20
    if @die1 == @player_number
      @chips = @player_bet + @player_bet + @chips
    else
     @chips = @chips - @player_bet
    end
    puts "==============================="
    puts "You have #{@chips} chips"
    game_menu 
  end
  
end

g = GuessingGame.new

g.game_menu
# g.show_dice
#g.player_choice


# def method(total)
#   case total
#end