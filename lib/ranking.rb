require 'ranking/royal_flush'
require 'ranking/straight_flush'
require 'ranking/four_of_a_kind'
require 'ranking/full_house'
require 'ranking/flush'
require 'ranking/straight'
require 'ranking/three_of_a_kind'
require 'ranking/two_pair'
require 'ranking/pair'
require 'ranking/high_card'

class Ranking
  include Comparable

  RANKINGS = [RoyalFlush, StraightFlush, FourOfAKind, FullHouse, Flush, Straight, ThreeOfAKind, TwoPair, Pair, HighCard]

  class << self
    # Take the first, best ranking that is valid for the hand
    def strongest_for(hand)
      ranking = RANKINGS.detect do |klass|
        klass.new(hand).valid?
      end

      ranking.new(hand)
    end

    def to_i
      RANKINGS.index(self)
    end

    def <=>(other)
      - (to_i <=> other.to_i)
    end

    def <(other)
      (self <=> other) == -1
    end

    def >(other)
      (self <=> other) == 1
    end
  end

  def initialize(hand)
    @hand = hand
  end

  def cards
    @cards ||= hand.cards.sort_by(&:index)
  end

  def stronger_than?(other_ranking)
    return true if self.class > other_ranking.class
    return false if self.class < other_ranking.class

    beats_same_ranking?(other_ranking)
  end

  def beats_same_ranking?(other_ranking)
    raise NotImplementedError # Implemented by subclasses
  end

  private

  attr_reader :hand

  def grouped_by_value
    cards.group_by(&:value)
  end

  def suits
    cards.map(&:suit)
  end

  def all_consecutive?
    indexes = cards.map(&:index)
    return true if indexes.each_cons(2).all? { |x, y| y == x + 1 }

    if indexes.last == 13 # We can allow an Ace to act as a one!
      indexes_with_low_ace = indexes.take(indexes.length - 1).unshift(0)
      indexes_with_low_ace.each_cons(2).all? { |x, y| y == x + 1 }
    else
      false
    end
  end

  def all_same_suit?
    suits.uniq.length == 1
  end
end
