require 'spec_helper'
require 'hand'
require 'ranking'
require 'ranking/pair'

RSpec.describe Ranking::TwoPair do
  describe '#top_pair_value' do
    it 'returns the right card value' do
      ranking = Ranking::TwoPair.new(Hand.new(%w{AH AD TC TS 6H}))
      expect(ranking.top_pair_value).to eq(13)
    end
  end

  describe '#beats_same_ranking?' do
    it 'handles higher pairs' do
      ranking1 = Ranking::TwoPair.new(Hand.new(%w{AH AD TC 9S 5H}))
      ranking2 = Ranking::TwoPair.new(Hand.new(%w{KH KD TC 9S 5H}))

      expect(ranking1.beats_same_ranking?(ranking2)).to eq(true)
      expect(ranking2.beats_same_ranking?(ranking1)).to eq(false)
    end
  end
end
