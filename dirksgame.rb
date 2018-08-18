#Bingo
#have user select  10 numbers (1..100) with a buy-in 
#have computer ganerate 10 random numbers (1..100)
#compare the user's numbers with the computers numbers
#if user gets one number correct then play 1/5 of what they put in and so on
# if user gets five numbers correct then play users all what they put in. More numbers user pays in + numbers got right/5 of what they paid in

@user_guess = [] 
@actual = []
@answers = 0
@wallet = 100
def menu
  puts "Welcome to the Lottery." 
  puts "Pick 10 Numbers between 1 and 100."
  end

def num_guess
  for x in 1..10
    if x > 10 then 
      next
  end
  @user_guess << gets.to_i
 
  
  end
end
#To compare arrays
def computer
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
  ee = 100
  tt =
  
  case @answers
  when @answers == 0
  ee = ee - 10
  when @answers < 5
  ee = ee - 5
  when @answers == 5
  ee = ee * 1.5
  when @answers == 6
  @wallet * 2
  when @answers == 7
  @wallet * 2.5
  when @answers == 8
  @wallet * 3
  when @answers == 9
  @wallet * 3.5
  when @answers == 10
  @wallet * 6
end
@wallet = ee
end
  
  
  
  
  
  
  
  
  
while true
  menu
  num_guess
  computer
  sort
  different
  #money
  puts "You now have #{@wallet}"
  print @user_guess
  puts ' '
  print @actual
  puts ' '
  puts
  @user_guess.clear
  @actual.clear
end


  