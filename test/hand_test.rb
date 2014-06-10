require "minitest/autorun"
require "hand"
require "deck"
require "card"

class HandTest < MiniTest::Unit::TestCase
  def setup
    @hand = Hand.new
  end

#tests the first deal is 2 cards

  def test_get_dealt
    @hand.get_dealt
    assert_equal(@hand.my_hand.size, 2)
    @hand.card_value_inspect(@hand.my_hand)
    @hand.hand_inspect
  end

#tests that the hit is 1 card

  def test_get_hit
    @hand.get_hit
    assert_equal(1, @hand.my_hand.size )
  end

  def test_face_cards_become_numbers
    @hand = Hand.new
    card_1 = Card.new(:diamonds, :K)
    card_array = [card_1]
    @hand.set_hand = card_array
    value = @hand.card_value_inspect(@hand.my_hand)
    assert_equal(10, value)

  end

#this is testing that you can test the card value
#and get sum of ranks back
  def test_aces_can_equal_11
    @hand = Hand.new
    card_1 = Card.new(:diamonds, :A)
    card_2 = Card.new(:hearts, 4)
    card_array = [card_1, card_2]
    @hand.set_hand = card_array
    my_hand = @hand.my_hand
    assert_equal(2, my_hand.size)

    puts @hand.card_value_inspect(my_hand)
    assert_equal(15, @hand.card_value_inspect(my_hand))
  end

  def test_aces_can_equal_1
    @hand = Hand.new
    card_1 = Card.new(:diamonds, :A)
    card_2 = Card.new(:hearts, 5)
    card_3 = Card.new(:clubs, 6)
    card_array = [card_1, card_2, card_3]
    @hand.set_hand = card_array
    my_hand = @hand.my_hand
    assert_equal(3, my_hand.size)

    puts @hand.card_value_inspect(my_hand)
    assert_equal(12, @hand.card_value_inspect(my_hand))
  end

  def test_aces_can_equal_different_numbers
    @hand = Hand.new
    card_1 = Card.new(:diamonds, :A)
    card_2 = Card.new(:hearts, 5)
    card_3 = Card.new(:clubs, 5)
    card_4 = Card.new(:spades, :A)
    card_array = [card_1, card_2, card_3, card_4]
    @hand.set_hand = card_array
    my_hand = @hand.my_hand
    assert_equal(4, my_hand.size)

    puts @hand.card_value_inspect(my_hand)
    assert_equal(22, @hand.card_value_inspect(my_hand))
  end

  def test_two_aces_dont_bomb
    @hand = Hand.new
    card_1 = Card.new(:diamonds, :A)
    card_2 = Card.new(:hearts, :A)
    card_array = [card_1, card_2]
    @hand.set_hand = card_array
    my_hand = @hand.my_hand
    assert_equal(2, my_hand.size)
    puts @hand.card_value_inspect(my_hand)
    assert_equal(12, @hand.card_value_inspect(my_hand))
  end
end
