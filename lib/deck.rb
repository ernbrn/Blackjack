require "card"
#this class assembles the deck
class Deck
  def initialize
    @deck = []
    @suits = [:spades, :hearts, :clubs, :diamonds]
    @numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, :J, :Q, :K, :A]
    # @card = Card.new
  end

  attr_reader :rank, :suit, :deck



  def push_to_deck(card)
    @deck.push(card)
  end

  def make_deck
    @suits.each do |s|
      @numbers.each do |r|
        @card = Card.new(s,r)
        push_to_deck(@card)
      end
    end
  end



  def shuffle_deck
    @deck_shuffled = @deck.shuffle
    @deck_shuffled
end

def get_shuffled_deck
  @deck_shuffled
end
end
