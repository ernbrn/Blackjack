require "minitest/autorun"
require "card"

class CardTest < MiniTest::Unit::TestCase
  def setup
  end

  def test_card_was_made
    @card= Card.new(:diamonds, :A)
    assert_equal(@card.rank, :A)
  end

end
