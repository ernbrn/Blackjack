
# this method assembles the deck
class Card

  attr_reader :rank, :suit

  def initialize(suit,rank)
    @suit = suit
    @rank = rank
  end

  def to_s
   "#{@rank} #{@suit}"
  end
end
