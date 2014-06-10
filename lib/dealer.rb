require "deck"
require "hand"
require "money"

class Dealer


  def initialize
    @deck = Deck.new
    @money = Money.new
  end

  def bets=(bet)
    @money.bet(bet)
  end

  def bet
    @money.bets
  end


  def review_bets
    @money.review_bets
  end

  def out_of_money?
    if @money.money < 0
      out = true
    else out = false
    end
    out
  end

  def review_money
    @money.review_money
  end

  def clear_bets
    @money.clear_bets
  end

  def add_money(amount)
    @money.add_money(amount)
  end


  def ask_about_bets
    print "How much would you like to bet? >> $"
    amount = gets.to_i
    @money.bet(amount)
    @money.bets
  end

  def ask_if_wanna_hit
    puts "Want to hit? Yes or no."
    ans = get_answer
    if ans == true
      true
    else
      false
    end

  end

  def get_answer
    a = gets.chomp
    answer = false
    #gets the yes value regardless of case or spacing
    hit = a.strip.casecmp("yes")
    answer = true if hit == 0
    answer
  end



end
