require 'spec_helper'
require 'hand'
require 'ranking'
require 'ranking/straight'

RSpec.describe Ranking::Straight do
  describe '#top_card_value' do
    it 'returns the right card value' do
      ranking = Ranking::Straight.new(Hand.new(%w{AH KD QC JS TH}))
      expect(ranking.top_card_value).to eq(13)
    end
  end

  describe '#beats_same_ranking?' do
    it 'handles higher full houses' do
      ranking1 = Ranking::Straight.new(Hand.new(%w{AH KD QC JS TH}))
      ranking2 = Ranking::Straight.new(Hand.new(%w{KH QD JC TS 9H}))

      expect(ranking1.beats_same_ranking?(ranking2)).to eq(true)
    end
  end
end
