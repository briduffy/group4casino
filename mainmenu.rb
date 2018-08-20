require_relative 'slotmachine'
require_relative 'blackjack'

def mainmenu
    puts 'Please select a game to play.
    1) Slot Machine
    2) Blackjack
    3) Exit'
    choice = gets.to_i
    case choice
    when 1
        SlotGame.new
    when 2
        Deck.new
    when 3
        exit
    else
        puts 'Invalid Choice'
        mainmenu
    end    
end

mainmenu
