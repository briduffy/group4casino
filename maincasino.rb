require_relative 'slotmachine'

def menu
  puts "What would you like to play?"
  puts "1) Slot Machine"
  puts "2) Lottery"
  puts "3) More Games"
  choice = gets.to_i
  require_relative 'dirksgame'
end

def user_input
  case choice
  when 1
    SlotGame.new
  when 2
    game = DirksGame.new(@user_guess, @actual, @wallet, @answers)
    game.menu
    puts "You have $100" 
    game.num_guess
    game.computer
    game.sort
    game.different
    game.money
    game.counter
    game.ending

    while true
      game.menu
      game.num_guess
      game.computer
      game.sort
      game.different
      game.money
      game.counter
      game.ending
  end

  when 3
  else
  end
end

menu

