require 'spec_helper'
require 'hand'

describe Hand do
  describe '#valid?' do
    it "returns false if there aren't five cards" do
      hand = Hand.new(%w{AH AD AS AC})
      expect(hand).not_to be_valid
    end

    it "returns false if some cards aren't valid" do
      hand = Hand.new(%w{AH AD AS AC FISH})
      expect(hand).not_to be_valid
    end
  end

  describe '#stronger_than?' do
    let(:hand) { Hand.new([]) }
    let(:other_hand) { Hand.new([]) }
    let(:lower_combination) { double(:combination, stronger_than?: false) }
    let(:higher_combination) { double(:combination, stronger_than?: true) }

    context 'when the other hand returns a stronger combination' do
      before :each do
        allow(Ranking).to receive(:strongest_for).with(hand).and_return(lower_combination)
        allow(Ranking).to receive(:strongest_for).with(other_hand).and_return(higher_combination)
      end

      it 'returns false' do
        expect(hand.stronger_than?(other_hand)).to eq(false)
      end
    end

    context 'when the other hand returns a weaker combination' do
      before :each do
        allow(Ranking).to receive(:strongest_for).with(hand).and_return(higher_combination)
        allow(Ranking).to receive(:strongest_for).with(other_hand).and_return(lower_combination)
      end

      it 'returns true' do
        expect(hand.stronger_than?(other_hand)).to eq(true)
      end
    end
  end
end
