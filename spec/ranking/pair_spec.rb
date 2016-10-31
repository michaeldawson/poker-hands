require 'spec_helper'
require 'hand'
require 'ranking'
require 'ranking/pair'

RSpec.describe Ranking::Pair do
  describe '#pair_value' do
    it 'returns the right card value' do
      ranking = Ranking::Pair.new(Hand.new(%w{AH AD TC 9S 6H}))
      expect(ranking.pair_value).to eq(13)
    end
  end

  describe '#top_kicker_value' do
    it 'returns the right card value' do
      ranking = Ranking::Pair.new(Hand.new(%w{AH AD TC 9S 6H}))
      expect(ranking.top_kicker_value).to eq(9)
    end
  end

  describe '#beats_same_ranking?' do
    it 'handles higher pairs' do
      ranking1 = Ranking::Pair.new(Hand.new(%w{AH AD TC 9S 5H}))
      ranking2 = Ranking::Pair.new(Hand.new(%w{KH KD TC 9S 5H}))

      expect(ranking1.beats_same_ranking?(ranking2)).to eq(true)
    end

    it 'handles higher kickers' do
      ranking1 = Ranking::Pair.new(Hand.new(%w{AH AD TC 9S 5H}))
      ranking2 = Ranking::Pair.new(Hand.new(%w{AS AC JC 9S 5H}))

      expect(ranking1.beats_same_ranking?(ranking2)).to eq(false)
      expect(ranking2.beats_same_ranking?(ranking1)).to eq(true)
    end
  end
end
