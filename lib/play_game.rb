require "deck"
require "hand"
require "money"
require "dealer"

class PlayGame

  def initialize
    @player = Hand.new
    @dealer_hand = Hand.new
    @dealer = Dealer.new
    @dealer.add_money(100)
  end

  def play

    play_again = true
    while play_again == true
    @player = Hand.new
    @dealer_hand = Hand.new
    @dealer.clear_bets
   break if get_bets == true
    @player.get_dealt
    @dealer_hand.get_dealt
    betting_and_hitting
    play_again = play_again?
   end
   puts "You are broke, just go home."
 end

   def play_again?
     puts "Would you like to keep playing? Yes or no."
     play_again = @dealer.get_answer
   end

     def betting_and_hitting
       game_over = false
       while game_over != true
       @player.hand_inspect
      break if get_bets == true
       player_hit?
       dealer_hit?(@dealer_hand)
       if show_cards == true
         find_score
         game_over = true
       end
       game_over
     end
   end

     def find_score
       @player.card_value_inspect(@player.get_hand)
       @dealer_hand.card_value_inspect(@dealer_hand.get_hand)
       d_val = @dealer_hand.get_card_value
       p_val = @player.get_card_value
       bets = @dealer.get_bets
       bets = bets * 2


       if p_val > 21 && d_val < 22
       puts  "You bust with #{p_val}. The dealer had #{d_val}. Game over"
     elsif p_val > d_val || d_val > 21 && p_val < 22
         puts "You win with #{p_val}! The dealer had #{d_val}. You won $#{bets}"
         bets = @dealer.get_bets
         money = (bets * 2)
         @dealer.add_money(money)
         @dealer.review_money
       elsif
         p_val < d_val && d_val < 22
         puts "Uh oh. Looks like you lost. You had #{p_val} and the dealer had #{d_val}."
       elsif p_val == d_val
         puts "Looks like you and the dealer tied. You had #{p_val} and the dealer had #{d_val} The game is a push."
         @dealer.add_money(@dealer.get_bets)
       else
         puts "Looks like you and the dealer both bust. You had #{p_val} and the dealer had #{d_val} The game is a push."
         @dealer.add_money(@dealer.get_bets)

       end

     end




    def show_cards
      puts "Ready to show your hand? Yes or no."
      ans = @dealer.get_answer
      ans
    end


  def get_dealer_hand
    @dealer_hand.get_hand
  end

  def get_dealer_ob
    @dealer_hand
  end

  def winning_hand?(hand_ob)
     a = hand_ob.twenty_one?(hand_ob.get_card_value)
     b = false
     if a == true
      a
    else
      b
    end
  end


  def player_hit?
    hit = @dealer.ask_if_wanna_hit
    if hit == true
      @player.get_hit
      @player.hand_inspect
    end
  end

  def dealer_hit?(hand_ob)
    if hand_ob.card_value_inspect(hand_ob.get_hand) < 17
      hand_ob.get_hit
    end
  end


  def get_bets
    @dealer.ask_about_bets
    bets = @dealer.get_bets
    @dealer.review_bets
    @dealer.review_money
    out = @dealer.out_of_money?
    out

  end

end
