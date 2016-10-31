require 'hand'
require 'byebug'
class HandEvaluator
  def return_stronger_hand(left, right)
    left_hand = Hand.new(left)
    right_hand = Hand.new(right)

    return left_hand.card_strings if left_hand.stronger_than?(right_hand)
    return right_hand.card_strings if right_hand.stronger_than?(left_hand)
  end
end
