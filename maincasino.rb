require_relative 'slotmachine'

def menu
  puts "What would you like to play?"
  puts "1) Slot Machine"
  puts "2) Games"
  puts "3) More Games"
  user_input
end

def user_input
  case gets.to_i
  when 1
    SlotGame.new
  when 2
  when 3
  else
  end
end

menu

