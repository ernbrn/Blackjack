require "minitest/autorun"
require "hand"
require "play_game"
require "dealer"
require "card"

class PlayGameTest < MiniTest::Unit::TestCase
  def setup
    @hand = Hand.new
    @player = PlayGame.new
    @hand.get_dealt
    @dealer = Dealer.new
  end

  def test_player_gets_dealt
    setup
    assert_equal(2, @hand.my_hand.size)
  end

  def test_player_gets_hit
    setup
    @hand.get_hit
    assert_equal(@hand.my_hand.size, 3)
  end

  def test_player_bets
    setup
    @dealer.bets = 10
    @dealer.review_bets
    assert_equal(10, @dealer.bet)
    #bet again, should have stored the first bet
    @dealer.bets = 10
    assert_equal(20, @dealer.bet)
    @dealer.review_bets
  end

  def test_dealer_hits
    handdealer = Hand.new
    card_1 = Card.new(:diamonds, :A)
    card_2 = Card.new(:spades, 2)
    card_array = [card_1, card_2]
    handdealer.set_hand = card_array
    dealer_hand = handdealer.my_hand
    assert_equal(2, dealer_hand.size)
    handdealer.card_value_inspect(dealer_hand)
    @player.dealer_hit?(handdealer)
    assert_equal(3, dealer_hand.size)
  end

  def test_twenty_one_not_black_jack
    setup
    handdealer = Hand.new
    card_1 = Card.new(:diamonds, :A)
    card_2 = Card.new(:spades, :J)
    card_3 = Card.new(:clubs, 10)
    card_array = [card_1, card_2, card_3]
    handdealer.set_hand = card_array
    dealer_hand = handdealer.my_hand
    handdealer.card_value_inspect(dealer_hand)
    handdealer.hand_inspect
    card_value = handdealer.card_value
    puts card_value
    assert_equal(true, handdealer.twenty_one?(card_value))
    assert_equal(false, handdealer.black_jack?)
    #test winning_hand
    assert_equal(true,@player.winning_hand?(handdealer))
  end

  def test_twenty_one_and_black_jack
    setup
    handdealer = Hand.new
    card_1 = Card.new(:diamonds, :A)
    card_2 = Card.new(:spades, :J)
    card_array = [card_1, card_2]
    handdealer.set_hand = card_array
    dealer_hand = handdealer.my_hand
    handdealer.card_value_inspect(dealer_hand)
    handdealer.hand_inspect
    card_value = handdealer.card_value
    puts card_value
    assert_equal(true, handdealer.twenty_one?(card_value))
    assert_equal(true, handdealer.black_jack?)
    #test winning hand
    assert_equal(true,@player.winning_hand?(handdealer))
  end



  def test_card_value_not_over_21
    setup
    handdealer = Hand.new
    card_1 = Card.new(:diamonds, :A)
    card_2 = Card.new(:spades, 2)
    card_array = [card_1, card_2]
    handdealer.set_hand = card_array
    dealer_hand = handdealer.my_hand
    handdealer.card_value_inspect(dealer_hand)
    card_value = handdealer.card_value
    assert_equal(false, handdealer.over_21?(card_value))
    #test winning hand = false
    assert_equal(false,@player.winning_hand?(handdealer))
  end

  def test_card_value_over_21
    setup
    handdealer = Hand.new
    card_1 = Card.new(:diamonds, :J)
    card_2 = Card.new(:spades, :K)
    card_3 = Card.new(:clubs, :J)
    card_array = [card_1, card_2, card_3]
    handdealer.set_hand = card_array
    dealer_hand = handdealer.my_hand
    handdealer.card_value_inspect(dealer_hand)
    card_value = handdealer.card_value
    assert_equal(true, handdealer.over_21?(card_value))
    # test winning hand = false
    assert_equal(false, @player.winning_hand?(handdealer))
  end

  def test_show_cards
    setup
    ans = @player.show_cards
    assert_equal(true, ans)
  end

  def test_dealer_does_not_hit
    handdealer = Hand.new
    card_1 = Card.new(:diamonds, :J)
    card_2 = Card.new(:spades, :K)
    card_array = [card_1, card_2]
    handdealer.set_hand = card_array
    dealer_hand = handdealer.my_hand
    assert_equal(2, dealer_hand.size)
    handdealer.card_value_inspect(dealer_hand)
    @player.dealer_hit?(handdealer)
    assert_equal(2, dealer_hand.size)
  end
end
