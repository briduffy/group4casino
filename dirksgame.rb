#Bingo
#have user select  10 numbers (1..100) with a buy-in 
#have computer ganerate 10 random numbers (1..100)
#compare the user's numbers with the computers numbers
#adjust wallet to the winnings or losings

class DirksGame
  attr_accessor :user_guess, :actual, :answers, :wallet
  
  user_guess = [] 
  actual = []
  answers = 0
  wallet = 100
  
  def initialize(user_guess, actual, answers, wallet)
    user_guess = @user_guess
    actual = @actual
    answers = @answers
    wallet = @wallet
    @wallet = 100
    
end

def menu
  puts "Welcome to the Lottery." 
  puts "Pick 10 Numbers between 1 and 100."
  end

def num_guess
  @user_guess = []
  for x in 1..10
    if x > 10 then 
      next
  end
  @user_guess << gets.to_i
 
  
  end
end

def computer
  @actual = []
  for x in 1..10
    if x > 10 then 
      next
  end
  @actual << rand(1..100)
 
end
end

def sort
  @user_guess = @user_guess.sort
  @actual = @actual.sort
end


# def highest
#   prev_num = @user_numbers[0]
#   @user_numbers.each do |next_num|
#     if next_num > prev_num
#       prev_num = next_num
#     end
#   end
#   puts "The highest number is #{prev_num}"
#   @user_numbers.clear
# end
 
def different
  @answers = 0
  
  rr = @answers
  a = @user_guess[0]
   @actual.each do |next_num|
    if next_num == a
       rr += 1
    end
  end


  b = @user_guess[1]
  @actual.each do |next_num|
    if b == next_num
      rr += 1
    end
  end

  c = @user_guess[2]
    @actual.each do |next_num|
    if c == next_num
      rr += 1
    end
  end

    d = @user_guess[3]
    @actual.each do |next_num|
    if d == next_num
      rr += 1
    end
  end

    e = @user_guess[4]
    @actual.each do |next_num|
    if e == next_num
      rr += 1
    end
  end

    f = @user_guess[5]
    @actual.each do |next_num|
    if f == next_num
      rr += 1
    end
  end

    g = @user_guess[6]
    @actual.each do |next_num|
    if g == next_num
      rr += 1
    end
  end

    h = @user_guess[7]
    @actual.each do |next_num|
    if h == next_num
      rr += 1
    end
  end

    
    i = @user_guess[8]
    @actual.each do |next_num|
    if i == next_num
      rr += 1
    end
  end
  
    j = @user_guess[9]
    @actual.each do |next_num|
    if j == next_num
      rr += 1
    end
  end 
  puts "You got #{rr} right" 
  @answers += rr
end

def money
  
  ee = @wallet
  rr = @answers
  

case rr
when 0
ee = ee - 10
when 5
ee = ee * 1.5
when 6
ee = ee * 2
when 7
ee = ee * 2.5
when 8
ee = ee * 3
when 9
ee = ee * 3.5
when 10
ee = ee * 6
else
ee = ee - 5

end
  
@wallet = ee

end
def counter
  puts "You now have #{@wallet}"
  
end 
def ending
print @user_guess
puts ' '
print @actual
puts ' '
puts

end
def leaving
  puts "Would you like to leave yes or no"
  if gets.to_s.strip.downcase == "yes"
    require_relative 'maincasino'
  else
    while true
      game = DirksGame.new(@user_guess, @actual, @wallet, @answers)
      game.menu
      game.num_guess
      game.computer
      game.sort
      game.different
      game.money
      game.counter
      game.ending
      game.leaving
      # puts "You now have $#{@wallet}"
      # print @user_guess
      # puts ' '
      # print @actual
      # puts ' '
      # puts
      # @user_guess.clear
      # @actual.clear
      # @answers = 0
    end
  
  end
end
end

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
game.leaving
# print @user_guess
# puts ' '
# print @actual
# puts ' '
# puts
# @user_guess.clear
# @actual.clear 
# @answers = 0
  
  
  



#   while true
#   game.menu
#   game.num_guess
#   game.computer
#   game.sort
#   game.different
#   game.money
#   game.counter
#   game.ending
#   # puts "You now have $#{@wallet}"
#   # print @user_guess
#   # puts ' '
#   # print @actual
#   # puts ' '
#   # puts
#   # @user_guess.clear
#   # @actual.clear
#   # @answers = 0
# end


  