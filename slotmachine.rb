require 'colorize'

class SlotGame
  #@slot_count = 3
  #@symbols = %w[ 🥗 🍒 🍕  💰 🍻 🎳 ]
  #@keep_playing_responses = %[yes y ok go sure ya next]

  def initialize
    @symbols = %w[ 🥗 🍒 🍕  💰 🍻 🎳 ]
    @keep_playing_responses = %w[yes y ok go sure ya next]
    @slot_count = 3
    puts
    puts "-----------------------------------------------------".colorize(:green)
    puts "               J A C K P O T   S L O T S             ".colorize(:green)
    puts "-----------------------------------------------------".colorize(:green)
    puts
    puts "How much money would you lke to start with today?"
    @cash=gets.to_i
    puts 
    puts "You're starting with $#@cash."
    menu
  end
end

def menu
  puts
  puts "==========================================".colorize(:cyan)
  puts "      Welcome to the slot machine!        ".colorize(:yellow)
  puts "==========================================".colorize(:cyan)
  puts "        Choose an option below.           "
  puts " 1) Play."
  puts " 2) See balance."
  puts " 3) Quit."
  user_input
end

def user_input
  case gets.to_i
    when 1
      play_slots
    when 2
      show_balance
    when 3
      puts
      puts "Come play again soon!"
      puts "Goodbye!"
      puts
      Exit
    else
      puts
      puts "Oops! Invalid choice. Try again."
      puts
      menu
  end
end

def show_balance
  puts
  puts "Your balace is $#@cash.".colorize(:green)
  puts
  menu
end

def play_slots
  play_once
  while @cash >0 && keep_playing
   puts
   puts "You have ended with $#@cash"
   puts "Goodbye!"
   puts
  end
end

def play_once
  results = []
  puts
  puts "Your total cash is: $#@cash".colorize(:green)
  puts
  puts "How much would you like to bet?"
  bet = gets.to_i
  puts
  puts
  puts "You must have enough cash to play. You only have $#@cash" if bet > @cash
  if bet <= @cash
    @cash -= bet
   3.times do 
    results << @symbols.sample
   end
   puts results
   winnings = bet * money_maker(results)  
   if winnings>0
     @cash += winnings
     puts "$ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $".colorize(:green)
     puts "                  You just won $#{winnings}!            ".colorize(:cyan)
     puts "$ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $".colorize(:green)
   else 
     puts
     puts "Better luck next time!"
   end
  end
 end

def keep_playing
  puts
  puts "Would you like to play again?"
  user_answer = gets.chomp.downcase
  @keep_playing_responses.each do |item|
    if item == user_answer
      play_once
    else
      menu
    end
  end
end

def money_maker(symbols)
  puts
  symbols_clone = symbols.clone
  num_of_matches = -3
  symbols.each_with_index do |emoji, index|
    #binding.pry
    symbols_clone.each_with_index do |emoji_clone, index_clone|
      if symbols[index] == symbols_clone[index_clone]
        #binding.pry
        num_of_matches +=1
      else
        next
      end
    end
  end
  return num_of_matches
end

SlotGame.new