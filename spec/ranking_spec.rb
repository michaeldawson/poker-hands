require 'spec_helper'
require 'ranking'
require 'hand'

RSpec.describe Ranking do
  describe '#>' do
    it 'returns true when comparing agains a lesser ranking class' do
      expect(Ranking::RoyalFlush > Ranking::Pair).to eq(true)
    end
  end

  describe '.strongest_for' do
    it 'returns a royal flush correctly' do
      expect(Ranking.strongest_for(Hand.new(%w{AH KH QH JH TH}))).to be_a Ranking::RoyalFlush
    end

    it 'returns a straight flush correctly' do
      expect(Ranking.strongest_for(Hand.new(%w{KH QH JH TH 9H}))).to be_a Ranking::StraightFlush
    end

    it 'returns a four of a kind correctly' do
      expect(Ranking.strongest_for(Hand.new(%w{KH KD KC KS 9H}))).to be_a Ranking::FourOfAKind
    end

    it 'returns a full house correctly' do
      expect(Ranking.strongest_for(Hand.new(%w{KH KD KC 9S 9H}))).to be_a Ranking::FullHouse
    end

    it 'returns a flush correctly' do
      expect(Ranking.strongest_for(Hand.new(%w{AH QH JH TH 9H}))).to be_a Ranking::Flush
    end

    it 'returns a straight correctly' do
      expect(Ranking.strongest_for(Hand.new(%w{KS QH JH TH 9H}))).to be_a Ranking::Straight
    end

    it 'returns an ace-low straight correctly' do
      expect(Ranking.strongest_for(Hand.new(%w{5S 4H 3H 2H AH}))).to be_a Ranking::Straight
    end

    it 'returns three of a kind correctly' do
      expect(Ranking.strongest_for(Hand.new(%w{KS KH KD TH 9H}))).to be_a Ranking::ThreeOfAKind
    end

    it 'returns two pair correctly' do
      expect(Ranking.strongest_for(Hand.new(%w{KS KH TD TH 9H}))).to be_a Ranking::TwoPair
    end

    it 'returns a pair correctly' do
      expect(Ranking.strongest_for(Hand.new(%w{KS KH 7D TH 9H}))).to be_a Ranking::Pair
    end

    it 'returns a high card correctly' do
      expect(Ranking.strongest_for(Hand.new(%w{KH QH JH TH 8S}))).to be_a Ranking::HighCard
    end
  end
end
