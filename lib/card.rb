
# this method assembles the deck
class Card

  def initialize(suit,rank)
    @suit = suit
    @rank = rank
  end

  def rank
    @rank
  end

  def suit
    @suit
  end

  def to_s
   "#{@rank} #{@suit}"
  end
end
