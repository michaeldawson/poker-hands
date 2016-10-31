require 'card'
require 'ranking'

class Hand
  attr_reader :card_strings

  def initialize(card_strings)
    @card_strings = card_strings
  end

  def cards
    @cards ||= card_strings.map { |card| Card.new(card) }
  end

  def valid?
    cards.length == 5 && cards.all?(&:valid?)
  end

  def stronger_than?(other_hand)
    my_ranking = Ranking.strongest_for(self)
    their_ranking = Ranking.strongest_for(other_hand)

    my_ranking.stronger_than?(their_ranking)
  end
end
