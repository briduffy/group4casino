# require_relative 'cards'
require 'pry'
require 'colorize'

class Card
  attr_accessor :rank, :suit, :color

  def initialize(rank, suit, color)
    @rank = rank
    @suit = suit
    @color = color
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    @suits = %w(Spades Diamonds Clubs Hearts)
    @cards = []
    @card_array = []
    @card_array_dealer = []
    generate_deck
  end

  def generate_deck
    @suits.each do |suit|
      @ranks.size.times do |i|
        color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red'
        @cards << Card.new(@ranks[i], suit, color)
      end
    end
    shuffle_cards
  end

  def shuffle_cards
    @shuffle = @cards.shuffle
    card_deal
  end


  def card_deal
    random_card = @shuffle.sample
    random_card2 = @shuffle.sample
    random_card3 = @shuffle.sample
    random_card4 = @shuffle.sample
    puts "Dealer Cards :
    #{random_card3.rank} of #{random_card3.suit} (#{random_card3.color})
    #{random_card4.rank} of #{random_card4.suit} (#{random_card4.color})"
    dealer_face_card1 = (random_card3.rank == 'J' || random_card3.rank == 'Q' || random_card3.rank == 'K') ? 10 : random_card3.rank
    @dealer_card1 = (dealer_face_card1 == 'A') ? 1 : dealer_face_card1
    dealer_face_card2 = (random_card4.rank == 'J' || random_card4.rank == 'Q' || random_card4.rank == 'K') ? 10 : random_card4.rank
    @dealer_card2 = (dealer_face_card2 == 'A') ? 1 : dealer_face_card2
    if random_card3 != random_card && random_card2 && random_card4
        @dealer_total = @dealer_card1.to_i + @dealer_card2.to_i
        puts @dealer_total
        puts
    else
        card_deal
    end
    puts "Your cards : 
    #{random_card.rank} of #{random_card.suit} (#{random_card.color})
    #{random_card2.rank} of #{random_card2.suit} (#{random_card2.color})"
    user_face_card1 = (random_card.rank == 'J' || random_card.rank == 'Q' || random_card.rank == 'K') ? 10 : random_card.rank
    #Need to try and figure out how to make Ace == 11 or 1
    @user_card1 = (user_face_card1 == 'A') ? 1 : user_face_card1
    user_face_card2 = (random_card2.rank == 'J' || random_card2.rank == 'Q' || random_card2.rank == 'K') ? 10 : random_card2.rank
    @user_card2 = (user_face_card2 == 'A') ? 1 : user_face_card2
    if random_card != random_card2 && random_card3 && random_card4
        @user_total = @user_card1.to_i + @user_card2.to_i
            puts @user_total
    else
        card_deal
    end
    user_selection
  end

  def user_hit_total
    @card_array << @user_hit_card.to_i
    total = 0
    @card_array.each do |num|
        total += num
    end  
    puts 'Your total is now:' 
    @new_total = total + @user_total.to_i
    puts @new_total
    card_hand_menu
  end

  def dealer_hit_total
    @card_array_dealer << @dealer_hit_card.to_i
    total2 = 0
    @card_array_dealer.each do |num2|
        total2 += num2
    end  
    puts 'Dealer total is now:' 
    @new_dealer_total = total2 + @dealer_total.to_i
    puts @new_dealer_total
    if @new_dealer_total < 17 
        dealer_hit
    elsif @new_dealer_total <= 21
        puts @new_dealer_total
        comparison
    else
        puts "Dealer Bust!"
        puts "You won!"
        result_menu
    end
  end

  def comparison
    case
    when @new_total || @user_total > @new_dealer_total 
        puts "You Win!"
        result_menu
    when @new_total || @user_total < @new_dealer_total 
        puts "You Lose"
        result_menu
    else
        puts "Its a push!"
        result_menu
    end
  end

  def user_hit
    hit_card = @shuffle.sample
    puts "Your hit card #{hit_card.rank} #{hit_card.suit} #{hit_card.color}"
    user_hit1 = (hit_card.rank == 'J' || hit_card.rank == 'Q' || hit_card.rank == 'K') ? 10 : hit_card.rank
    @user_hit_card = (user_hit1 == 'A') ? 1 : user_hit1
    if @user_hit_card != @user_card1 && @user_card2 && @dealer_card1 && @dealer_card2
        user_hit_total
    else
        user_hit
    end
  end

  def quick_stay
    case
    when @user_total > @dealer_total
        puts 'You Win!'
    when @user_total < @dealer_total
        puts 'You Lose!'
    else
        puts "Its a push!"
    end
  end

  def dealer_hit
    if @card_array != []
        hit_card = @shuffle.sample
        puts "Dealer hit card #{hit_card.rank} #{hit_card.suit} #{hit_card.color}"
        dealer_hit1 = (hit_card.rank == 'J' || hit_card.rank == 'Q' || hit_card.rank == 'K') ? 10 : hit_card.rank
        @dealer_hit_card = (dealer_hit1 == 'A') ? 1 : dealer_hit1
        if @dealer_hit_card != @user_card1 && @user_card2 && @dealer_card1 && @dealer_card2 && @user_hit_card
            dealer_hit_total
        else
            dealer_hit
        end
    elsif @dealer_total < 17
        hit_card = @shuffle.sample
        puts "Dealer hit card #{hit_card.rank} #{hit_card.suit} #{hit_card.color}"
        dealer_hit1 = (hit_card.rank == 'J' || hit_card.rank == 'Q' || hit_card.rank == 'K') ? 10 : hit_card.rank
        @dealer_hit_card = (dealer_hit1 == 'A') ? 1 : dealer_hit1
        if @dealer_hit_card != @user_card1 && @user_card2 && @dealer_card1 && @dealer_card2 
            dealer_hit_total
        else
            dealer_hit
        end
    else
        quick_stay
    end
  end

  def card_hand_menu
    if @new_total <= 21
    puts 'What would you like to do with your hand now?
        1) Hit again
        2) Stay'
        choice = gets.to_i
        case choice
        when 1 
            user_hit
        when 2
            puts 'You stayed'
            dealer_hit
        else
            puts 'Invalid Choice'
        end
    else
        puts "You Bust!"
        result_menu
    end
  end

  def user_selection
    puts 'What would you like to do with your hand?
        1) Hit
        2) Stay
        3) Exit'
        # Add split and double down after confirming the rules.
        # 3) Split
        # 4) Double Down
    choice = gets.to_i
    case choice
    when 1
        puts "You hit"
        user_hit
    when 2
        dealer_hit
    when 3
        exit
    end
    end

def result_menu
    puts 'What would you like to do with your hand?
        1) Play Again?
        2) Exit'
        choice =gets.to_i
        case choice
    when 1
        d = Deck.new
    when 2
        exit
    end
end


  def results
    if @dealer_total > @user_total
        puts "Sorry you lose!"
    elsif @dealer_total == @user_total
        puts "It is a draw"
    else
        puts "You win!"
    end
  end

end

d = Deck.new
#puts d.results
#puts d.cards