require "minitest/autorun"
require "money"

class MoneyTest < MiniTest::Unit::TestCase
  def setup
    @money = Money.new
  end

  def test_money_is_100_dollars
    assert_equal(@money.get_money, 100)
  end

  def test_bet_is_10_dollars
    @money.bet(10)
    assert_equal(@money.get_bets, 10)
  end

  def test_money_after_bets
    setup
    assert_equal(@money.get_money, 100)
    @money.bet(10)
    assert_equal(90,@money.get_money)
    @money.bet(10)
    assert_equal(@money.get_money, 80)
  end

  def test_bets_after_bets
    assert_equal(@money.get_bets, 0)
    @money.bet(10)
    assert_equal(@money.get_bets, 10)
    @money.bet(90)
    assert_equal(@money.get_bets, 100)
  end

  def test_clear_bets
    assert_equal(@money.get_bets, 0)
    @money.bet(10)
    @money.clear_bets
    assert_equal(@money.get_bets, 0)
    @money.bet(30)
    assert_equal(@money.get_bets, 30)
  end


end
