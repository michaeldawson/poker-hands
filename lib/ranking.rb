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

  def values
    hand.cards.map(&:value)
  end

  def grouped_values
    values.group_by(&:to_s)
  end

  def suits
    hand.cards.map(&:suit)
  end

  def all_consecutive?
    indexes = values.map { |value| Card::VALUES.index(value) || -1 }
    indexes.sort.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def all_same_suit?
    suits.uniq.length == 1
  end
end
