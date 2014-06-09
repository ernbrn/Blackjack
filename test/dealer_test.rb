require "minitest/autorun"
require "hand"
require "deck"
require "dealer"

class DealerTest < MiniTest::Unit::TestCase
  def setup
    @dealer = Dealer.new
  end

  def test_ask_if_wanna_hit
    setup
    answer = @dealer.ask_if_wanna_hit
    assert_equal(true, answer)

  end

end
