require "minitest/autorun"
require "deck"

class DeckTest < MiniTest::Unit::TestCase
  def setup
    @deck = Deck.new
    @deck.make_deck
  end

  def test_make_deck

    assert_equal @deck.deck.size, 52
    puts @deck.inspect
  end

  def test_deck_shuffle
    refute(@deck.deck.eql?(@deck.get_shuffled_deck), "Not shuffled")
  end

end
