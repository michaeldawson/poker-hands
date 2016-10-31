require 'spec_helper'
require 'hand'
require 'ranking'
require 'ranking/three_of_a_kind'

RSpec.describe Ranking::ThreeOfAKind do
  describe '#triple_value' do
    it 'returns the right card value' do
      ranking = Ranking::ThreeOfAKind.new(Hand.new(%w{AH AD AC TS 6H}))
      expect(ranking.triple_value).to eq(13)
    end
  end

  describe '#beats_same_ranking?' do
    it 'handles higher triples' do
      ranking1 = Ranking::ThreeOfAKind.new(Hand.new(%w{AH AD AC 9S 5H}))
      ranking2 = Ranking::ThreeOfAKind.new(Hand.new(%w{KH KD KC 9S 5H}))

      expect(ranking1.beats_same_ranking?(ranking2)).to eq(true)
    end
  end
end
