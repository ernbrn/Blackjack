require 'deck'
require 'card'
class Hand
  def initialize
    @deck = Deck.new
    @deck.make_deck
    @deck.shuffle_deck
    @shuffled_deck = @deck.shuffle_deck
    @my_hand = []
  end

#this method is for testing purposes
  def set_hand=(array)
    @my_hand = array
  end

  def get_dealt
    2.times do
      @my_hand.push(@shuffled_deck.pop)
    end

  end

  def get_hit
    1.times do
      @my_hand.push(@shuffled_deck.pop)
    end
  end

  def get_hand
    @my_hand
  end

  def hand_inspect
    size = @my_hand.size
    puts "Here's what's in your hand: "
    size.times { |x| puts "#{@my_hand[x]}" }
  end

  def face_card_ranks(rank)
    if rank == :K
      this_rank = 10
    elsif rank == :Q
      this_rank = 10
    elsif rank == :J
      this_rank = 10
    else
      this_rank = rank
  end
    this_rank
end

  def card_value_inspect(hand)
    @hand_size = hand.size
    @card_value = 0
    @card_value = evaluate_non_aces(@card_value, hand)
    @card_value = evaluate_aces(@card_value, hand)
  end

  def get_card_value
    @card_value
  end

  def over_21?(card_value)
    if card_value > 21
      over = true
    else
      over = false
    end
    over
  end





  def twenty_one?(card_value)
    if card_value == 21
      win = true
    end
    win
  end


  def evaluate_aces(card_value, hand)
    # makes ace 11 or 1
    @hand_size.times do |i|
    this_card = hand[i]
    the_rank = this_card.rank
    if the_rank == :A
      if card_value < 11
        the_rank = 11
      else
        the_rank = 1
      end
      card_value += the_rank
    end
  end
  card_value
  end

  def black_jack?
    black_jack = false
    if get_hand.size == 2 && get_card_value == 21
      black_jack = true
    end
    black_jack
  end

  def evaluate_non_aces(card_value, hand)
    @hand_size.times do |i|
      this_card = hand[i]
      the_rank = this_card.rank
      the_rank = face_card_ranks(the_rank)
      if the_rank != :A
        card_value += the_rank
      end
    end
    card_value
  end
end
