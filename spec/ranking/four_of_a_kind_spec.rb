require 'spec_helper'
require 'hand'
require 'ranking'
require 'ranking/four_of_a_kind'

RSpec.describe Ranking::FourOfAKind do
  describe '#top_card_value' do
    it 'returns the right card value' do
      ranking = Ranking::FourOfAKind.new(Hand.new(%w{AH AD AC AS 9H}))
      expect(ranking.top_card_value).to eq(13)
    end
  end

  describe '#beats_same_ranking?' do
    it 'handles higher four of a kinds' do
      ranking1 = Ranking::FourOfAKind.new(Hand.new(%w{AH AD AC AS 9H}))
      ranking2 = Ranking::FourOfAKind.new(Hand.new(%w{KH KD KC KS 9H}))

      expect(ranking1.beats_same_ranking?(ranking2)).to eq(true)
    end
  end
end
