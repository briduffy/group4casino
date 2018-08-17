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
    num1 = (random_card3.rank == 'J' || random_card3.rank == 'Q' || random_card3.rank == 'K') ? 10 : random_card3.rank
    num2 = (num1 == 'A') ? 1 : num1
    num3 = (random_card4.rank == 'J' || random_card4.rank == 'Q' || random_card4.rank == 'K') ? 10 : random_card4.rank
    num4 = (num3 == 'A') ? 1 : num3
    puts num2.to_i + num4.to_i
    puts
    puts "Your cards : 
    #{random_card.rank} of #{random_card.suit} (#{random_card.color})
    #{random_card2.rank} of #{random_card2.suit} (#{random_card2.color})"
    num1 = (random_card.rank == 'J' || random_card.rank == 'Q' || random_card.rank == 'K') ? 10 : random_card.rank
    @num2 = (num1 == 'A') ? 1 : num1
    num3 = (random_card2.rank == 'J' || random_card2.rank == 'Q' || random_card2.rank == 'K') ? 10 : random_card2.rank
    @num4 = (num3 == 'A') ? 1 : num3
    puts @num2.to_i + @num4.to_i
  end

  def results
    if @num2 > @num4
        puts "Sorry you lose!"
    elsif @num2 == @num4
        puts "It is a draw"
    else
        puts "You win!"
    end
  end

end

d = Deck.new
puts d.results
#puts d.cards