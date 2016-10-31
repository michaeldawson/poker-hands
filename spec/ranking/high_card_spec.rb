require 'spec_helper'
require 'hand'
require 'ranking'
require 'ranking/high_card'

RSpec.describe Ranking::HighCard do
  describe '#top_card_value' do
    it 'returns the right card value' do
      ranking = Ranking::HighCard.new(Hand.new(%w{AH JD TC 9S 6H}))
      expect(ranking.top_card_value).to eq(13)
    end
  end

  describe '#beats_same_ranking?' do
    it 'handles higher full houses' do
      ranking1 = Ranking::HighCard.new(Hand.new(%w{AH QD TC 9S 5H}))
      ranking2 = Ranking::HighCard.new(Hand.new(%w{KH JD TC 9S 5H}))

      expect(ranking1.beats_same_ranking?(ranking2)).to eq(true)
    end
  end
end
