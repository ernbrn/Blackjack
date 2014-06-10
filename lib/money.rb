class Money

  attr_reader :bets, :money

  def initialize
    @money = 0
    @bets = 0
  end


  def bet(bets)
    @bets = bets + @bets
    @money -= bets
  end


  def add_money(amount)
    @money += amount
  end



  def clear_bets
    @bets = 0
  end

  def review_money
    puts "You have $#{@money} remaining"
  end

  def review_bets
    puts "You have $#{@bets} on the table"
  end

end
