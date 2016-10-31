require 'spec_helper'
require 'hand'
require 'ranking'
require 'ranking/full_house'

RSpec.describe Ranking::FullHouse do
  describe '#top_card_value' do
    it 'returns the right card value' do
      ranking = Ranking::FullHouse.new(Hand.new(%w{AH AD AC 9S 9H}))
      expect(ranking.top_card_value).to eq(13)
    end
  end

  describe '#beats_same_ranking?' do
    it 'handles higher full houses' do
      ranking1 = Ranking::FullHouse.new(Hand.new(%w{AH AD AC 9S 9H}))
      ranking2 = Ranking::FullHouse.new(Hand.new(%w{KH KD KC 9S 9H}))

      expect(ranking1.beats_same_ranking?(ranking2)).to eq(true)
    end
  end
end
